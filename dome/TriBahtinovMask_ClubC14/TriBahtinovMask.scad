// On: https://satakagi.github.io/tribahtinovWebApps/Tri-Bahtinov_symmetric.html
//  F.L..:  mm
//  Build mount holes: unchecked
//  Focal Length: 3910
//  OuterDiameter: 355.5
//  Inner Diameter: 114
//  StemWidth:SlitWidth: 1:1
//  Use 3rd order spectrum: Unchecked
//  Bahtinov Fadctor: 150
//  inW:5.99948 outW:11.125
//  Rounding: unchecked
//
// Also see: https://satakagi.github.io/tribahtinovWebApps/reports/improveSensitivity.html
//
// Load in inkscape and remove the outer circle and save as triBhatinovMask.svg and save
// Open triBhatinovMask.svg and make sure the viewBox origin is 0, 0  not -396,-396 to ensure mask is centered


// Print: No support, 35% infill, Low Quality

partNum                         = 3;      // 0 = All, 1 = Mask, 2 = Cover, Center Support


maskOutsideDiameter             = 388;
clearAperture                   = 203.2;
secondaryMirrorDiameter         = 112;
secondaryMirrorHandleHeight     = 20;
secondaryMirrorHandleThickness  = 2;
maskThickness                   = 1.0;
coverMiddleRingDiameter         = 228;
coverSegmentAngle               = 120;
coverHandleThickness            = 2;
coverHandleHeight               = secondaryMirrorHandleHeight - maskThickness;
coverhandleInnerDiameter        = secondaryMirrorDiameter + secondaryMirrorHandleThickness * 2 + 2;
svgFilename                     = "triBahtinovMask.svg";

manifoldCorrection              = 0.01;
$fn                             = 80;


if ( partNum == 0 || partNum == 1 )
    mask();
if ( partNum == 0 || partNum == 2 )
{
    translate( [0, 0, maskThickness] )
        cover();
}
if ( partNum == 0 || partNum == 3 )
{
    centerSupport();
}



module centerSupport()
{
    donut(secondaryMirrorDiameter - 1.5, 104, secondaryMirrorHandleHeight );
    donut(coverhandleInnerDiameter + 5.0, 104, 0.6);
}



module cover()
{
    difference()
    {
        cylinder(d=maskOutsideDiameter, h=maskThickness);
        translate( [0, 0, -manifoldCorrection] )
            scale( [1.0, 1.0, 2.0] )
                coverCutoutPositive();        
        translate( [0, 0, -manifoldCorrection] )
            cylinder(d=coverhandleInnerDiameter, h=maskThickness + manifoldCorrection * 2);
    }
    
    donut(coverhandleInnerDiameter + coverHandleThickness * 2, coverhandleInnerDiameter, coverHandleHeight);
}



module coverCutoutPositive()
{
    
    pieSlice(coverMiddleRingDiameter, maskThickness + manifoldCorrection * 2, coverSegmentAngle);

    rotate( [0, 0, 180] )
    {
        difference()
        {
            pieSlice(maskOutsideDiameter + manifoldCorrection * 2, maskThickness, coverSegmentAngle);
            translate( [0, 0, -manifoldCorrection] )
                cylinder(d=coverMiddleRingDiameter, h=maskThickness + manifoldCorrection * 4);
        }
    }
}




module mask()
{
    difference()
    {
        donut(maskOutsideDiameter, secondaryMirrorDiameter, maskThickness);
        translate( [0, 0, -manifoldCorrection] )                
            linear_extrude(height=maskThickness + manifoldCorrection * 2)
                import(file=svgFilename, center=true, dpi=72);
    }

    donut(secondaryMirrorDiameter + secondaryMirrorHandleThickness * 2, secondaryMirrorDiameter, secondaryMirrorHandleHeight);
    //color( [1.0, 0, 0] )
    //    donut(clearAperture, secondaryMirrorDiameter, maskThickness);
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



module pieSlice(outerDiameter, thickness, angle)
{
    rotate( [0, 0, -90] )
        difference()
        {
            cylinder(d=outerDiameter, h = thickness);
            rotate( [0, 0, angle/2] )
                translate( [0, -outerDiameter, -manifoldCorrection] )
                    cube( [outerDiameter, outerDiameter * 2, thickness + manifoldCorrection * 2]);
            rotate( [0, 0, -angle/2] )
                translate( [-outerDiameter, -outerDiameter, -manifoldCorrection] )
                    cube( [outerDiameter, outerDiameter * 2, thickness + manifoldCorrection * 2]);
        }
}