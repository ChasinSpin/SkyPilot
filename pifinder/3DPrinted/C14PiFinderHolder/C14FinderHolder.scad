// Copyright: Jetty 2022
// License: CC BY-NC-SA  Creative Commons: Attribution-NonCommercial-ShareAlike
//
// Parametric Vixen Type Dovetail Holder
//
// All dimensions are in mm's
//
// Instructions:
//      Set values in "Change these to for your requirements, you probably need to at least change your 
//      baseCircumference below for the size of your scope, or change to zero to fit a flat surface.
//
//      Change partNum to 1 and hit F6 and export the STL
//      Repeat this for parts 2, 3 and 4
//      (part 0 is only to show everything assembled and how it fits, part 0 is not printable)
//
// Requirements:
//      Strong Double Sided Tape or Foam Tape
//      Hot glue
//
//      Hardware:
//          1 x Hex Head Bolt M6 x 30
//          1 x Nut M6
//          1 x Washer 15.75 OD, 8.5 ID, 1.6mm thick
//          (but it's parametric, so change to what you have on hand)
//
//  Assembly:
//      Glue bolt into knob and glue on cap
//      Drop Nut in channel, attach clamp and insert bolt/washer
//      Put drop of hot glue in channel to retain nut (don't overdo this, don't want to glue the bolt in place)

partNum             = 0;    // Set the part number, 0=everything, 1=mount, 2=clamp, 3=knob, 4=knob cap

// Change these to fit your requirements
baseCircumference   = 1220;              // Circumference of mounting area (e.g. telescope tube. 
                                        // Measure with string.  0 = flat base
baseThickness       = 8;                // Thickness of the base
baseLength          = 60;               // Length of the base
baseWidth           = 55;               // Including optional end cap
endCapThickness     = 3;                // End cap to prevent item falling out. Optional, set to 0 if not used
boltLength          = 30;               // Bolt length, not including head, include clearance
boltDiameter        = 6.1;              // Include clearance
boltHeadDiameter    = 11.3;               // Diameter of the bolt head (largest) including clearance
boltHeadThickness   = 4;                // Bolt head thickness, including clearance
nutDiameterLarge    = 11.7;               // Diameter of the nut (largest) including clearance
nutDiameterSmall    = 10.25;             // Diameter of the nut (smallest) including clearance
nutThickness        = 5.3;              // Thickness of nut including clearance
washerDiameter      = 12.3;             // Include clearance
washerThickness     = 1.5;
channelThickness    = 6;                // Thickness if the side channels
channelClearance    = 0.2;              // Half the clearance around the side channels
// Probably shouldn't change these
dovetailBaseLength  = 40;
dovetailBottomWidth = 31.5;
dovetailTopWidth    = 18.4;
dovetailHeight      = 10;
dovetailAdjRange    = 6;                // How much the clamp can be adjusted by
nutEmbeddedDepth    = 4.5;                // Distance between bottom of Vixen and Top Of Nut
knobDiameter        = boltHeadDiameter + 5;
knobFlangeThickness = 2;
knobThickness       = knobFlangeThickness * 2 + boltHeadThickness;
knobCapClearance    = 0.2;

// Do not change these
baseDiameter        = baseCircumference / PI;
dovetailBaseHeight  = nutEmbeddedDepth + nutDiameterLarge + nutEmbeddedDepth;
nutAccessDepth      = nutDiameterLarge/2 + nutEmbeddedDepth + baseThickness + 5;    // Add 5 min for curve clearance

manifoldCorrection  = 0.01;
$fn                 = 80;



if ( partNum == 0 || partNum == 1 )
    mount();

if ( partNum == 0 || partNum == 2 )
    clamp();

if ( partNum == 0 || partNum == 3 )
{
    if ( partNum == 0 )
    {
        translate( [0, -dovetailBaseLength/2, -(nutDiameterLarge / 2 + nutEmbeddedDepth) + dovetailBaseHeight] )
 
            rotate( [90, 0, 0] )
                knobAndCap();
    }
    else
        knob();
}

