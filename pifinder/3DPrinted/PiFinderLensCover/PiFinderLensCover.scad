// Print in TPU 95A HF 15% fill

lensThreadDiameter      = 11.87;
coverLength             = 40.0;
coverInnerDiameter1     = 13.6;
coverInnerDiameter2     = coverInnerDiameter1 + 0.5;
coverHeight             = 5.6;
coverThickness          = 1.3;
coverStrapWidth         = 5.0;
coverRetainerOffsetX    = 6.7;
coverRetainerDiameter   = lensThreadDiameter + 4.0;

manifoldCorrection      = 0.01;
manifoldCorrection2     = manifoldCorrection * 2;
$fn                     = 80;


cover();


module cover()
{
    difference()
    {
        cylinder(d = coverInnerDiameter2 + coverThickness * 2, h = coverHeight + coverThickness);
        translate( [0, 0, coverThickness] )
            cylinder(d2 = coverInnerDiameter2, d1 = coverInnerDiameter1, h = coverHeight + manifoldCorrection);
    }
    
    translate( [0, -coverStrapWidth/2, 0] )
        cube( [coverLength, coverStrapWidth, coverThickness] );
        
    translate( [coverLength + coverRetainerOffsetX, 0, 0] )
        donut( coverRetainerDiameter, lensThreadDiameter, coverThickness );
    
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