// Support needed for part 1
// Brim needed for part 2

// 2 x Neodymium Magnet 5x2mm


partNum                 = 4;    // 0 = All, 1 = Filter Case, 2 = Color Chip, 3 = Base, 4 = Filter Case + Color Chip

//filterText              = ["ColorMagic", "D1 Ha/OIII"];
//filterText              = ["ColorMagic", "D2 SII/OIII"];
filterText              = ["Optolong", "L-EXtreme"];
//filterText              = ["Broadband", "No Filter"];

baseNumberOfFilters     = 4;

caseDiameter            = 70;
filterVoidWidth         = 11.8;
caseWidth               = filterVoidWidth + 5.0 * 2;
filterVoidDiameter1     = 53.0;
filterVoidDiameter2     = 55.9;
filterVoidThickness2    = 4.5;
filterVoidThickness1    = filterVoidWidth - filterVoidThickness2;
magnetVoidDiameter      = 4.0 + 0.2;
magnetVoidThickness     = 2.0 + 0.1;
magnetVoidZOffset       = 5.0;
magnetVoidDistance      = 58.0;
textOffsetY             = 3.0;
textThickness           = 0.8;
textSize                = 8.0;
line2OffsetY            = -11.0;

shoulderHeight          = 7.2 + 3.0;
insertCollarDepth       = 15.8;
insertCollarThickness   = 2.4;
insertCollarDiameter    = caseDiameter - insertCollarThickness * 2;

colorChipDiameter       = 70.0;
colorChipWidth          = 14.0;
colorChipThickness      = 1.5;
colorChipHoleDiameter   = 4.0;

baseBorder              = 5.0;
baseHeight              = 25.0;
baseBorderTolerance     = 0.6;

baseMagnetDiameter      = 5.0 + 0.2;
baseMagnetThickness     = 2.0 + 0.2;

markerDimensions        = [2.0, 1.0, 10.0];

topHalfLength           = 42.2;


manifoldCorrection      = 0.01;
manifoldCorrection2     = manifoldCorrection * 2;
$fn                     = 80;


if ( partNum == 0 || partNum == 1 || partNum == 4)
    filterCase();

if ( partNum == 0 || partNum == 2 || partNum == 4)
    translate( [caseDiameter/2 - 20, 0, 0] )
        colorChip();

if ( partNum == 0 || partNum == 3 )
    translate( [0, caseDiameter/2 + 10, 0] )
        base();

        
module base()
{
    innerDimensions = [caseWidth * baseNumberOfFilters + baseBorderTolerance, caseDiameter + baseBorderTolerance, baseHeight];
    outerDimensions = [innerDimensions[0] + baseBorder * 2, innerDimensions[1] + baseBorder * 2, innerDimensions[2] + baseBorder];
    
    difference()
    {
        cube( outerDimensions ); 
        translate( [baseBorder, baseBorder, baseBorder + manifoldCorrection] )
            cube( innerDimensions ); 
    }
}
 
 

module shoulder()
{
    blockWidth2 = caseDiameter/2 - filterVoidDiameter2/2;
    blockWidth1 = caseDiameter/2 - filterVoidDiameter1/2;

    difference()
    {
        translate( [-caseDiameter/2, 0, -filterVoidWidth/2] )
        {
            cube( [blockWidth2, shoulderHeight, filterVoidWidth] );
            cube( [blockWidth1, shoulderHeight, filterVoidWidth - filterVoidThickness2] );
        }
    }
}
 


