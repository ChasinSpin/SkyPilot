plateDimensions             = [97.0, 40.0, 2.0];
plateCornerRadius           = 2.3;
plateSideCutoutLength       = 19.0;
plateSideCutoutWidth        = 1.2;

boltHoleDiameter            = 3.1;
boltHoleHeadDiameter        = 5.5;
boltHoleHeadHeight          = 1.8;
boltHoleDistanceX           = 90.0 / 2;
boltHoleDistanceY           = 32.5 / 2;

textHeight                  = 0.6;
textSize                    = 2.5;
textFont                    = "Arial:style=Bold";


manifoldCorrection          = 0.01;
manifoldCorrection2         = manifoldCorrection * 2;
$fn                         = 80;


plate1();
translate( [0, plateDimensions[1] + 10, 0] )
    plate2();
    
    
    
module plate1()
{
    difference()
    {
        plate();
    
        circleCutout(7.0, [13.0, 14.8], "Aux1");
        squareCutout(17.3, 16.0, [44.5, 8.44], "Dec");
        squareCutout(17.3, 16.0, [60.5, 8.44], "RA");
        squareCutout(10.1, 12.0, [77.7, 7.5], "Pwr");
    }
}



module plate2()
{
    difference()
    {
        plate();
        
        circleCutout(4.0, [15.5, 7.8], "Pwr");
        circleCutout(4.0, [21.64, 7.8], " Status");
        circleCutout(7.0, [40.5, 30.0], "WiFi");
        squareCutout(13.0, 8.0, [12.21, 17.5], "USB");
        squareCutout(16.1, 13.5, [32.5, 7.5], "Ctrl");
        squareCutout(40.0, 13.5, [48.4, 7.5], "Aux2");  
    }
}



module circleCutout(diameter, bottomLeftXYCenter, str)
{
    translate( [bottomLeftXYCenter[0] - plateDimensions[0] / 2, bottomLeftXYCenter[1] - plateDimensions[1] / 2, -manifoldCorrection] )
    {
        cylinder(d = diameter, h = plateDimensions[2] + manifoldCorrection2);
        translate( [-3, -7, plateDimensions[2] - textHeight] )
            linear_extrude( height = textHeight + manifoldCorrection2 )
                text(str, font = textFont, size = textSize);
    }   
}



module squareCutout(width, height, bottomLeftXY, str)
{
    translate( [bottomLeftXY[0] - plateDimensions[0] / 2, bottomLeftXY[1] - plateDimensions[1] / 2, -manifoldCorrection] )
    {
        cube( [width, height, plateDimensions[2] + manifoldCorrection2] );

        translate( [-4 + width/2, -5, plateDimensions[2] - textHeight] )
            linear_extrude( height = textHeight + manifoldCorrection2 )
                text(str, font = textFont, size = textSize);
    }
}



module plate()
{
    difference()
    {
        roundedRect(plateDimensions, plateCornerRadius);
    
        
        // Side Cutouts
        cutoutDelta = (plateDimensions[0] - plateSideCutoutWidth)/2 + manifoldCorrection;
        for ( pos = [-cutoutDelta, cutoutDelta] )
            translate( [pos, 0, plateDimensions[2]/2] )
                cube( [plateSideCutoutWidth, plateSideCutoutLength, plateDimensions[2] + manifoldCorrection2], center = true );
                
        // Bolt holes
        for ( posXY = [
                        [-boltHoleDistanceX, -boltHoleDistanceY],
                        [-boltHoleDistanceX,  boltHoleDistanceY],
                        [ boltHoleDistanceX, -boltHoleDistanceY],
                        [ boltHoleDistanceX,  boltHoleDistanceY]
                    ] )
            translate( [posXY[0], posXY[1], 0] )
                boltHole();
    }
}



module boltHole()
{
    translate( [0, 0, -manifoldCorrection] )
        cylinder(d = boltHoleDiameter, h = plateDimensions[2] + manifoldCorrection2); 
    translate( [0, 0, plateDimensions[2] - boltHoleHeadHeight] )
        cylinder(d1 = boltHoleDiameter, d2 = boltHoleHeadDiameter, h = boltHoleHeadHeight + manifoldCorrection); 
}



module roundedRect(dimensions, radius)
{
    hull()
    {
        xDelta = dimensions[0]/2 - radius; 
        yDelta = dimensions[1]/2 - radius; 
    
        for ( posXY = [
                        [-xDelta, -yDelta],
                        [-xDelta,  yDelta],
                        [ xDelta, -yDelta],
                        [ xDelta,  yDelta]
                    ] )
            translate( [posXY[0], posXY[1], 0] )
                cylinder(r = radius, h = dimensions[2]);
    }
}