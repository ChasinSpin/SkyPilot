// 1 Dec Coupler
//      30% Fill, PETG-CF, No Support, 30% fill, Smooth PEI Plate, Glue Stick
//
// 2 (Stepper Coupler Rod) No support, 100% fill
//      Note: This has been replaced by a custom lathed rod drilled and tapped 1/4-20
//
// 3 Outer Casing Top
//      100% PETG-CF Support Required, Smooth PEI Plate, Glue Stick
//
// 4 Outer Casing Bottom
//      30% Fill, PETG-CF, Support Required, Smooth PEI Plate, Glue Stick
//
// 5 Bearing Plate:
//      50% Fill, 4 wall loops, no support
//      PAHT-CF, Smooth PEI Plate,  and Gluestick on the bed
//
// 6 Cover:
//      15% Fill, PETG-CF Black and PETG-HF Yellow, Support Required, Textured PEI Plate, Glue Stick
//      Fill in text in Bambu Studio
//
// 7 Rotation Indicator
//      15% Fill, PLA Glow and PLA Black, Support, Textured PEI Plate, Liquid Glue
//      Fill in indicator in Bambu Studio
//
// Bolt and Glue Part 3 to Part 4, use blue tape around to prevent glue leakage down the sides. Use Oatley Clear PVC/CPVC Primer (or Oatley Purple PVC/CPVC Primer to glue


partNum                             = 6;    // 0= All, 1 = Dec Coupler, 2 = Stepper Coupler Rod, 3 = Outer Casing Top, 4 = Outer Casing Bottom, 5 = Bearing Plate, 6 = Cover, 7 = Rotation Indicator

decCouplerPlateBaseThickness        = 7.0;
decCouplerPlateBaseBoltDiameter     = 6.17 + 0.5;
decCouplerPlateBaseBoltHeadDiameter = 12.4 + 1.0;
decCouplerPlateBaseBoltHeadHeight   = 5.0;
decCouplerPlateInsideDiameter1      = 45.0 + 1.0;
decCouplerPlateInsideHeight1        = 8.5 + 1.0;
decCouplerPlateInsideDiameter2      = 64.0 + 1.0;
decCouplerPlateInsideHeight2        = 8.5 + 1.0;
decCouplerOuterDiameter             = 94.0;
decCouplerBoltHolesRadius           = 54 / 2.0;
decCouplerBoltHolesDiameter         = 3.5;
decCouplerBoltHolesHeadDiameter     = 6.5;
decCouplerBoltHolesHeadHeight       = 2.2;
decCouplerBoltHoleGrabHeight        = 3.5;
decCouplerBoltHolesStepAngle        = 360.0 / 20;
decCouplerPlateInsideDiameter3      = 86.0;
decCouplerPlateInsideHeight3        = 25.0;
decCouplerOuterBoltHoleClearance    = 0.3;
decCouplerCenterHoleDiameter        = 14.0;

stepperCouplerDiameter              = 18.6;
stepperCouplerHeight                = 40.0;

stepperPlateDimensions              = [50, 44, 4.5];
stepperPlateHoleDistance            = 31.0/2;
stepperPlateVoidDiameter            = 23.5;
stepperPlateBoltDiameter            = 3.0;
stepperPlateBoltHeadDiameter        = 6.2;
stepperPlateBoltHeadHeight          = 2.0;

stepperBeltPulleyDistance           = 70.0;
stepperStrainwaveHeightOffset       = 12.89;
stepperStrainwaveOuterDiameter      = decCouplerOuterDiameter;
stepperStrainwaveInnerDiameter      = 50.0;
stepperStrainwaveBoltDiameter       = 3.5;
stepperStrainwaveBoltHeight         = 9.0;
stepperStrainwaveNutDiameter        = 6.4;
stepperStrainwaveHolesRadius        = 74.0 / 2.0;
stepperStrainwaveHoleAngle          = 360 / 12.0;
stepperStrainwaveCutoutAngles       = [55, 305];
stepperStrainwaveAllenCutoutWidth   = 10.0;
stepperStrainwaveAllenCutoutRotation= 75.0;
stepperStrainwaveAllenCutoutLength  = 33.0;
stepperReinforcementWidth           = 5.0;
stepperExtensionLength              = 17.0;