module filterCase()
{
    translate( [0, 0, caseWidth] )
        rotate( [180, 0, 0] )
            translate( [0, 0, caseWidth/2] )
            {
                difference()
                {
                    union()
                    {
                        difference()
                        {
                            // Main case
                            union()
                            {
                                cylinder(d = caseDiameter, h = caseWidth, center = true);
                                translate( [0, -caseDiameter/4, 0] )
                                    cube( [caseDiameter, caseDiameter/2, caseWidth], center = true );
                            }
        
                            // Top half (larger)
                            difference()
                            {
                                cylinder(d = caseDiameter + manifoldCorrection2, h = filterVoidWidth, center = true);
                                translate( [0, -caseDiameter/4, 0] )
                                    cube( [caseDiameter + manifoldCorrection2 * 2, caseDiameter/2, filterVoidWidth], center = true);
                            }
                        
                            // Bottom half
                            translate( [0, 0, -filterVoidWidth/2] )
                            {
                                cylinder(d = filterVoidDiameter1, h = filterVoidThickness1 + manifoldCorrection);
                                translate( [0, 0, filterVoidThickness1] )
                                    cylinder(d = filterVoidDiameter2, h = filterVoidThickness2);
                            }
                
                            // Text
                            createText(textThickness, manifoldCorrection);
                        }
    
                        // Put text back in
                        translate( [0, 0, -manifoldCorrection] )
                            color( [1.0, 0.0, 0.0] )
                                createText(textThickness, 0);
                    
                        // Shoulders
                        shoulder();
                        translate( [0, shoulderHeight, 0] )
                            rotate( [180, 180, 0] )
                                shoulder();
                    }
                
                    // Insert Collar
                    translate( [0, 0, -insertCollarDepth/2] )
                        linear_extrude(insertCollarDepth)
                            arc(radius = insertCollarDiameter/2, angles = [10.5 , 169.5], width = insertCollarThickness + 2.0, fn = $fn);
        
                    // Filter Magnet Voids
                    translate( [0, shoulderHeight, 0] )
                        for ( xPos = [-magnetVoidDistance/2, magnetVoidDistance/2] )
                            translate( [xPos, manifoldCorrection, -filterVoidWidth/2 + magnetVoidZOffset] )
                                rotate( [90, 0, 0] )
                                    cylinder(d = magnetVoidDiameter, h = magnetVoidThickness + manifoldCorrection);
                                    
                    // Base Magent Voids
                    translate( [0, -caseDiameter/2 + baseMagnetThickness - manifoldCorrection, 0] )
                        rotate( [90, 0, 0] )
                            cylinder(d = baseMagnetDiameter, h = baseMagnetThickness);
                            
                    // Marker
                    translate( [-markerDimensions[0]/2, caseDiameter/2 - markerDimensions[1], caseWidth/2 - markerDimensions[2] + manifoldCorrection] )
                        cube( markerDimensions );
                }
            }
}



module colorChip()
{
    difference()
    {
        rotate( [0, 0, -20] )
            linear_extrude(colorChipWidth)
                arc(radius = colorChipDiameter/2, angles = [0, 40], width = colorChipThickness, fn = $fn);

        // Hole
        translate( [colorChipDiameter/2, 0, colorChipWidth/2] )
            rotate( [0, 90, 0] )
                cylinder(d = colorChipHoleDiameter, h = colorChipThickness * 2, center = true);
                
        // Marker
        translate( [colorChipDiameter/2 - 0.1, 0, colorChipWidth - 2.5] )
            cube( markerDimensions );
    }
}



module createText(thickness, mfc)
{
    translate( [0, textOffsetY, 0] )
        translate( [0, 0, caseWidth/2 - thickness] )
            linear_extrude(thickness + mfc)
            {
                text(filterText[0], font = "Arial:style=Bold", size = textSize, halign = "center");
                translate( [0, line2OffsetY, 0] )
                    text(filterText[1], font = "Arial:style=Bold", size = textSize, halign = "center");
            }
}



module sector(radius, angles, fn = 24)
{
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(a = [angles[0] : step : angles[1] - 360]) 
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(angles[1]), r * sin(angles[1])]]
    );

    difference()
    {
        circle(radius, $fn = fn);
        polygon(points);
    }
}



module arc(radius, angles, width = 1, fn = 24)
{
    difference()
    {
        sector(radius + width, angles, fn);
        sector(radius, [angles[0] - 0.01, angles[1] + 0.01], fn);
    }
} 