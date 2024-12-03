# PiFinder

## WCO Usage Instructions

*Note: PiFinder is a push-to solution, primarily until the Goto solution is fully implemented. After that, I may remove PiFinder from the scope and use another solution or integrate it into the Goto, that decision hasn't been made yet.*

* **DO NOT:**
	* Remove PiFinder from its' mount, knock or bump it, we want alignment to be maintained for the next user
	* Attempt to use PiFinder without training. PiFinder is password protected, and this is provided at the end of the training.
	* Change any settings other than the settings accessed via the device buttons on the device itself
	* Adjust Focus

## Setup

* Make sure PiFinder has the GPS cable connected and the cable is located such that it cannot be caught by the user as the cable is thin and can be damaged
* Connect USB Power Adapter
* Power on PiFinder and wait for the display to show a menu
* Remove lens cover
* Enter 4 digit pin provided to you, to enable the panel buttons

## Alignment (if needed)

* Put a bright star in the center of the eyepiece
* On "Camera" Screen, press the action button (looks like a STOP symbol, bottom right hand corner of the keypad), and select the same star by pressing the correct number that matches the star. The C14 and PiFinder axis are now aligned

## Connecting Via Sky Safari 7 (Plus or Pro) and selecting target

* Connect to the Wifi PiFinderAP (there's no password).  Note: Androids often need you to wait until a popup appears for the network confirming connection to a network without internet
* Click Scope and Connect in Sky Safari
* Make sure "Lock" is on, so that the screen automatically updates to the telescope position 
* Select target and click Goto. PiFinder comes up with a "Push", press the right arrow on the PiFinder.  Alternatively you can just slew to the target by moving the C14 and watching the current position in SkySafari

## Selecting Target on PiFinder Buttons

* Select "Objects"
* Find the object and press the right arrow

## Moving The Telescope

The PiFinder updates it's position (Alt/Az) when moving the telescope during which the screen is a bit dimmer.  When stationary, a photo is taken, plate-solved, the position updated and screen goes brighter.  A plate-solve always give you an accurate distance to the target.

The arrows are Alt/Az arrows not RA/DEC so can take a bit of practice to get used to, and they are inverted in direction sometimes, so just minimize the numbers on the screen so they are close to zero until you have the object in the eyepiece.

It's possible to get on target without looking through the eyepiece.

## Finish

* Cover lens with lens cover
* Disconnect GPS wire and put in ziploc bag
* Put cover back on GPS connector
* Remove Power adapter from the USB lead and place in ziploc bag
* Place ziploc bag back in the cupboard
* Wrap Grey USB cable losely around the PiFinder without bumping the PiFinder

## SkySafari 7 (Plus and Pro)

PiFinder can also be used with SkySafari on your mobile device via Telescope Control. Telescope Control is only available in SkySafari 7 Plus and SkySafari 7 Pro.

PiFinder will only be available in SkySafari AFTER the 4 digit pin has been entered.

To setup:

* Menu / Settings / Telescope / Presets / Click "Add Preset"
* Select "Other"
	* Mount Type: Alt-Az. GoTo
	* Scope Type: Meade LX200 Classic 
	* Click "Next"
	* IP Address: pifinder.local
	* Port Number: 4030
	* Connect to the PiFinderAp Network in your phones settings. Note: Androids often need you to wait until a popup appears for the network confirming connection to a network without internet
	* Click on "Check Connection Now"
	* If connection verified, click Next, otherwise check the network you're connected to
	* Change Preset name to "PiFinder"
	* Make sure "Set Telescope Time & Location" is UNCHECKED
	* Click "Save Preset"
	* Select "PiFinder" and connect
	* Click on Observe / Scope Display and enable Telrad Circles and Cross Hairs so you can see a target for the current C14 position in SkySafari

A graphical representation of setting up on SkySafari can be found here: [PiFinder SkySafari Setup Instructions](https://pifinder.readthedocs.io/en/main/skysafari.html)


# Everything Below This Point Are Developer Notes:

## Install

* Image PiFinder_2.0.4.img:
	* Set username and password:
		* Username: pifinder
		* Password: <choose>
* Boot PiFinder, screen will have logo on for a few seconds, then disappear, then it will come back, wait for menu to appear.
* Connect to PiFinderAP with WiFi
* ssh pifinder@pifinder.local
* sudo raspi-config
	* Select 3 (Interace Options):
		4: SPI and choose Enable
		5: I2C and choose Enable
* On PiFinder Front Panel:
	* Settings / PiFinder Type: Left
	* Settings / Mount Type: Equatorial
	* Settings / Camera Type: v3 - imx296 cam
	* Settings Wifi Mode: Client
	* Settings Wifi Mode: Access Point
* ssh pifinder@pifinder.local
	* Change main.py in PiFinder/python/PiFinder to add PIN as per CodeChanges
* ssh pifinder@pifinder.local
	* Enable Overlay FS to avoid SD Card Corruption (see below)

**IMPORTANT: PiFinder MUST ALWAYS BE SHUTDOWN IF OVERLAY FS IS OFF TO PREVENT SD CARD CORRUPTION**

## Switch Overlay FS On (Write Protection)

* sudo raspi-config
* Performance Options / Overlay File System:
	* Would you like the overlay file system to be enabled?: Yes
	* The overlay file system is enabled: Ok
	* Would you like the boot partition to be write-protected?: Yes
	* The boot partition is read-only: Ok
	* Finish
	* Reboot

## Switch Overlay FS Off (Writable)

This is a 2 step process, step 1 to switch off the overlay file system and step 2 to switch off boot partition write protection.

* sudo raspi-config
* Step 1: Performance Options / Overlay File System:
	* Would you like the overlay file system to be enabled?: No
	* The overlay file system is disabled: Ok
	* The boot partition is currently read-only. This cannot be changed while an overlay file system is enabled. Ok
	* Finish
	* Reboot
* Step 2: Performance Options / Overlay File System:
	* Would you like the overlay file system to be enabled?: No
	* The overlay file system is disabled: Ok
	* Would you like the boot partition to be write-protected?: No
	* The boot partition is writeable: Ok
	* Finish
	* Reboot


## PiFinder Development

sudo systemctl restart pifinder