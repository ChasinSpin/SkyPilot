// Generic PA with filament Taulman 645
//      100% fill
//      No Support
//      0.08 Extra Fine (layer height)
//      Smooth PEI Plate, use Glue Stick
//      Quality/Advanced:
//          Order of walls: Outer/Inner
//          Avoid cross wall: Checked
//          Avoid crossing wall max detour length: 50mm
//      Strength:
//          Wall Loops: 3
//          Sparse Infill Density: 100%
//          Sparse Infill Pattern: Rectilinear
//
// M3 Nut and grub screw
//
// Important, scale up model by 1.8% to allow for shrinkage
// Outer diameter should be 22.225mm

manifoldCorrection      = 0.01;
manifoldCorrection2     = manifoldCorrection * 2;



byersSpurGear(teeth=40, diametralPitch=48, pressureAngle=20.0, gearThickness=4.78, hubThickness=5.3, hubDiameter=16.73, boreDiameter=5.0+0.2, insertHoleDiameter=3.0+0.3, flangeInsertDepth = 0.4, retainingNutDiameter = 6.0 + 0.3, retainingNutThickness = 2.3 + 0.3, retainingNutOffsetX = -3.8, insertHoleOffsetZ = -0.7);



module byersSpurGear(teeth, diametralPitch, pressureAngle, gearThickness, hubThickness, hubDiameter, boreDiameter, insertHoleDiameter, flangeInsertDepth, retainingNutDiameter, retainingNutThicknessretainingNutDiameter, retainingNutThickness = 2.3 + 0.3, retainingNutOffsetX, insertHoleOffsetZ)
{
    difference()
    {
        union()
        {
            difference()
            {
                union()
                {
                    linear_extrude(gearThickness)
                        spur_gear(teeth, P = diametralPitch, pa = pressureAngle);
    
                    translate( [0, 0, gearThickness] )
                        cylinder(d = hubDiameter, h = hubThickness, $fn = 40);
                }
    
                translate( [0, 0, -manifoldCorrection] )
                    cylinder(d = boreDiameter, h = gearThickness + hubThickness + manifoldCorrection2, $fn = 40);
            }
        
            translate( [boreDiameter/2 - flangeInsertDepth, -boreDiameter/2, 0] )
                cube( [boreDiameter/2, boreDiameter, gearThickness + hubThickness] );
        }
        
        translate( [hubDiameter/2, 0, gearThickness + hubThickness/2 + insertHoleOffsetZ] )
            rotate( [0, 90, 0] )
                cylinder( d = insertHoleDiameter, h = hubDiameter + manifoldCorrection2, center = true, $fn = 40 );
        
        translate( [hubDiameter/2 + retainingNutOffsetX, 0, gearThickness + hubThickness/2 + insertHoleOffsetZ] )
            rotate( [0, 90, 0] ) 
            {
                cylinder(d = retainingNutDiameter, h = retainingNutThickness, center = true, $fn = 6);
                translate( [0, -retainingNutDiameter/2 * 0.865, retainingNutThickness/2] )
                    rotate( [0, 180, 0] )
                        cube( [10, retainingNutDiameter * 0.865, retainingNutThickness] );
            }   
    }
    
}

/**
    Constants
**/
in_to_mm = 25.4;
rad_to_deg = 180 / PI;
deg_to_rad = PI / 180;

/**
	Functions
**/
function parametric_points(fx, fy, t0=0, t1=10, delta=0.01) 
= [for(i = [t0:delta:t1]) [fx(i), fy(i)]];

function reverse(vector)
= [for(i = [1:len(vector)]) vector[len(vector) - i]];

/**
	Maths
**/
function calc_module(P) = in_to_mm / P;
function calc_addendum(P) = (1/P) * in_to_mm;
function calc_dedendum(P) = (1.25/P) * in_to_mm;
function calc_dp(N, P) = (N/P) * in_to_mm;
function calc_db(N, P, pa) = calc_dp(N,P) * cos(pa);
function calc_dr(N, P) = calc_dp(N,P) - 2 * calc_dedendum(P);
function calc_circular_pitch(P) = (PI / P) * in_to_mm;
function calc_thickness(P) = (1.5708 / P) * in_to_mm;
function calc_alpha(dp, db, pa) = ((sqrt(pow(dp,2) - pow(db,2))/db) * rad_to_deg - pa);
function calc_clearance(P) = calc_dedendum(P) - calc_addendum(P);
function calc_center_distance(N1, N2, P) = in_to_mm * (N1 + N2) /(2 * P);

/**
	Modules
**/
/**
    Given some parameters, this method will generate a spur gear
    with an involute curve. Accepted paramters include:
     - N = How many teeth
     - P = Diametral pitch (all gears should have the same P)
     - pa = pressure angle (recommended to remain at 14.5)
**/
module spur_gear(N, P = 12, pa = 14.5) {
    dp = calc_dp(N, P);
    db = calc_db(N, P, pa);
    dr = calc_dr(N, P);
    a = calc_addendum(P);
    b = calc_dedendum(P);
    c = calc_clearance(P);
    p = calc_circular_pitch(P);

    // Undercut adjustment
    // NOTE: this might not be great? IDK
    undercut = 1 * c;

    // Calculate radius to begin the involute calculations
    r = (db - undercut) * .5;
    alpha = calc_alpha(dp, db, pa);
    beta = ((360 / (4*N)) - alpha) * 2;

    module involute_tooth() {
        x = function(t) (r * (cos(t*rad_to_deg) + t * sin(t*rad_to_deg)));
        y = function(t) (r * (sin(t * rad_to_deg) - t * cos(t * rad_to_deg)));
        x2 = function(t) r * (cos(-t*rad_to_deg - beta) - t * sin(-t * rad_to_deg - beta));
        y2 = function(t) r * (sin(-t*rad_to_deg - beta) + t * cos(-t * rad_to_deg - beta));
        
        involute_1_points = parametric_points(fx=x, fy=y, t1=.68);
        involute_2_points = parametric_points(fx=x2, fy=y2, t1=.68);

        difference() {
            union() {
                polygon(
                    concat(
                        [[ 0, 0 ]],
                        involute_1_points,
                        reverse(involute_2_points),
                        [[ 0, 0]]
                    )
                );        
            }
            
            // Use subtraction to extend the invlute curve towards the base
            // circle and then stop it at that point. This will
            // add some square-shaped space at the base of the tooth
            // NOTE: usage of undercut might be overkill.
            circle(d=(dp - 2*b));
        }
    }

    difference() {
        circle(d=(dp + 2*a));
        circular_mirror(d=0, steps=N) involute_tooth();
    }
}

/**
    Helper modules
**/
module circular_mirror(x=0, y=0, d, steps) {
    aps = 360 / steps;
    for (step=[0:steps]) {
        current_angle = step * aps;
        unit_x = cos(current_angle);
        unit_y = sin(current_angle);
        translate([x, y, 0]) {
            translate([unit_x * d, unit_y * d, 0]) {
                rotate(current_angle) children();
            }    
        }
    }
}