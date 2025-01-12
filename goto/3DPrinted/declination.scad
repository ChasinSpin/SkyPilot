// 2 (Declination Coupler) No support, 30% fill
// 
//
// 3
//      15% Fill, Support Required
//
// 4 (Bearing Plate):
//      50% Fill, 4 wall loops, no support
//      PAHT-CF and Gluestick on the bed


partNum                             = 1;    // 0= All, 1 = Dec Coupler, 2 = Stepper Coupler Rod, 3 = Stepper Strainwave Plate (decPlate), 4 = Bearing Plate

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
forkBoltHoleOffsetZ                 = 93.0;
forkBoltHoleDiameter                = 4.07 + 0.5;
forkBoltHoleHeadDiameter            = 10.0;
forkBoltHoleDepth                   = 10.0;
forkBoltHoleAnglesLimit             = [180-110, 180+110];
forkBoltHoleLozengeWidth            = 34.0;
forkBoltHolesNumber                 = 8;

logoFont                            = "Verdana:style=Bold Italic";
logoSize                            = 24;
logoHeight                          = 2;
logoSpacing                         = 20;
logoRotation                        = -4.9;
logoDiameter                        = 60;
logoRotate_x                        = 0;
logoRotate_y                        = 0;
logoRotate_z                        = 180;
logoText                            = "toliPykS";  // The text is reversed so it porints correctly

bearingPlateCouplerThickness        = 8.0;

m4InsertDiameter                    = 5.4;
m4InsertDepth                       = 7.0;

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
        stepperStrainwavePlate();
      
if ( partNum == 0 || partNum == 4 )   
    translate( [-140, 0, 0] )
        bearingPlate();
    
    
 
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
               
         // SkyPilot text
         translate( [0, 0, logoHeight - manifoldCorrection] )   
            rotate( [0, -90, 0] )
                circleText(logoText);
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
        for ( r = [forkBoltHoleAnglesLimit[0]:(forkBoltHoleAnglesLimit[1]-forkBoltHoleAnglesLimit[0]) / (forkBoltHolesNumber-1):forkBoltHoleAnglesLimit[1]] )
            rotate( [0, 0, r] )
                translate( [forkOuterDiameter/2 - forkBoltHoleDepth, 0, forkBoltHoleOffsetZ] )
                    rotate( [0, 90, 0] )
                    {
                        lozenge(forkBoltHoleLozengeWidth, forkBoltHoleHeadDiameter, forkBoltHoleDepth);
                        translate( [0, 0, -(sideThickness - forkBoltHoleDepth + forkBoltHoleDepth/2)] )
                            lozenge(forkBoltHoleLozengeWidth - (forkBoltHoleHeadDiameter - forkBoltHoleDiameter), forkBoltHoleDiameter, forkBoltHoleDepth * 2);
                    }
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
