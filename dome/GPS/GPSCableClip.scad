// Print in ASA Black, 15% fill, No Support

pierDiameter                = 410.38;
cableDiameter               = 2.7 + 0.5;
clipBaseDimensions          = [10, 20, 3];
pierClipBaseOffsetZ         = 0.24;
clipThickness               = 1.5;
cableClipLength             = cableDiameter * 1.5;


$fn                         = 89;
manifoldCorrection          = 0.01;
manifoldCorrection2         = manifoldCorrection * 2;


translate( [0, 0, clipBaseDimensions[0]/2] )
    rotate( [0, 90, 0] )
        clip();


module clip()
{
    difference()
    {
        translate( [0, 0, clipBaseDimensions[2]/2] )
            cube( clipBaseDimensions, center = true);
            
        translate( [0, 0, -pierDiameter/2 + pierClipBaseOffsetZ] )
            rotate( [0, 90, 0] )
                cylinder(d = pierDiameter, h = clipBaseDimensions[0] + manifoldCorrection2, center = true, $fn = 1200);
    }
    
    translate( [0, 0, clipBaseDimensions[2]] )
    {
        translate( [0, -clipBaseDimensions[1]/2, cableDiameter/2] )
            donut90(cableDiameter + clipThickness*2, cableDiameter, clipBaseDimensions[0]); 
        
        translate( [-clipBaseDimensions[0]/2, -clipBaseDimensions[1]/2, 0] )
            cube( [clipBaseDimensions[0], clipThickness, cableDiameter/2] );
          
        translate( [-clipBaseDimensions[0]/2, -clipBaseDimensions[1]/2 + (cableDiameter + clipThickness*2)/2, cableDiameter/2 + cableDiameter/2] )
            cube( [clipBaseDimensions[0], cableClipLength, clipThickness] );

        translate( [0, -clipBaseDimensions[1]/2 + (cableDiameter + clipThickness*2)/2 + cableClipLength, cableDiameter / 2 + (0 + (cableDiameter + clipThickness * 2)/2)] )
            rotate( [-90, 0, 0] )
                donut90(cableDiameter + clipThickness*2, cableDiameter, clipBaseDimensions[0]); 
    }
}



module donut90(outerDiameter, innerDiameter, height)
{
    translate( [0, outerDiameter/2, 0] )
        rotate( [0, 90, 0] )
            translate( [0, 0, -height/2] )
                difference()
                {
                    donut(outerDiameter, innerDiameter, height);
                    translate( [0, 0, -manifoldCorrection] )
                    {
                        translate( [-outerDiameter/2, 0, 0] )
                            cube( [outerDiameter, outerDiameter, height + manifoldCorrection2] );
                        translate( [0, -outerDiameter/2, 0] )
                            cube( [outerDiameter, outerDiameter, height + manifoldCorrection2] );
                    }
                }
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