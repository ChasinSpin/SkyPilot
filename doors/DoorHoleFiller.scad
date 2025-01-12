// PLA 30% fill

largerOuterDiameter     = 55.0;
largerInnerDiameter     = 7.1;
largerThickness         = 20.0;

smallerOuterDiameter    = 45.0;
smallerInnerDiameter    = 7.1;
smallerThickness        = 20.0;

manifoldCorrection      = 0.01;
manifoldCorrection2     = manifoldCorrection * 2;
$fn                     = 80;



donut(largerOuterDiameter, largerInnerDiameter, largerThickness);
translate( [65, 0, 0] )
    donut(smallerOuterDiameter, smallerInnerDiameter, smallerThickness);



module donut(outerDiameter, innerDiameter, height)
{
    difference()
    {
        cylinder(d = outerDiameter, h = height);
        translate( [0, 0, -manifoldCorrection] )
            cylinder(d = innerDiameter, h = height + manifoldCorrection2);
    }
}