stepperAllenKeyHoleDiameter         = 2.5;
stepperAllenKeyHoleOffsetZ          = 10.0;
stepperPlateSlotLength              = stepperPlateBoltDiameter*5;

bearingPlateDiameter                = 121.55;
bearingPlateThickness               = 12.90;
bearingPlateCenterHoleDiameter      = 6.15 + 0.3;
bearingPlateInnerBoltHoleRadius     = 16.0;
m4HoleDiameter                      = 4.0;
m4BoltHeadDiameter                  = 9.0;
m4BoltHeadHeight                    = 3.6;
bearingPlateOuterBoltHoleRadius     = 109.55 / 2;
bearingFenderWasherDiameter         = 32.5;
bearingFenderWasherHeight           = 1.8;


forkInnerDiameter                   = 168.1;
forkOuterDiameter                   = forkInnerDiameter + 20.0 * 2;
forkHeight                          = 105.0;
forkPlateThickness                  = 6.0;
forkPlateReinforcementWidth         = 10.0;
forkBoltHoleOffsetZ                 = 90.0;
forkBoltHoleDiameter                = 4.07 + 0.5;
forkBoltHoleHeadDiameter            = 10.0;
forkBoltHoleDepth                   = 10.0;
forkBoltHoleAnglesLimit             = [180-110, 180+110];
forkBoltHoleLozengeWidth            = 26.0;
forkBoltHolesNumber                 = 8;
forkHigherDensitySplitHeight        = 75;

casingAttachmentBoltHeadDiameter    = 8.25;
casingAttachmentBoltEntryDepth      = forkHeight - forkHigherDensitySplitHeight - 8.0;
casingAttachmentBoltDiameter        = 4.3;
casingAttachmentBoltHoleLength      = casingAttachmentBoltEntryDepth + 25.0;
casingAttachmentBoltHeadHeight      = 3.0;

logoFont                            = "Verdana:style=Bold";
logoSize                            = 24;
logoHeight                          = 0.6;
logoSpacing                         = 30;
logoRotation                        = 4.5;
logoDiameter                        = 48;
logoRotate_x                        = 0;
logoRotate_y                        = 0;
logoRotate_z                        = 180;
logoText                            = "toliPykS";  // The text is reversed so it porints correctly

bearingPlateCouplerThickness        = 8.0;

m4InsertDiameter                    = 5.4;
m4InsertDepth                       = 7.0;

m3InsertDiameter                    = 4.35 + 0.2;
m3InsertDepth                       = 5.0;
m3BoltDiameter                      = 3.2;
m3BoltHeadDiameter                  = 6.2;
m3BoltHeadHeight                    = 2.5;
m3BoltCaseBottomDepth               = 9.0;

coverBoltsRadius                    = forkOuterDiameter/2 - 7.0;
coverThickness                      = 4.0;
coverMainHeight                     = 35.0 + coverThickness;
coverRotationIndicatorHeight        = 2.0 + coverThickness;
coverRotationIndicatorDiameter      = 40.0;
coverRotationIndicatorCoverHoleDia  = coverRotationIndicatorDiameter + 3.0;
coverCutoutDiameterOuter            = 19 + coverThickness * 2; 
coverCutoutBoltFlangeThickness      = 6.25;   
coverHeightExtension                = 73.0;
coverRotationIndicatorMarkWidth     = 2.0;
coverRotationIndicatorMarkDepth     = 0.6;

coverRotationIndicatorBoltDiameter  = 6.25 + 0.3;
coverRotationIndicatorBoltHeadDia   = 12.5;
coverRotationIndicatorBoltHeadHeight= 4.6;
 
insertDepth                         = 7.0;
insertDiameter                      = 5.35 + 0.3;

manifoldCorrection                  = 0.01;
manifoldCorrection2                 = manifoldCorrection * 2;
$fn                                 = 80;