if ( partNum == 4 )
{
        knobCap();
}



module knobAndCap()
{
    knob();
    translate( [0, 0, knobFlangeThickness + boltHeadThickness] )
        knobCap();
}



module knob()
{
    difference()
    {
        knobBase();
        knobBoltVoid();
    }
 }



module knobCap()
{
    cylinder(d=boltHeadDiameter - knobCapClearance, h = knobFlangeThickness - knobCapClearance);
}



module knobBase()
{
    cylinder(d=knobDiameter, h = knobThickness);
 
    knurlDiameter = ((knobDiameter * PI) / (360/30)) / 2;
    
    for ( r = [0 : 30 : 359] )
    {
        rotate( [0, 0, r] )
            translate( [-knobDiameter/2, 0, 0] )
                cylinder(d=knurlDiameter, h = knobThickness);
    }
}



module knobBoltVoid()
{
    // Bolt hole
    translate( [0, 0, -manifoldCorrection] )
        cylinder(d=boltDiameter, h=knobThickness + manifoldCorrection * 2);
    
    // Head void
    translate( [0, 0, knobFlangeThickness] )
        cylinder(d=boltHeadDiameter, h=boltHeadThickness, $fn=6);
    
    // Top void
    translate( [0, 0, knobFlangeThickness + boltHeadThickness - manifoldCorrection] )
        cylinder(d=boltHeadDiameter, h = knobFlangeThickness + manifoldCorrection * 2);
}



module mount()
{

    difference()
    {
        base();
        translate( [0, 0, dovetailBaseHeight] )
            vixenBlockBoltNutWasherAssembly();
    }

    translate( [0, 0, dovetailBaseHeight] )
    {
        vixenBlockLeft();
    }
}



module clamp()
{
    translate( [0, 0, dovetailBaseHeight] )
        vixenBlockRight();
}



module vixenBlockLeft()
{
    difference()
    {
        vixenBlock();
        
        // Remove Right Block
        translate( [-baseWidth/2-manifoldCorrection, -(dovetailBaseLength + dovetailTopWidth/2), -dovetailBaseHeight - manifoldCorrection] )
            cube([baseWidth + manifoldCorrection * 2, dovetailBaseLength + manifoldCorrection * 2, dovetailBaseHeight + dovetailHeight + manifoldCorrection * 2]);
        
        // Remove Channels
        translate( [baseWidth/2 - channelThickness - channelClearance, -dovetailBaseLength/2 + manifoldCorrection, -(dovetailBaseHeight + 0.5 * dovetailBaseHeight)/2 - manifoldCorrection - channelClearance] )
            cube( [channelThickness + channelClearance + manifoldCorrection, dovetailBaseLength, 0.5 * dovetailBaseHeight + channelClearance * 2] );

        translate( [-baseWidth/2-manifoldCorrection, -dovetailBaseLength/2 + manifoldCorrection, -(dovetailBaseHeight + 0.5 * dovetailBaseHeight)/2 - manifoldCorrection - channelClearance ] )
            cube( [channelThickness + channelClearance, dovetailBaseLength, 0.5 * dovetailBaseHeight + channelClearance * 2] );
    }
}



module vixenBlockRight()
{
    difference()
    {
        vixenBlock();
        
        // Remove Left Block
        translate( [-baseWidth/2-manifoldCorrection, -dovetailTopWidth/2, -dovetailBaseHeight - manifoldCorrection] )
            cube([baseWidth + manifoldCorrection * 2, dovetailBaseLength + manifoldCorrection * 2, dovetailBaseHeight + dovetailHeight + manifoldCorrection * 2]);
    }
    
    // Add Channel Fingers
    translate( [baseWidth/2 - channelThickness + channelClearance, -dovetailBaseLength/2, -(dovetailBaseHeight + 0.5 * dovetailBaseHeight)/2 + channelClearance] ) 
        cube( [channelThickness - channelClearance, dovetailBaseLength-dovetailAdjRange, 0.5 * dovetailBaseHeight - channelClearance * 2] );

