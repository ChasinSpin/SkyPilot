// Requires support, 30% fill and PETG-CF on Textured PEI Plate with Glue Stick

rj45ReceiverOffset          = [-5, -(25.9/2), 9.9];
rj45ReceiverCutoutDimensions= [18, 25.9];

plateOffsetX                = 25.0;
plateDimensions             = [60, 50, 6];
plateRadius                 = 5.0;

m3BoltHoleDiameter          = 3.1;
m3BoltHeadDiameter          = 6.4;
m3BoltHeadHeight            = 2.5;
m3BoltHeadPositions         = [[15.0, 10.0], [15.0, -10.0]];

manifoldCorrection          = 0.01;
manifoldCorrection2         = manifoldCorrection * 2;
$fn                         = 80;


use <rj45_keystone_receiver.scad>;



decPlate();



module decPlate()
{
    difference()
    {
        roundedCube( plateDimensions, plateRadius);

        translate( [rj45ReceiverOffset[0], rj45ReceiverOffset[1], 0] )
            translate( [-rj45ReceiverCutoutDimensions[0], 0, -manifoldCorrection] )
                cube( [rj45ReceiverCutoutDimensions[0], rj45ReceiverCutoutDimensions[1], plateDimensions[2] + manifoldCorrection2] );
                
        for ( pos = m3BoltHeadPositions )
            translate( [pos[0], pos[1], -manifoldCorrection] )
            {
                cylinder(d = m3BoltHoleDiameter, h = plateDimensions[2] + manifoldCorrection2);
                cylinder(d1 = m3BoltHeadDiameter, d2 = m3BoltHoleDiameter, h = m3BoltHeadHeight ); 
            }
    }
    
    translate( rj45ReceiverOffset )
        rotate([0,180,0]) 
            rj45Receiver();
}



module roundedCube(dimensions, radius)
{

    halfWidth   = dimensions[0] / 2 - radius;
    halfLength  = dimensions[1] / 2 - radius;
    
    hull()
        for ( posXY = [ [-halfWidth, -halfLength], [-halfWidth, halfLength], [halfWidth, -halfLength], [halfWidth, halfLength] ] )
            translate( [posXY[0], posXY[1], 0] )
                cylinder(r = radius, h = dimensions[2], $fn = 40);
}