# CW Keyer for the Hermes-Lite and other SDR software

This project is a CW keyer for amateur radio. The hardware connects to a PC with USB. It then appears as an audio device for radio sound output and microphone input. It is also a Midi device to signal key up/down to the PC software, and a serial device for a connection to logging or other software on the PC. It is designed for the [Hermes-Lite 2.0](http://www.hermeslite.com/) or other SDR software. The radio sound is sent to the keyer and the keyer generates a sidetone, mixes it with the audio and sends it to the headphones or speaker. The sidetone has zero delay and is suitable for high speed CW. The keyer can also be used with a regular analog radio by using the key and PTT outputs. This project is currently a DIY project with instructions below for those who feel comfortable with some light soldering and Arduino programming.

## Hardware

The hardware consists of a carrier board as shown below and a [Teensy 4](https://www.pjrc.com/teensy/) microcontroller.
The Teensy can be purchased from [Teensy](https://www.pjrc.com/store/teensy40.html) or from [sparkfun](https://www.sparkfun.com/), [adafruit](https://www.adafruit.com/), [mouser](https://www.mouser.com/), [digikey](https://www.digikey.com/) or [amazon](https://www.amazon.com/). Make sure to order the Teensy 4.

![SofterHardwareCWKeyer](./pictures/softerhardware_cwkeyer.jpg)

## Software

Keyer software must be loaded into the Teensy 4 microcontroller. The Teensy 4 is programmed via a usb connection to a host computer. First, download and install the Teensy loader application for your operating system as described on [this page](https://www.pjrc.com/teensy/loader.html). Then start the teensy application. Press the programming button on the Teensy and the teensy app will change to show a picture of the board. Then select the ".hex" program file, select "program" and then "reboot".


There are currently two keyer programs available, the "hasak" and the "TeensyWinkeyEmulator". Click on the "firmware" link above, and click through the directories until you find the hex file you want. The file will appear as a table of numbers with a "Raw" button on the upper right side. Right click the Raw button and select "Save link as". Make sure the file name ends in ".hex". Save the hex file and use it to program the Teensy.


## Ctrlr

TBD: Basic description, download and use instructions for Ctrlr MIDI control panel.

## Software Development

To write your own keyer software or to contribute to software development first clone this repository.
This git repository uses several submodules to collect various projects into a single repository. You must initialize submodules when intially cloning:

git clone --recurse-submodules git@github.com:softerhardware/CWKeyer.git

After that, also be sure to pull updates from submodules:

git pull --recurse-submodules

You can find more details about how to work with git submodules on the internet.

### Teensy Libraries

Current development is done using [Arduino IDE 1.8.19](https://www.arduino.cc/en/software) and [Teensyduino 1.56](https://www.pjrc.com/teensy/td_download.html). Please make sure those are installed.

Updated libraries are required for glitchless 48kHz audio with the CW keyer hardware. These libraries are provided in this git repository. An easy way to use these libraries is to add symbolic links to the new libraries from the arduino IDE install. This is described below for Linux and MacOS systems.

Be sure to select the "Teensy 4.0" board in the Tools-->Boards-->Teensiduino menu, and to select the "Serial + Midi + Audio" USB model in the Tools-->USB type menu,
otherwise compilation will fail.

Install teensy  library update for linux:
-----------------------------------------

 1. cd arduino-1.8.19/hardware/teensy/avr
 2. rm -rf cores   (This must be removed or moved outside of the arduino-1.8.19 area otherwise arduino will still pickup this code)
 3. ln -s /home/shaynal/CWKeyer/libraries/teensy/cores .   (Substitute the path for your local git pull of the CWKeyer repository)
 4. cd libraries
 5. rm -rf Audio   (See step 2 comments)
 6. ln -s /home/shaynal/CWKeyer/libraries/teensy/Audio .   (See step 3 comments)
 7. ln -s /home/shaynal/CWKeyer/libraries/teensy/CWKeyerShield .   (See step 3 comments)

Install teensy library update for MacOS:
----------------------------------------

(Added by DL1YCF. Note this is for users with some Linux/UNIX experience)

The following procedure assumes that you can work with the "Terminal" app.

Step 1: Install IDE

Download the Arduino 2.x.x IDE. At the time of this writing, the current version is 2.3.8.
The Arduino IDE can be found at 

https://www.arduino.cc/en/software/

Be sure to use the 2.x.x version and not the "legacy IDE" with version 1.8.19

Step 2: Add Teensy support

Start the Arduino IDE and go to the "Preferences" menu. At the bottom is an input field
labeled as "Additional board manager URLs". Insert into the input field

https://www.pjrc.com/teensy/package_teensy_index.json

and this should then load the "Teensy (for Arduino 2.0.4 and later)"
board manager. Its version at the time of this writing
is 1.60.0.


Step 3:

Dowload modified USB and Audio code. The suggestion here
is to download these to $HOME/github/cores and $HOME/github/Audio.
Furthermore, download the software for the KeyerShield, and
put it to $HOME/github/CWKeyer. In the procedure laid out here,
you will have the "Keyer Shield" software ready-to-use
in $HOME/github/CWKeyer.

So type the following commands into a terminal window:

cd $HOME
mkdir github
cd github
git clone https://github.com/softerhardware/cores.git
git clone https://github.com/softerhardware/Audio.git
git clone --recurse-submodules git@github.com:softerhardware/CWKeyer.git
cd CWKeyer
git pull --recurse-submodules


Step 4: Let the IDE use the updated libraries

This is now the hardest part. You have to remove parts of the
original Teensy software and replace it by the modified one. Here I
suggest to make a backup of the original software and insert symbolic
links to the new ones. The Teensy software resides in

$HOME/Library/Arduino15/packages/teensy/hardware/avr/1.60.0

Commands to use new "cores" software

cd $HOME/Library/Arduino15/packages/teensy/hardware/avr/1.60.0
tar cfz cores.orig.tgz cores
rm -r cores
ln -s $HOME/github/cores cores

Commands to use new "Audio" library

cd $HOME/Library/Arduino15/packages/teensy/hardware/avr/1.60.0/libraries
tar cfz Audio.orig.tgz Audio
rm -r Audio
ln -s $HOME/github/Audio Audio

Commands to add new "CWKeyerShield" library

cd $HOME/Library/Arduino15/packages/teensy/hardware/avr/1.60.0/libraries
ln -s $HOME/github/CWKeyer/libraries/teensy/CWKeyerShield CWKeyerShield

Step 5: Now you can compile!

Now you can open a sketch containing software that uses the KeyerShield
and let it go. For example, the sketch of the DL1YCF "WinKey" emulator
should be in the directory $HOME/github/CWKeyer/firmware/TeensyWinkeyEmulator
with file name TeensyWinkeyEmulator.ino.

Now you can open the sketch by double-clickint it.
To compile, you first have to specify "Teensy 4.0" as the board type (via Tools-->Boards). Then,
the USB type must be "Serial + Midi + Audio" (via Tools-->USB Type).

Try to compile the sketch by clicking the "Compile" button (leftmost
in the top row of the IDE window, with the "check" sign).
If you see the following in the
bottom part (diagnostics window) of the IDE

Opening Teensy Loader...
Memory Usage on Teensy 4.0:
  FLASH: code:75320, data:8876, headers:8984   free for files:1938436
   RAM1: variables:13536, code:72776, padding:25528   free for local variables:412448
   RAM2: variables:22976  free for malloc/new:501312

then everything is OK. Klicking the "upload" button just to the right of
the "compile" button (the "upload" button as an arrow pointing to the right).
If everything goes well, the sketch is re-compiled and loaded into the Teensy.
