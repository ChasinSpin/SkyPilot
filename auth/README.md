# Dome Door Lock

Due to failure of the Simplex 5 digit pin lock, the dome door is currently a keyed lock temporarily, see Eric, Jack or Mark for the location of the key.

The lock can be opened from the inside, but not from the outside without a key, so there's a possibility that you can lock yourself out if you leave the key in the dome.

To avoid locking yourself out:

### Put the key in the lock and turn 90 degrees so it's vertical, and leave in the lock until you're ready to leave and lock up.  When it's vertical, the key can't accidentally drop out.

Replace lock where you got it from after you're finished using the dome.
	
# Auth System Notes

* RFID/LoRa or Wifi ESP32 board (with low power)
* [LoRa RFID door lock](https://www.google.com/search?q=LoRa+RFID+door+lock&client=safari&sca_esv=f4c7e32cb0632b69&rls=en&udm=2&biw=1730&bih=1162&ei=iUUyZ9fLNNHg0PEP37DVuA0&ved=0ahUKEwiXtMus7dSJAxVRMDQIHV9YFdcQ4dUDCBA&uact=5&oq=LoRa+RFID+door+lock&gs_lp=EgNpbWciE0xvUmEgUkZJRCBkb29yIGxvY2tIqkxQ3iFYq0twBHgAkAEAmAGOAaABmxKqAQQ4LjE0uAEDyAEA-AEBmAIQoAK5C8ICChAAGIAEGEMYigXCAgsQABiABBixAxiDAcICCBAAGIAEGLEDwgIOEAAYgAQYsQMYgwEYigXCAg0QABiABBixAxhDGIoFwgIQEAAYgAQYsQMYQxiDARiKBcICBRAAGIAEwgIHEAAYgAQYCsICChAAGIAEGLEDGArCAg0QABiABBixAxiDARgKwgIGEAAYCBgewgIEEAAYHpgDAIgGAZIHBDUuMTGgB_U2&sclient=img#vhid=KWlReoWdkcttRM&vssid=mosaic)
* [Retrofit of a good lock](https://www.youtube.com/watch?v=s3hV19naMkk)
* Maybe an Adafruit Feather ESP32 or SeedStudio module?
* [Access Control Software 1](https://github.com/leosac/access-control)
* [Access Control Software 2](https://github.com/esprfid/esp-rfid)
* [GitHub Access Control Search](https://github.com/search?q=rfid+access+control&type=repositories&p=1)

## Wish list for lock

* Key as backup
* Low battery indicator
* Cold Temps
* Not auto locking, i.e. open and stay open, maybe push button or tag again to lock
* RFID frequency compatible with other RFID keys