if ( partNum == 0 || partNum == 1 )
    decCoupler();

if ( partNum == 0 || partNum == 2 )
    translate( [decCouplerOuterDiameter, 0, 0] )
        stepperCoupler();

if ( partNum == 0 || partNum == 3 )    
   translate( [0, decCouplerOuterDiameter + stepperCouplerDiameter + 20, 0] )
        stepperStrainwavePlateTop();

if ( partNum == 0 || partNum == 4 )    
   translate( [0, decCouplerOuterDiameter + stepperCouplerDiameter + 20, 0] )
        stepperStrainwavePlateBottom();
      
if ( partNum == 0 || partNum == 5 )   
    translate( [-140, 0, 0] )
        bearingPlate();

if ( partNum == 0 || partNum == 6 )
    cover();
 
if ( partNum == 0 || partNum == 7 )
    rotationIndicator();
 

 
module rotationIndicator()
{
    difference()
    {
        union()
        {
            difference()
            {   
                cylinder(d = coverRotationIndicatorDiameter, h = coverRotationIndicatorHeight);
        
                // Cutout indicator
                translate( [-coverRotationIndicatorMarkWidth/2, 0, -manifoldCorrection] )
                    cube( [coverRotationIndicatorMarkWidth, coverRotationIndicatorDiameter/2, coverRotationIndicatorMarkDepth + manifoldCorrection] );
            }
    
            // Put indicator back in
            color( [0.0, 0.0, 0.0] )
                translate( [-coverRotationIndicatorMarkWidth/2, 0, 0.0001] )
                    cube( [coverRotationIndicatorMarkWidth, coverRotationIndicatorDiameter/2, coverRotationIndicatorMarkDepth] );
        }
  
        // Bolt Hole
        translate( [0, 0, -manifoldCorrection] )
            cylinder(d = coverRotationIndicatorBoltDiameter, h = coverRotationIndicatorHeight + manifoldCorrection2);
        translate( [0, 0, -manifoldCorrection] )
            cylinder(d2 = coverRotationIndicatorBoltDiameter, d1 = coverRotationIndicatorBoltHeadDia, h = coverRotationIndicatorBoltHeadHeight + manifoldCorrection);
        
    }
}


   
module cover()
{
    deltaAngle2 = 400.0;

    difference()
    {
        union()
        {
            difference()
            {
                union()
                {
                    // Main Plate
                    cylinder(d = forkOuterDiameter, h = coverThickness);
        
                    // Surround
                    difference()
                    {
                        cylinder(d = forkOuterDiameter, h = coverMainHeight);
                        translate( [0, 0, -manifoldCorrection] )
                            cylinder(d = forkOuterDiameter - coverThickness * 2, h = coverMainHeight + manifoldCorrection2);
                    }
                }
        
                // Rotation Indicator Hole
                translate( [0, 0, -manifoldCorrection] )
                    cylinder(d = coverRotationIndicatorCoverHoleDia, h = coverThickness + manifoldCorrection2);
                       
                // SkyPilot text cutout
                translate( [0, 0, logoHeight - manifoldCorrection] )   
                rotate( [0, -90, 0] )
                    circleText(logoText);
            }
    
            // Surround for bolts
            difference()
            {
                for ( r = [-deltaAngle2*3, -deltaAngle2*2, -deltaAngle2, 0, deltaAngle2, deltaAngle2*2, deltaAngle2*3] )
                    rotate( [0, 0, r] )
                    {
                        translate( [-forkOuterDiameter/2, 0, 0] )
                            cylinder(d = coverCutoutDiameterOuter, h = coverMainHeight);
                    }
            
                translate( [0, 0, -manifoldCorrection] )
                    donut(forkOuterDiameter + coverCutoutDiameterOuter + 1.0, forkOuterDiameter, coverMainHeight + manifoldCorrection2);
            }
        
            // SkyPilot text addin
            color( [1.0, 0.0, 0.0] )
                translate( [0, 0, logoHeight - manifoldCorrection] )   
                    rotate( [0, -90, 0] )
                        circleText(logoText);
        }

        // Cover Bolt Holes
        for ( r = [-deltaAngle2*3, -deltaAngle2*2, -deltaAngle2, 0, deltaAngle2, deltaAngle2*2, deltaAngle2*3] )
            rotate( [0, 0, r] )
            {
                translate( [-coverBoltsRadius, 0, 0] )
                {
                    // Bolt Hole
                    translate( [0, 0, -manifoldCorrection] )
                        cylinder(d = m3BoltDiameter, h = coverMainHeight + manifoldCorrection2);
                        
                    // Head Hole    
                    translate( [0, 0, -manifoldCorrection] )
                        cylinder(d = m3BoltHeadDiameter, h = coverMainHeight - coverCutoutBoltFlangeThickness + manifoldCorrection);
                        
                    // Head
                    translate( [0, 0, coverMainHeight - coverCutoutBoltFlangeThickness - manifoldCorrection] )
                        cylinder(d2 = m3BoltDiameter, d1 = m3BoltHeadDiameter, h = m3BoltHeadHeight + manifoldCorrection);
                }
            }
    }
    
