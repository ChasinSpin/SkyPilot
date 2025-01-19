// Part 0: PETG-CF, 15% Fill, No Support
// Part 1: Requires support, 30% fill and PETG on Textured PEI Plate

partNum                     = 1;    // 0 = Case Extension, 1 = Plate

plateDimensions             = [218, 114, 15];
plateThickness              = 4.0;
plateHoleLocations          = [205/2, 102/2];
surroundThickness           = 6.5;
boltHoleDiameter            = 6.0;
cornerRadius                = 5.0;
cornerReinforcementDiameter = 12.0;
rj45ReceiverOffset          = [90, -42, 9.9];
rj45ReceiverCutoutDimensions= [18, 25 + 0.9];

psuDimensions               = [6.37*25.4, 2.44*25.4, 0.7*25.4];

controllerOffsetX           = -10;
insertDeltaX                = (120 + 12) / 2;
insertDeltaY                = 35;
insertLocations             = [ [-insertDeltaX, -insertDeltaY], [insertDeltaX, -insertDeltaY], [-insertDeltaX, insertDeltaY], [insertDeltaX, insertDeltaY] ];
insertDiameter              = 4.35 + 0.25;
screwBlockPosXLocations     = [-35, 35];



manifoldCorrection          = 0.01;
manifoldCorrection2         = manifoldCorrection * 2;
$fn                         = 80;

use <rj45_keystone_receiver.scad>;



if ( partNum == 0 ) caseExtension();
if ( partNum == 1 ) plate();



module plate()
{
    difference()
    {
        roundedCube( [plateDimensions[0], plateDimensions[1], plateThickness], cornerRadius);
        

        for ( pos = [
            [-plateHoleLocations[0], -plateHoleLocations[1]],
            [ plateHoleLocations[0], -plateHoleLocations[1]],
            [-plateHoleLocations[0],  plateHoleLocations[1]],
            [ plateHoleLocations[0],  plateHoleLocations[1]]
        ] )
            translate( [pos[0], pos[1], -manifoldCorrection] )
                cylinder(d = boltHoleDiameter, h = plateThickness + manifoldCorrection2);
           
        translate( [rj45ReceiverOffset[0], rj45ReceiverOffset[1], 0] )
            translate( [-rj45ReceiverCutoutDimensions[0], 0, -manifoldCorrection] )
                cube( [rj45ReceiverCutoutDimensions[0], rj45ReceiverCutoutDimensions[1], plateThickness + manifoldCorrection2] );
        
        translate( [controllerOffsetX, 0, 0] )
            for ( posXY = insertLocations )
                translate( [posXY[0], posXY[1], -manifoldCorrection] )
                    cylinder(d = insertDiameter, h = plateThickness + manifoldCorrection2);
    }

    translate( rj45ReceiverOffset )
        rotate([0,180,0]) 
            rj45Receiver();
}



module caseExtension()
{
    difference()
    {
        union()
        {
            difference()
            {
                roundedCube(plateDimensions, cornerRadius);
            
                translate( [0, 0, -manifoldCorrection] )
                    roundedCube( plateDimensions - [surroundThickness * 2, surroundThickness * 2, -manifoldCorrection2], cornerRadius);
            }

            for ( pos = [
                        [-plateHoleLocations[0], -plateHoleLocations[1]],
                        [ plateHoleLocations[0], -plateHoleLocations[1]],
                        [-plateHoleLocations[0],  plateHoleLocations[1]],
                        [ plateHoleLocations[0],  plateHoleLocations[1]]
                    ] )
                translate( [pos[0], pos[1], 0] )
                    cylinder(d = cornerReinforcementDiameter, h = plateDimensions[2]);
        }
        
        for ( pos = [
                    [-plateHoleLocations[0], -plateHoleLocations[1]],
                    [ plateHoleLocations[0], -plateHoleLocations[1]],
                    [-plateHoleLocations[0],  plateHoleLocations[1]],
                    [ plateHoleLocations[0],  plateHoleLocations[1]]
                ] )
            translate( [pos[0], pos[1], -manifoldCorrection] )
                cylinder(d = boltHoleDiameter, h = plateDimensions[2] + manifoldCorrection2);
    }
}



module roundedCube(dimensions, radius)
{
    xyDelta = [dimensions[0]/2 - cornerRadius, dimensions[1]/2 - cornerRadius];
    
    hull()
        for ( pos = [
                    [-xyDelta[0], -xyDelta[1]],
                    [ xyDelta[0], -xyDelta[1]],
                    [-xyDelta[0],  xyDelta[1]],
                    [ xyDelta[0],  xyDelta[1]]
                ] )
            translate( [pos[0], pos[1], 0] )
                cylinder(r = cornerRadius, h = dimensions[2]);
}