    translate( [-baseWidth/2, -dovetailBaseLength/2, -(dovetailBaseHeight + 0.5 * dovetailBaseHeight)/2 + channelClearance ] )
        cube( [channelThickness - channelClearance, dovetailBaseLength-dovetailAdjRange, 0.5 * dovetailBaseHeight - channelClearance * 2] );
}



module vixenBlock()
{
    difference()
    {
        union()
        {
            difference()
            {
                // The base
                translate( [-baseWidth/2, -dovetailBaseLength/2, -dovetailBaseHeight] )
                    cube( [baseWidth, dovetailBaseLength, dovetailBaseHeight + dovetailHeight] );
        
                // Remove the dovetail void
                scale( [1.001, 1.001, 1.001] )
                    dovetail();
            }
        
            translate( [-baseWidth/2, -dovetailBaseLength/2, 0] )
                cube( [endCapThickness, dovetailBaseLength, dovetailHeight] ); 
        }
        
        // Remove the adjustment range void
        translate( [0, -(dovetailTopWidth - dovetailAdjRange)/2, -dovetailBaseHeight/2 + dovetailHeight/2] )
            cube( [baseWidth + manifoldCorrection * 2, dovetailAdjRange, dovetailBaseHeight + dovetailHeight + manifoldCorrection * 2], center = true);
        
        // Block Nut and Washer Assembly Voids
        vixenBlockBoltNutWasherAssembly();
    }
}



module vixenBlockBoltNutWasherAssembly()
{
    // Bolt Hole
    translate( [0, -dovetailBaseLength/2 - manifoldCorrection, -(nutDiameterLarge / 2 + nutEmbeddedDepth)] )
        rotate( [-90, 0, 0] )
            cylinder(d=boltDiameter, h = dovetailBaseLength + manifoldCorrection * 2);

    // Nut Void
    translate( [0, 0, -(nutDiameterLarge / 2 + nutEmbeddedDepth)] ) 
        rotate( [-90, 90, 0] )
            cylinder(d=nutDiameterLarge, h=nutThickness, $fn=6);
        
    // Nut Access Channel
    translate( [-nutDiameterSmall/2, 0, -(nutDiameterLarge / 2 + nutEmbeddedDepth + nutAccessDepth)] )
        cube( [nutDiameterSmall, nutThickness, nutAccessDepth] );
        
    // Washer void
    translate( [0, -dovetailBaseLength/2 - manifoldCorrection, -(nutDiameterLarge / 2 + nutEmbeddedDepth)] )
        rotate( [-90, 0, 0] )
            cylinder(d=washerDiameter, h = washerThickness);
}



module dovetail()
{
    hull()
    {
        translate( [-baseWidth/2, -dovetailBottomWidth/2, 0] )
            cube( [baseWidth, dovetailBottomWidth, 0.1] );
        translate( [-baseWidth/2, -dovetailTopWidth/2,dovetailHeight - 0.1] )
            cube( [baseWidth, dovetailTopWidth, 0.1] );
    }     
}



module base()
{
    rotate( [0, -90, 0] )
    {
        translate( [0, 0, -baseWidth / 2] )
        {
            if ( baseCircumference == 0 )
            {
                translate( [-baseThickness, -baseLength / 2, 0] )
                    cube( [baseThickness, baseLength, baseWidth] );
            }
            else
            {
                // Convert baseLength to degrees of a circle
                arcDegrees = (baseLength / baseCircumference) * 360;

                // Create the base to fit the curve
                translate( [-(baseDiameter/2 + baseThickness), 0, 0] )
                    rotate( [0, 0, -arcDegrees/2] )
                        rotate_extrude(angle=arcDegrees, $fn=400)
                            translate( [baseDiameter/2,0, 0] )
                                square( [baseThickness, baseWidth]);
            }
        }
    }
    
    translate( [0, 0, -baseThickness/2] )
        cube( [baseWidth, dovetailBaseLength, baseThickness], center = true);
}
