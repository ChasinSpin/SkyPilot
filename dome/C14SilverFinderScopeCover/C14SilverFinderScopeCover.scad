
border              = 2.0;
coverInnerDiameter  = 92.0;
coverOuterDiameter  = coverInnerDiameter + border * 2;
coverHeight         = 15.0;

ringInnerDiameter   = 87.0;
ringOuterDiameter   = ringInnerDiameter + border * 2;
ringHeight          = 2.0;

coverRingDistance   = 150;
coverRingWidth      = 3.0;


manifoldCorrection  = 0.01;
manifoldCorrection2 = manifoldCorrection * 2;
$fn                 = 80;



cover();



module cover()
{
    // Cover
    cylinder(d = coverOuterDiameter, h = border);
    translate( [0, 0, border] )
        donut(coverOuterDiameter, coverInnerDiameter, coverHeight);
        
    // Ring
    translate( [coverRingDistance, 0, 0] )
        donut(ringOuterDiameter, ringInnerDiameter, ringHeight);
        
    // Joiner
    translate( [coverOuterDiameter/2 - 0.2, -coverRingWidth/2, 0] )
        cube( [coverRingDistance - (coverOuterDiameter/2 + ringOuterDiameter/2) + 1.0, coverRingWidth, ringHeight] );
}





module donut(outerDiameter, innerDiameter, height)
{
    difference()
    {
        cylinder(d = outerDiameter, h = height);
        translate( [0, 0, -manifoldCorrection] )
            cylinder(d = innerDiameter, h = height + manifoldCorrection2);
    }
}