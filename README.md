## Cloned repo
I cloned this form https://github.com/itcarsales/prusaPi and changed the config to work with SnapMaker 2.0 printers. 

## prusaPi
  OctoPrint full install script for Raspberry Pi 2/3/4 with camera and Snapmaker 2.0 3D printer

  This project is not meant to replace OctoPi, but to give Prusa Users a basic install with profiles already created, most settings already configured, and an easy out-of-box experience.  This project does not walk a user through flashing images, or setting up wifi.  It assumes the user can image an SD card, add the blank SSH file, add their own wpa_supplicant.conf, and connect to their fresh Raspbian install via SSH.  I will only touch on these steps, and place example files in the project.

## Configures
- OctoPrint (latest release build)
- Fail2Ban (extra security)
- HAProxy (clean URLs without port numbers)
- MJPEG-Streamer (sends images as video)
- Snapmaker 2.0 Profiles (generic defaults)

  
## Requirements:
- Snapmaker 2.0 3D Printer
- Raspberry Pi 3 or 4 with adequate Power Supply
- Raspberry Pi Camera Module with ribbon cable
- 16Gb SD Card or larger
- USB Cable 
- some case for the PI and the cam

# Warning
  - It is never a good practice to blindly run random scripts from the internet. So check the scripts out before running.

# Step 1)  SD Card Setup
  - Download the latest version of Raspberry Pi Imager https://www.raspberrypi.org/blog/raspberry-pi-imager-imaging-utility/
  - Select Raspian (other), Raspberry Pi OS Lite
  - When finished writing to the SD card, remove, wait, re-insert the card.
  - Create a blank file and name it SSH on the boot partition.
  - Add your wpa_supplicant.conf to the boot partition with your country code and wifi settings.  [Headless Setup](https://www.raspberrypi.org/documentation/configuration/wireless/headless.md)
 
# Step 2) Initial Pi Setup
 - From the original repro I removed the newpi.sh. I do not want to set you some default password, etc. however:
 - Change your password ```linux passwd ```
 - use raspi-config to change language, timezone, and set gpu_mem to 128 or higher.
 - do ```sudo apt-get update``` and ```sudo apt-get upgrade``` to get latest fixes
 - ```sudo reboot```
  
# Step 3) Linux Preperation
  - run the following command to download the update script from this repo
    - ```bash <(curl -Ls https://github.com/itcarsales/prusaPi/raw/master/packageInstaller.sh)```
    - This will update and install the required Raspbian Buster dependencies for this project (current as of 2-2020)
    - depending on your model Pi, this could take some time.
    - WARNING - this will download about 800Mb of data updates.  An unstable connection may result in a bad time.

# Step 4) Software Installation
  - run the following command to download the setup script from this repo
    - ```bash <(curl -Ls https://github.com/itcarsales/prusaPi/raw/master/prusaPi.sh)```
  - Your Pi should complete the script and reboot automatically
  
 # Step 5) Connect Printer and Test
  - Give your Pi a minute or so to reboot
  - Connect your USB cable to your Snapmaker
  - Power-On your Snapmaker
  - Open a browser and visit the following URL:
    - ```http://PI.IP.ADDRESS.HERE```
    - You should see the First-Run Setup screen for OctoPrint
    
 # Step 6) Setup OctoPrint and Enjoy!
  - I'm not going to try to reinvent a setup guide, as this project was designed to simply allow Raspberry Pi users a way to use current OS releases with current OctoPrint releases......and include Snapmaker Printer Profiles.
  