// On: https://satakagi.github.io/tribahtinovWebApps/Bahtinov.html
//  Focal Length: 342
//  OuterDiameter: 98.5
//  Inner Diameter: 0.0
//  StemWidth:SlitWidth: 1:1
//  Use 3rd order spectrum: Unchecked
//  Bahtinov Factor: 150    
//  inW:5.99948 outW:11.125
//  Rounding: unchecked
//
// Also see: https://satakagi.github.io/tribahtinovWebApps/reports/improveSensitivity.html
//
// Load in inkscape and remove the outer circle and save as 342mm.svg and save
// Open 342mm.svg and make sure the viewBox origin is 0, 0  not -400,-400 to ensure mask is centered


// Print:
//      Mask: No Support, 20% infill, Regular Quality

maskThickness                   = 1.0;
telescopeDiameter               = 101.0;
retainerThickness               = 3;
retainerHeight                  = 12.0;
svgFilename                     = "342mm.svg";

manifoldCorrection              = 0.01;
$fn                             = 80;


mask();


module mask()
{
    difference()
    {
        cylinder(d = telescopeDiameter + retainerThickness * 2, h = maskThickness);
        translate( [0, 0, -manifoldCorrection] )                
            linear_extrude(height=maskThickness + manifoldCorrection * 2)
                
                import(file=svgFilename, center=true, dpi=72);
    }
    
    donut(outerDiameter = telescopeDiameter + retainerThickness * 2, innerDiameter = telescopeDiameter, height = maskThickness + retainerHeight);
}



module donut(outerDiameter, innerDiameter, height)
{
    difference()
    {
        cylinder(d=outerDiameter, h=height);
        translate( [0, 0, -manifoldCorrection] )
            cylinder(d=innerDiameter, h=height + manifoldCorrection * 2);
    }
}