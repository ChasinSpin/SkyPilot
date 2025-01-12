// PETG-CF, 15% Fill, No Support

plateDimensions             = [218, 114, 15];
plateHoleLocations          = [205/2, 102/2];
surroundThickness           = 6.5;
boltHoleDiameter            = 6.0;
cornerRadius                = 5.0;
cornerReinforcementDiameter = 12.0;

manifoldCorrection          = 0.01;
manifoldCorrection2         = manifoldCorrection * 2;
$fn                         = 80;



caseExtension();



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