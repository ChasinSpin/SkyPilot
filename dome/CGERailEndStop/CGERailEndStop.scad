endStopDimensions   = [40.0, 20.0, 24.0];
boltHoleDiameter    = 6.55;

manifoldCorrection  = 0.01;
manifoldCorrection2 = manifoldCorrection * 2.0;
$fn                 = 80;



endStop();
translate( [0, endStopDimensions[1] + 10, 0] )
    endStop();



module endStop()
{
    difference()
    {
        translate( [-endStopDimensions[0]/2, -endStopDimensions[1]/2, 0] )
            cube(endStopDimensions);
        
        translate( [0, 0, -manifoldCorrection] )
            cylinder(d = boltHoleDiameter, h = endStopDimensions[2] + manifoldCorrection2);
    }
}