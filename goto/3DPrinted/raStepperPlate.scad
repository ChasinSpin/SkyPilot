// Print:
//     PAHT-CF
//     Smooth PEI Plate with **STICK GLUE** (not liquid)
//     Use AMS
//     Support Contacting Build Surface Only
//     100% Fill, infill pattern: Rectilinear

stepperDimensions               = [42, 42];
stepperBoltHoleDiameter         = 3.3;
stepperBoltHoleDistance         = 31.0 / 2;
stepperBoltHeadDiameter         = 5.75;
stepperBoltHeadHeight           = 5.0;
stepperPlateThickness           = 6.5;
stepperCenterVoidDiameter       = 24.0;

originalMountingHoleDiameter    = 5.0;
originalMountingHolePos         = [ [-12.7, -23.83], [-12.7, 23.83] ];

mountingBoltHeadDiameter        = 7.5;
mountingBoltHeadThickness       = 3.2;

axleCutoutOffset                = [-8, 21];
axleCutoutDimensions            = [42, 10, stepperPlateThickness];

manifoldCorrection              = 0.01;
manifoldCorrection2             = manifoldCorrection * 2;
$fn                             = 80;


raAdapterPlate();



module raAdapterPlate()
{
    difference()
    {
        outerForm();
        
        translate( [0, 0, -manifoldCorrection] )
        {
            for ( pos = originalMountingHolePos )
                translate( [pos[0], pos[1], 0] )
                {
                    cylinder(d = originalMountingHoleDiameter, h = stepperPlateThickness + manifoldCorrection2);
                    translate( [0, 0, stepperPlateThickness - mountingBoltHeadThickness + manifoldCorrection] )
                        cylinder(d = mountingBoltHeadDiameter, h = mountingBoltHeadThickness + manifoldCorrection);
                }
    
            cylinder(d = stepperCenterVoidDiameter, h = stepperPlateThickness + manifoldCorrection2);
        
            for ( pos = [
                        [-stepperBoltHoleDistance, -stepperBoltHoleDistance],
                        [ stepperBoltHoleDistance, -stepperBoltHoleDistance],
                        [-stepperBoltHoleDistance,  stepperBoltHoleDistance],
                        [ stepperBoltHoleDistance,  stepperBoltHoleDistance]
                        ] )
                translate( [pos[0], pos[1], 0] )
                {
                    cylinder(d = stepperBoltHoleDiameter, h = stepperPlateThickness + manifoldCorrection2);
                    cylinder(d = stepperBoltHeadDiameter, h = stepperBoltHeadHeight + manifoldCorrection2);
                }
        }
        
        //cube( [42, 42, 0.2], center = true);
    }
}



module outerForm()
{
    difference()
    {
        hull()
        {
            for ( pos = originalMountingHolePos )
                translate( [pos[0], pos[1], 0] )
                    cylinder(d = originalMountingHoleDiameter * 2, h = stepperPlateThickness);

            translate( [0, 0, stepperPlateThickness/2] )
                cube( [stepperDimensions[0], stepperDimensions[1], stepperPlateThickness], center = true);
        }
        
        translate( [axleCutoutOffset[0], axleCutoutOffset[1], -manifoldCorrection] )
            cube( [axleCutoutDimensions[0], axleCutoutDimensions[1], axleCutoutDimensions[2] + manifoldCorrection2] );
    }
}