    difference()
    {
        sector(forkOuterDiameter/2, [-54, 54], coverHeightExtension, fn = 80);
        translate( [0, 0, -manifoldCorrection] )
            cylinder(d = forkOuterDiameter - coverThickness * 2, h = coverHeightExtension + manifoldCorrection2);
    }
}

 
    
module stepperStrainwavePlateTop()    
{
    difference()
    {
        stepperStrainwavePlate();
        translate( [0, 0, -manifoldCorrection] )
            cylinder(d = forkOuterDiameter + manifoldCorrection2, h = forkHigherDensitySplitHeight + manifoldCorrection);
    }
}



module stepperStrainwavePlateBottom()
{
    difference()
    {
        stepperStrainwavePlate();
        translate( [0, 0, forkHigherDensitySplitHeight] )
            cylinder(d = forkOuterDiameter + manifoldCorrection2, h = forkHeight - forkHigherDensitySplitHeight + manifoldCorrection);
    }
}    
    
 
 
module bearingPlate()
{
    difference()
    {
        donut(bearingPlateDiameter, bearingPlateCenterHoleDiameter, bearingPlateThickness);
        
        translate( [0, 0, bearingPlateThickness - bearingFenderWasherHeight] )
            cylinder(d = bearingFenderWasherDiameter, h = bearingFenderWasherHeight + manifoldCorrection);

        // Inner bolt holes
        for ( r = [0, 90, 180, 270] )
            rotate( [0, 0, r] )
                translate( [bearingPlateInnerBoltHoleRadius, 0, -(bearingFenderWasherHeight + manifoldCorrection)] )
                    m4BoltHole(bearingPlateThickness, 0);
                   
        // Outer inserts
        for ( r = [0, 45, 90, 135, 180, 225, 270, 315] )
            rotate( [0, 0, r] )
                translate( [bearingPlateOuterBoltHoleRadius, 0, -manifoldCorrection] )
                    m4Insert(bearingPlateThickness);
    }
}


module m4Insert(height)
{
    translate( [0, 0, -manifoldCorrection] )
        cylinder(d = m4HoleDiameter, h = height + manifoldCorrection2);
    translate( [0, 0, height - m4InsertDepth] )
        cylinder(d = m4InsertDiameter, h = m4InsertDepth + manifoldCorrection2);
}


module m4BoltHole(height, clearance)
{
    cylinder(d = m4HoleDiameter + clearance, h = height + manifoldCorrection2);
    translate( [0, 0, height - m4BoltHeadHeight] )
        cylinder(d1 = m4HoleDiameter + clearance, d2 = m4BoltHeadDiameter, h = m4BoltHeadHeight + manifoldCorrection2);
    translate( [0, 0, height] )
        cylinder(d = m4BoltHeadDiameter, h = bearingFenderWasherHeight + manifoldCorrection2); 
}
 

 
module circleText(myText)
{
    length = len(myText);
    
