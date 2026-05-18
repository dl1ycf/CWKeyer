# Pre-compiled hex files

Unfortunately, there is no "one file suits all" here.
Hex file names are of form XXXXX-YYYYY-ZZZZZ.hex, where XXXXX, YYYYY, and
ZZZZZ encode the variant. The options are listed here.

## XXXXX: HASAK vs. TeensyWinkeyEmulator

This choice determines which "sketch" you actually want to run. The HASAK software
(by Roger E Critchlow Jr.) is a CW keyer software that, when run on the
KeyerShield, can be configured via MIDI commands. Further information 
can be found on

https://github.com/recri/hasak-ino

The TeensyWinkeyEmulator emulates a WinKey keyer that can be controlled by
a serial interface. So when using this software, the KeyerShield acts
simultaneously as a USB sound card, a USB-to-serial adapter, and a
MIDI device. More information on the WinKey emulator can be found on

https://github.com/dl1ycf/TeensyWinkeyEmulator/

Hex files start with HASAK or WINKEY to denote which software is in the
hex file, so XXXXX is either "HASAK" or "WINKEY".

## YYYYY: Windows vs. Apple USB audio

At least for some previous versions of Windows, the USB sound driver had a non-standard
behaviour in the data format for the so-called "explicit feedback". With this
mechanism, a sound card (here: the Teensy) can slightly increase or decrease the
rate at which the host computer sends data, to prevent over- or under-runs of
audio data which result in audible clicks or drop-outs. Modifying the Teensy USB
audio software such that it works best with windows yields a device that
seemingly also works with LINUX computers and Apple Macintosh computer with an
Intel chip, but unfortunately this then does not run with Apple Macintosh computers
with an AppleSilicon chip.

Hex files names have YYYYY="WINDOWS" or YYYYY="APPLE". The "WINDOWS" version is
best if the Teensy is connected to a computer running that operating system,
in all other cases "APPLE" should be used (although "WINDOWS" may work in many cases).

## ZZZZZ: Microphone options for the TeensyWinkeyEmulator


