# CW Keyer for the Hermes-Lite and other SDR software

This project is a CW keyer for amateur radio. The hardware connects to a PC with USB. It then appears as an audio device for radio sound output and microphone input. It is also a Midi device to signal key up/down to the PC software, and a serial device for a connection to logging or other software on the PC. It is designed for the [Hermes-Lite 2.0](http://www.hermeslite.com/) or other SDR software. The radio sound is sent to the keyer and the keyer generates a sidetone, mixes it with the audio and sends it to the headphones or speaker. The sidetone has zero delay and is suitable for high speed CW. The keyer can also be used with a regular analog radio by using the key and PTT outputs. This project is currently a DIY project with instructions below for those who feel comfortable with some light soldering and Arduino programming.

## Hardware

The hardware consists of a carrier board as shown below and a [Teensy 4](https://www.pjrc.com/teensy/) microcontroller.
The Teensy can be purchased from [Teensy](https://www.pjrc.com/store/teensy40.html) or from [sparkfun](https://www.sparkfun.com/), [adafruit](https://www.adafruit.com/), [mouser](https://www.mouser.com/), [digikey](https://www.digikey.com/) or [amazon](https://www.amazon.com/). Make sure to order the Teensy 4.

![SofterHardwareCWKeyer](./pictures/softerhardware_cwkeyer.jpg)

## Software

Keyer software must be loaded into the Teensy 4 microcontroller. The software is available in source code, and instruction how to set up
an IDE to compile and load the software into the Teensy is given below ("Install Arduino IDE...").
Since this requires some programming expertise, pre-compiled
so-called ,,hex files'' are provided. Still, these must be loaded into the Teensy:

The Teensy 4 is programmed via a usb connection to a host computer. First, download and install the Teensy loader application for your operating system as described on [this page](https://www.pjrc.com/teensy/loader.html). Then start the teensy application. Press the programming button on the Teensy and the teensy app will change to show a picture of the board. Then select the ".hex" program file, select "program" and then "reboot".


There are currently two keyer programs available, the "hasak" and the "TeensyWinkeyEmulator". Click on the "hexfiles" directory
(at the top of this page), there is another README file describing which versions are available and which one you need.


Install Arduino IDE and teensy  library update for Linux (64-bit x64-64) or MacOS
---------------------------------------------------------------------------------

The procedure for MacOS and Linux is actually so similar that we can present it
in a unified way, but at very few places we have to distinguish between MacOS
and Linux.


 **Step 1: Install IDE**
 
Download the Arduino 2.x.x IDE. At the time of this writing, the current version is 2.3.8.
The Arduino IDE can be found at 

https://www.arduino.cc/en/software/

Be sure to use the 2.x.x version and not the "legacy IDE" with version 1.8.19. 

**LINUX variant:**
Download
the "Linux AppImage" which you can place e.g. on the Desktop. Double-clicking this
icon opens the archive extractor and you have to decide where to put the software.
So select Action-->Extract and choose your home directory. This created a directory,
within your home directory, with name

arduino-ide_2.3.8_Linux64bit

Double-clicking the "arduino-ide" icon in that directory opens the IDE.

**MacOS variant:**
Download the app bundle relevant for your operating system and CPU type. You can double-click
the app bundle as usual to start the IDE.

**Step 2: Add Teensy support**

This procedure is described onm

https://www.pjrc.com/teensy/td_download.html

and we repeat this here for convenience.
Start the Arduino IDE and go to the "File-->Preferences" (LINUX) or "Arduino IDE-->Preferences" (MacOS)
menu. At the bottom is an input field
labeled as "Additional board manager URLs". Insert into the input field

```
https://www.pjrc.com/teensy/package_teensy_index.json
```

and click "OK". This should then add  Teensy support
to the board manager. Its version at the time of this writing
is 1.60.0. In the boards manager you should then find (scroll down far to the
bottom) "Teensy (for Arduino 2.0.4 and later)" and have to click "Install" there.

**Step 3:**

Dowload modified USB and Audio code. The suggestion here
is to create a directory "github" in your home directory
and to place the components there. We also download
the KeyerShield software and install it as described above,
since we must refer to it in the next step. Of yours, you
can place the software on your computer where you want, but
then you have to adapt the following steps.

So type the following commands into a terminal window:

```
cd $HOME
mkdir github
cd github
git clone https://github.com/softerhardware/cores.git
git clone https://github.com/softerhardware/Audio.git
git clone --recurse-submodules https://github.com/softerhardware/CWKeyer.git
cd CWKeyer
git pull --recurse-submodules
```

**Step 4: Let the IDE use the updated libraries**

This is now the hardest part. You have to remove parts of the
original Teensy software and replace it by the modified one. Here I
suggest to delete the old directories and insert symbolic
links to the new ones. The Teensy software (Version 1.60 at the time
of this writing) resides in

LINUX:  $HOME/.arduino15/packages/teensy/hardware/avr/1.60.0
MacOS:  $HOME/Library/Arduino15/packages/teensy/hardware/avr/1.60.0

This location will be referred to as <teensy> in the procedure below.


Commands to use new "cores" software

```
cd <teensy>
rm -r cores
ln -s $HOME/github/cores cores
```

Commands to use new "Audio" library

```
cd <teensy>/libraries
rm -r Audio
ln -s $HOME/github/Audio Audio
```

Commands to add new "CWKeyerShield" library

```
cd <teensy>/libraries
ln -s $HOME/github/CWKeyer/libraries/teensy/CWKeyerShield CWKeyerShield
```

Now you can compile (Applies both to Linux and MacOS)
-----------------------------------------------------

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

```
Opening Teensy Loader...
Memory Usage on Teensy 4.0:
  FLASH: code:75320, data:8876, headers:8984   free for files:1938436
   RAM1: variables:13536, code:72776, padding:25528   free for local variables:412448
   RAM2: variables:22976  free for malloc/new:501312
```

then everything is OK. Klicking the "upload" button just to the right of
the "compile" button (the "upload" button as an arrow pointing to the right).
If everything goes well, the sketch is re-compiled and loaded into the Teensy.