    for( a = [0:length] )
    {
        rotate( [0, length/2 * logoRotation - ( a * logoSpacing), 270] )
            translate( [logoDiameter, 0, 0] )
                rotate( [0, 270, 90] )
                    rotate( [logoRotate_x, logoRotate_y, logoRotate_z] )
                        linear_extrude( height=logoHeight )
                            text( myText[a], size=logoSize, font=logoFont, halign="center", valign="bottom", spacing=1, direction="ltr", $fn=100);
    }
}


 
module stepperStrainwavePlate()
{
    difference()
    {
        union()
        {
            strainwavePlateHeight = stepperStrainwaveHeightOffset + stepperPlateDimensions[2];
    
            // Strainwave plate
            difference()
            {
                union()
                {
                    donut(stepperStrainwaveOuterDiameter, stepperStrainwaveInnerDiameter, strainwavePlateHeight);
                    translate( [stepperBeltPulleyDistance, 0, 0] )
                    stepperPlate(strainwavePlateHeight);
                    difference()
                    {
                        sector(forkOuterDiameter/2, stepperStrainwaveCutoutAngles, strainwavePlateHeight, fn=$fn);
                        translate( [0, 0, -manifoldCorrection] )
                            cylinder(d=stepperStrainwaveInnerDiameter, h = strainwavePlateHeight + manifoldCorrection2);
                    }
                }
  
                for ( r = [0:stepperStrainwaveHoleAngle:360] )
                    rotate( [0, 0, r] )
                        translate( [stepperStrainwaveHolesRadius, 0, -manifoldCorrection] )
                        {
                            cylinder(d = stepperStrainwaveBoltDiameter, h = strainwavePlateHeight + manifoldCorrection2, $fn = 20);
                            cylinder(d = stepperStrainwaveNutDiameter, h = strainwavePlateHeight - stepperStrainwaveBoltHeight + manifoldCorrection, $fn = 6);
                        }
                
                // Allen key cutout
                rotate( [0, 0, stepperStrainwaveAllenCutoutRotation] )
                    translate( [-stepperStrainwaveAllenCutoutWidth/2, 0, -manifoldCorrection] )
                        cube( [stepperStrainwaveAllenCutoutWidth, stepperStrainwaveAllenCutoutLength, strainwavePlateHeight * 0.75 + manifoldCorrection] ); 
            }

            difference()
            {
                difference()
                {
                    sector(forkOuterDiameter/2, stepperStrainwaveCutoutAngles, forkHeight, fn=$fn);
                    translate( [0, 0, -manifoldCorrection] )
                        cylinder(d = forkInnerDiameter, h = forkHeight + manifoldCorrection2);   
                }
            
                sideThickness = (forkOuterDiameter - forkInnerDiameter) / 2;
                deltaAngle = (forkBoltHoleAnglesLimit[1]-forkBoltHoleAnglesLimit[0]) / (forkBoltHolesNumber-1);
                for ( r = [forkBoltHoleAnglesLimit[0]:deltaAngle:forkBoltHoleAnglesLimit[1]] )
                    rotate( [0, 0, r] )
                        translate( [forkOuterDiameter/2 - forkBoltHoleDepth, 0, forkBoltHoleOffsetZ] )
                            rotate( [0, 90, 0] )
                            {
                                lozenge(forkBoltHoleLozengeWidth, forkBoltHoleHeadDiameter, forkBoltHoleDepth);
                                translate( [0, 0, -(sideThickness - forkBoltHoleDepth + forkBoltHoleDepth/2)] )
                                    lozenge(forkBoltHoleLozengeWidth - (forkBoltHoleHeadDiameter - forkBoltHoleDiameter), forkBoltHoleDiameter, forkBoltHoleDepth * 2);
                            }
        
                // Casing Bolt/Insert Holes
                for ( r = [-deltaAngle*3, -deltaAngle*2, -deltaAngle, 0, deltaAngle, deltaAngle*2, deltaAngle*3] )
                    rotate( [0, 0, r] )
                        casingBoltAssmebly();    
            }
        }
        
        // Cover Bolt/Insert Holes
        deltaAngle2 = 400.0;
        for ( r = [-deltaAngle2*3, -deltaAngle2*2, -deltaAngle2, 0, deltaAngle2, deltaAngle2*2, deltaAngle2*3] )
            rotate( [0, 0, r] )
                coverBoltHole();
    }
}



