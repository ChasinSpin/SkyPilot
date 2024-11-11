// Print ASA Black and ASA Green, 15% Fill and Support
// Use Painting and fill in text to green color
// Covers print in TPU 95A HF 15% Dill, No Support

partNum                             = 3;        // 0 = All, 1 = Clips, 2 = Bracket, 3 = Covers

pierDiameter                        = 410.38;

pierCutoutOffsetY                   = -7.7;

extraHeight                         = 12.0;
smaDiameter                         = 9.15 + 0.4;
smaHeight                           = 18.7 + extraHeight;

blockDimensions                     = [60, 25, smaHeight];

clipHoleOffsetY                     = -6.0;
clipHoleOffsetZ                     = 2.95 + extraHeight;
clipHoleHeight                      = 2.7;
clipHoleWidth                       = 8.8 + 5.0;
clipHoleLength                      = 20;

connectorVoidOffsetY                = 6.0;
connectorVoidOffsetX                = 15.0;

clipHoleDiameter                    = 6.2 + 0.6;
clipHoleCutoutWidth                 = clipHoleDiameter - 2.0;
clipLength                          = (blockDimensions[1] - (blockDimensions[1] / 2 + connectorVoidOffsetY)) + clipHoleDiameter/2;
clipOuterDimensions                 = [8.5, clipLength, clipHoleHeight - 0.2];
clipHandleDonut                     = [5.0, 2.0]; 
clipHandleOffsetY                   = -1.4;
clipRegistrationLugDimensions       = [clipHoleWidth - 0.3, 3.1, clipOuterDimensions[2]];

insertDiameter                      = 4.55;
insertDepth                         = 5.0;
m3BoltDiameter                      = 3.4;
m3BoltDepth                         = 14.0;
insertOffsetZ                       = -6;
insertOffsetY                       = -4;

coverLength                         = 45;
coverInnerDiameter1                 = 6.24;
coverInnerDiameter2                 = coverInnerDiameter1 + 0.5;
coverHeight                         = 6.0;
coverThickness                      = 1.3;
coverStrapWidth                     = 5.0;
coverRetainerOffsetX                = 1.7;
coverRetainerDiameter               = coverStrapWidth + 2.0;

textHeight                          = 0.4;
textSize                            = 6.0;
textOffsetZ                         = 21.0;
textActiveOffsetZ                   = -15.5;
textFont                            = "Arial-bold.ttf";

manifoldCorrection                  = 0.01;
manifoldCorrection2                 = manifoldCorrection * 2;
$fn                                 = 80;

    
if ( partNum == 0 || partNum == 2 )   
    translate( [0, 0, blockDimensions[1]/2] )
        rotate( [-90, 0, 0] )
            bracket();
  
if ( partNum == 0 || partNum == 1 )
    translate( [blockDimensions[0] / 2 + clipOuterDimensions[0] + 5, 0, 0] )
    {
        clip();
        translate( [0, clipOuterDimensions[1] + clipHandleDonut[0], 0] )
            clip();
    }
    
if ( partNum == 0 || partNum == 3 )
    translate( [coverLength + 20, coverRetainerDiameter, 0] )
    {
        cover();
        translate( [0, coverRetainerDiameter * 2, 0] )
            cover();
    }

    
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
        donut( coverRetainerDiameter, m3BoltDiameter, coverThickness );
    
}

   
    
module clip()
{
    difference()
    {
        translate( [-clipOuterDimensions[0] / 2, 0, 0] )
            cube( clipOuterDimensions );
        translate( [0, clipHoleDiameter/2, -manifoldCorrection] )
        {
            cylinder(d = clipHoleDiameter, h = clipOuterDimensions[2] + manifoldCorrection2);   
        }
        translate( [-clipHoleCutoutWidth/2, -manifoldCorrection, -manifoldCorrection] )
            cube( [clipHoleCutoutWidth, clipHoleDiameter/2, clipOuterDimensions[2] + manifoldCorrection2] );
    }
    
    translate( [0, clipOuterDimensions[1] + clipHandleDonut[0]/2 + clipHandleOffsetY, 0] )   
        donut( clipHandleDonut[0], clipHandleDonut[1], clipOuterDimensions[2] );
        
    translate( [-clipRegistrationLugDimensions[0]/2, clipOuterDimensions[1] - clipRegistrationLugDimensions[1], 0] )
        cube( clipRegistrationLugDimensions );
}



module bracket()
{
    difference()
    {
        translate( [0, 0, blockDimensions[2] / 2] )
            cube( blockDimensions, center = true);
        
        translate( [0, -pierDiameter/2 + pierCutoutOffsetY, -manifoldCorrection] )
            cylinder(d = pierDiameter, h = blockDimensions[2] + manifoldCorrection2, $fn=2000);
        
        for ( posX = [-connectorVoidOffsetX, connectorVoidOffsetX] )
            translate( [posX, connectorVoidOffsetY, 0] )
                connectorVoid();
            
        translate( [0, insertOffsetY, blockDimensions[2] + insertOffsetZ] )
        {
            translate( [-(blockDimensions[0]/2 + manifoldCorrection), 0, 0] )
                rotate( [0, 90, 0] )
                    insertHole();

            translate( [blockDimensions[0]/2 + manifoldCorrection, 0, 0] )
                rotate( [0, -90, 0] )
                    insertHole();
        }
        
        gpsText();          
    }
    
    translate( [0, 0.001, 0] )
        color( [1, 0, 0] )
            gpsText();
}



module insertHole()
{
    cylinder(d = m3BoltDiameter, h = m3BoltDepth);
    cylinder(d = insertDiameter, h = insertDepth);
}



module gpsText()
{
    translate( [0, blockDimensions[1]/2 - textHeight, textOffsetZ] )
        rotate( [90, 0, 180] )
            linear_extrude(textHeight)
            {      
                text("GPS Antenna", font = textFont, size = textSize, halign = "center");
                translate( [0, textActiveOffsetZ, 0] )
                    text("(Active)", font = textFont, size = textSize, halign = "center");
            }
}



module connectorVoid()
{
    translate( [0, 0, -manifoldCorrection] )
        rotate( [0, 0, 30] )
            cylinder(d = smaDiameter, h = smaHeight + manifoldCorrection2, $fn = 6);
        
    translate( [-clipHoleWidth/2, clipHoleOffsetY, clipHoleOffsetZ] )
        cube( [clipHoleWidth, clipHoleLength, clipHoleHeight] );
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