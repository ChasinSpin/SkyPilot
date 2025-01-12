# Goto Notes

## Byers RA Steppper Motor

* [Part Number: 3008-002](https://www.hurst-motors.com/asabsgeared.html)  Reduction ratio 150:1 12V Unipolar
	
	Current: Worm gear has 216 teeth, and the worm gear rotates once evey 6.6666 minutes, sidereal rates is 1440.091s/day.  This is 1.6666 degrees of rotation per tooth (360/216).
	Drive Gear from motor to worm seems like a 2:1 reduction (needs measuring) and drive contains a 150:1 reduction, so total reduction = ~150 x 2 x 216 = 64800:1
		
	* [Drive Link](https://www.cloudynights.com/topic/285415-byers-c14-starmaster-drive-retrofit/)

	* [Telescope Drive Comparisons](https://www.dfmengineering.com/news_telescope_gearing.html)


These are just notes, nothing of any relevance:

* [Dome Control](https://stargazerslounge.com/topic/407704-control-of-dome-to-keep-telescope-in-centre-of-slot/)

## DEC

Ordered Drive Hollow HBK17 100:1 10arc second backlash
https://www.aliexpress.us/item/1005005920547351.html



https://www.aliexpress.us/item/1005005920547351.html?search_direct=true&spm=a2g0o.productlist.0.0&gatewayAdapt=glo2usa

https://www.aliexpress.us/item/1005005177584882.html?search_direct=true&spm=a2g0o.productlist.0.0&gatewayAdapt=glo2usa

https://www.aliexpress.us/item/1005005060671872.html?search_direct=true&spm=a2g0o.productlist.0.0&gatewayAdapt=glo2usa

Likely a ZWO version of LHS-17-100-CL-III
https://www.leaderdrive.com/strain-wave-gears/lhs-standard-hollow-shaft-flexspline-strain-wave-gear-lhs.asp

Nema 14 (probably use 17)
B62MXL belt 10mm?  Measure and measure the gears in the AM5
Belt:  B62MXL10RF

No brake on Dec

RA: 17D4401-19BK Bipolar (Nema 17)
    • Phase Reistance: 2.30-2.35 Ohm
    • Phase Inductance: 3.7mH @ 1KHz
    • Double shaft with nut on one end: 5mm Diameter
 DEC: 14M3404 Bipolar (Nema 14)
    • Phase Resistance: 7.09-7.21 Ohm
    • Phase Inductance: 7.8-7.9mH @ 1Khz
    • Single shaft: 5mm Diameter, 22mm high

Stepper Drivers: Trinamic TMC5130A-TA 2.5A 5-46V 256 micro step https://www.trinamic...eet_Rev1.18.pdf

Strainwave gear 100:1

Center points are opto interrupted
Reduction 300:1   Stainwave + synchronous belt
Periodic Error <+- 20”
PE Duration 432s
Load Capacitor 13kg
Slew 6 deg/s

Hollow type

https://www.omc-stepperonline.com/hht-series-harmonic-drive-gearbox-70mm-ratio-100-1-backlash-20arcsec-8mm-input-diameter-hht-14-100-i-d8

# Uploading Firmare

1. Open OnStepX.ino in firmware/OnStepX using Arduino 2.3.2
2. Select the port for the Teensy 4.1
3. Connect USB to the Teensy
4. Board should be set to Teensy 4.1
5. Board Settings: Optimize: Faster, CPU Speed: 600MHz, USB Type Serial
6. Compile firmware and upload

## To Wipe NV Ram

Set NV Wipe in Extended.config.h and upload, wait 2 mins, then upload again with NV Wipe Off.

# Mount Startup

1. Set date/location
2. Unpark mount.  (Mount will not be in tracking mode)
3. Slew to NCP
4. Click Home Reset
5. Enable tracking
6. Slew

# Mount Operation

1. Goto/Controls changes the slewing speed