module coverBoltHole()
{
    translate( [-coverBoltsRadius, 0, 0] )
    {
        translate( [0, 0, -1] )
        {
            cylinder(d = m3BoltDiameter, h = m3BoltCaseBottomDepth + manifoldCorrection);
            cylinder(d = m3InsertDiameter, h = m3InsertDepth + manifoldCorrection);
        }
    }
}



module casingBoltAssmebly()
{
    translate( [-(forkOuterDiameter + forkInnerDiameter) / 4, 0, 0] )
    {
        // Head clearance hole
        translate( [0, 0, forkHeight - casingAttachmentBoltEntryDepth] )
            cylinder(d = casingAttachmentBoltHeadDiameter, h = casingAttachmentBoltEntryDepth + manifoldCorrection);
            
        // Bolt hole
        translate( [0, 0, forkHeight - casingAttachmentBoltHoleLength] )
            cylinder(d = casingAttachmentBoltDiameter, h = casingAttachmentBoltHoleLength + manifoldCorrection);
            
        // Bolt Head
        translate( [0, 0, forkHeight - (casingAttachmentBoltEntryDepth + casingAttachmentBoltHeadHeight)] )            
            cylinder(d1 = casingAttachmentBoltDiameter, d2 = casingAttachmentBoltHeadDiameter, h = casingAttachmentBoltHeadHeight + manifoldCorrection);
                    
        // Insert
        translate( [0, 0, forkHigherDensitySplitHeight - m4InsertDepth] )
            cylinder(d = m4InsertDiameter, h = m4InsertDepth + manifoldCorrection);
    }
 }



module stepperPlate(strainwavePlateHeight)
{
    // Stepper Plate
    difference()
    {
        translate( [-stepperExtensionLength/2, 0, stepperPlateDimensions[2]/2] )
            cube( [stepperPlateDimensions[0] + stepperExtensionLength, stepperPlateDimensions[1], stepperPlateDimensions[2]] , center = true );
           
        for(pos = [ [-stepperPlateHoleDistance,-stepperPlateHoleDistance],
                    [ stepperPlateHoleDistance,-stepperPlateHoleDistance],
                    [-stepperPlateHoleDistance, stepperPlateHoleDistance],
                    [ stepperPlateHoleDistance, stepperPlateHoleDistance] ] )
            translate( [pos[0], pos[1], -manifoldCorrection] )
                lozenge(stepperPlateSlotLength, stepperPlateBoltDiameter, stepperPlateDimensions[2] + manifoldCorrection2);
                    
        translate( [0, 0, -manifoldCorrection] )
            lozenge(stepperPlateVoidDiameter + stepperPlateSlotLength - stepperPlateBoltDiameter, stepperPlateVoidDiameter, stepperPlateDimensions[2] + manifoldCorrection2);
    }
        
    // Side reinforcement
    for( y = [stepperPlateDimensions[1]/2 + stepperReinforcementWidth/2, -stepperPlateDimensions[1]/2 - stepperReinforcementWidth/2] )
        translate( [-stepperExtensionLength/2, y, strainwavePlateHeight/2] )
            cube( [stepperPlateDimensions[0] + stepperExtensionLength, stepperReinforcementWidth, strainwavePlateHeight], center = true);
        
}



module extensionPlate(strainwavePlateHeight)
{
    difference()
    {
        translate( [0, 0, extensionPlateDimensions[2]/2] )
            cube( extensionPlateDimensions , center = true );
        translate( [(extensionPlateDimensions[0] - extensionClampLength)/2, 0, -manifoldCorrection] )
            cylinder(d = extensionPlateHoleDiameter, h = extensionPlateDimensions[2] + manifoldCorrection2);
    }

    // Side reinforcement
    for( y = [extensionPlateDimensions[1]/2 + stepperReinforcementWidth/2, -extensionPlateDimensions[1]/2 - stepperReinforcementWidth/2] )
        translate( [0, y, strainwavePlateHeight/2] )
            cube( [extensionPlateDimensions[0], stepperReinforcementWidth, strainwavePlateHeight], center = true);
}
 

 
module stepperCoupler()
{
    cylinder(d = stepperCouplerDiameter, h = stepperCouplerHeight);
}



module decCoupler()
{
    difference()
    {
        union()
        {
            // Plate Base
            difference()
            {
                donut(decCouplerOuterDiameter, decCouplerPlateBaseBoltDiameter, decCouplerPlateBaseThickness);
                
                // Center Bolt Hole
                translate( [0, 0, -manifoldCorrection] )
                    cylinder(d = decCouplerCenterHoleDiameter, h = decCouplerPlateBaseThickness + manifoldCorrection2);
            }
    
            // First Ring
            translate( [0, 0, decCouplerPlateBaseThickness] )
            {
                donut(decCouplerOuterDiameter, decCouplerPlateInsideDiameter1, decCouplerPlateInsideHeight1);
                // 2nd Ring
                translate( [0, 0, decCouplerPlateInsideHeight1] )
                {
                    donut(decCouplerOuterDiameter, decCouplerPlateInsideDiameter2, decCouplerPlateInsideHeight2);
                    translate( [0, 0, decCouplerPlateInsideHeight2] )
                        donut(decCouplerOuterDiameter, decCouplerPlateInsideDiameter3, decCouplerPlateInsideHeight3);
                }
            }
            
            // Bearing Plate Coupler
            donut(bearingPlateDiameter, decCouplerCenterHoleDiameter, bearingPlateCouplerThickness);
        }
        
        // Bearing Plate Coupler Holes
        for ( r = [0, 45, 90, 135, 180, 225, 270, 315] )
            rotate( [0, 0, r] )
                translate( [bearingPlateOuterBoltHoleRadius, 0, -manifoldCorrection] )
                    m4BoltHole(bearingPlateCouplerThickness, decCouplerOuterBoltHoleClearance);
        
        // Bolt Holes
        for ( r = [0:decCouplerBoltHolesStepAngle:360] )
            rotate( [0, 0, r] )
                translate( [decCouplerBoltHolesRadius, 0, 0] )
                    {
                        translate( [0, 0, -manifoldCorrection] )
                        {
                               cylinder(d = decCouplerBoltHolesHeadDiameter, h = decCouplerPlateBaseThickness +   decCouplerPlateInsideHeight1 - decCouplerBoltHoleGrabHeight, $fn = 20);
                                
                               translate( [0, 0, decCouplerPlateBaseThickness + decCouplerPlateInsideHeight1 - decCouplerBoltHoleGrabHeight - manifoldCorrection] )
                                    cylinder(d1 = decCouplerBoltHolesHeadDiameter, d2 = decCouplerBoltHolesDiameter, h = decCouplerBoltHolesHeadHeight + manifoldCorrection, $fn = 20);
                               cylinder(d = decCouplerBoltHolesDiameter, h = decCouplerPlateBaseThickness + decCouplerPlateInsideHeight1 + manifoldCorrection2, $fn = 20);
                        }
                    }
    }
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



module lozenge(length, width, height)
{
    hull()
    {
        translate( [-(length-width)/2, 0, 0] )
            cylinder(d=width, h=height);
        translate( [(length-width)/2, 0, 0] )
            cylinder(d=width, h=height);
    }
}



module sector(radius, angles, thickness, fn = 24) {
    r = radius / cos(180 / fn);
    step = -360 / fn;

    linear_extrude(thickness)
    {
        points = concat([[0, 0]],
            [for(a = [angles[0] : step : angles[1] - 360]) 
                [r * cos(a), r * sin(a)]
            ],
            [[r * cos(angles[1]), r * sin(angles[1])]]
        );

        difference() {
            circle(radius, $fn = fn);
            polygon(points);
        }
    }
}
