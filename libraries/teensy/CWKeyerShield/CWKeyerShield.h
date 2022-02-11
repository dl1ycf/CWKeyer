/* SofterHardwareCWKeyerShield for Teensy 4.X
 * Copyright (c) 2021, kf7o, Steve Haynal, steve@softerhardware.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice, development funding notice, and this permission
 * notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#ifndef CWKeyerShield_h_
#define CWKeyerShield_h_

#include "Arduino.h"
#include "Audio.h"
#include "AudioStream.h"
#include "arm_math.h"
#include "TeensyAudioTone.h"

//
// External functions, to be implemented in the keyer
// (at least as dummies)
//
void speed_set(int speed);          // set CW speed in keyer
void keyer_autoptt_set(int enable); // enable/disable PTT activation by keyer
void keyer_leadin_set(int leadin);  // set keyer PTT lead-in time (leadin milli-seconds) (if using auto-PTT)
void keyer_hang_set(int hang);      // set keyer PTT hang time (in *dotlengths*) (if using auto-PTT)

//
// avoid certain "continuous controllers"
//
// No.  0, 32           (Bank select)
// No.  6, 38, 98--101  (Registered and non-Registered Parameters)
// No. 88               (High-resolution velocity prefix)
// No. 96, 97           (Increment/Decrement)
// No. 120-127          (Channel mode messages)
// 
// Note that MIDI_KEYDOWN_NOTE and MIDI_PTT_NOTE can be processed as "controllers"
// in the input section, but will be used as "notes" when emitted.
//
enum midi_control_selection {
  MIDI_SET_A                    = 1,     // Set 7-bit accumulator A
  MIDI_SET_B                    = 2,     // Set 7-bit accumulator B
  MIDI_SET_C                    = 3,     // Set 7-bit accumulator C

  MIDI_MASTER_VOLUME            = 4,     // set master volume
  MIDI_SIDETONE_VOLUME          = 5,     // set sidetone volume
  MIDI_CW_SPEED                 = 7,     // set CW speed
  MIDI_SIDETONE_FREQUENCY       = 8,     // set sidetone frequency
  MIDI_ENABLE_POTS              = 9,     // enable/disable potentiometers
  MIDI_KEYER_AUTOPTT            = 10,     // enable/disable auto-PTT from CW keyer
  MIDI_KEYER_LEADIN             = 11,    // set Keyer lead-in time (if auto-PTT active)
  MIDI_KEYER_HANG               = 12,    // set Keyer hang time (if auto-PTT active)
  MIDI_RESPONSE                 = 13,    // enable/disable reporting back to MIDI controller
  MIDI_MUTE_CWPTT               = 14,    // enable/disable muting of RX audio during auto-PTT
  MIDI_MICPTT_HWPTT             = 15,    // enable/disable that MICIN triggers the hardware PTT output
  MIDI_CWPTT_HWPTT              = 16,    // enable/disable that CWPTT triggers the hardware PTT output
  MIDI_KEYDOWN_NOTE             = 17,    // MIDI note for key-down
  MIDI_PTT_NOTE                 = 18,    // MIDI note for PTT activation
  MIDI_SET_CHANNEL              = 19,    // set MIDI channel to/from controller

  MIDI_WM8960_ENABLE            = 20,
  MIDI_WM8960_INPUT_LEVEL       = 21,
  MIDI_WM8960_INPUT_SELECT      = 22,
  MIDI_WM8960_VOLUME            = 23,
  MIDI_WM8960_HEADPHONE_VOLUME  = 24,
  MIDI_WM8960_HEADPHONE_POWER   = 25,
  MIDI_WM8960_SPEAKER_VOLUME    = 26,
  MIDI_WM8960_SPEAKER_POWER     = 27,
  MIDI_WM8960_DISABLE_ADCHPF    = 28,
  MIDI_WM8960_ENABLE_MICBIAS    = 29,
  MIDI_WM8960_ENABLE_ALC        = 30,
  MIDI_WM8960_MIC_POWER         = 31,
  MIDI_WM8960_LINEIN_POWER      = 33,
  MIDI_WM8960_RAW_WRITE         = 34
};

//
// The hardware setup (digital and analog I/O lines, which audio system to use)
// is passed as a parameter to the constructor.
// All other parameters can in principle be changed any time (either through
// an interface, through turning a pot, or through an incoming MIDI message)
//
class CWKeyerShield
{
public:
    CWKeyerShield (int i2s,
                   int pin_sidevol,
                   int pin_sidefreq,
                   int pin_mastervol,
                   int pin_speed,
                   int pin_ptt_in,
                   int pin_ptt_out,
                   int pin_cw_out) :
    sine(),
    usbaudioinput(),
    teensyaudiotone(),
    patchinl (usbaudioinput,   0, teensyaudiotone, 0),
    patchinr (usbaudioinput,   1, teensyaudiotone, 1),
    patchwav (sine,            0, teensyaudiotone, 2)
    {
      Pin_SideToneFrequency = pin_sidefreq;
      Pin_SideToneVolume    = pin_sidevol;
      Pin_MasterVolume      = pin_mastervol;
      Pin_Speed             = pin_speed;

      Pin_PTTin             = pin_ptt_in;
      Pin_PTTout            = pin_ptt_out;
      Pin_CWout             = pin_cw_out;

      //
      // Audio output. The audio output method is encoded in the i2s variable:
      //
      // i2s = 0:   MQS audio output, no master volume control
      // i2s = 1:   I2S audio output, assuming a WM8960   device
      // i2s = 2:       I2S audio output, assuming a SGTL5100 device
      //
      // use MQS as the default if an illegal value has been given
      //
      switch (i2s) {
        case 0:
        default:
            audioout = new AudioOutputMQS;
            break;
        case 1:
            audioout = new AudioOutputI2S;
            audioin  = new AudioInputI2S;
            wm8960   = new AudioControlWM8960;
            break;
        case 2:
            audioout = new AudioOutputI2S;
            audioin  = new AudioInputI2S;
            sgtl5000 = new AudioControlSGTL5000;
            break;
      }
      //
      // Connect teensyaudiotone to audio output
      //
      patchoutl = new AudioConnection(teensyaudiotone, 0, *audioout,        0);
      patchoutr = new AudioConnection(teensyaudiotone, 1, *audioout,        1);
      if (audioin) {
        //
        // Connect I2S audio input to USB audio out
        //
        patchusboutl = new AudioConnection(*audioin, 0, usbaudiooutput, 0);
        patchusboutr = new AudioConnection(*audioin, 1, usbaudiooutput, 1);
      }
    }

    void setup(void);                                           // to be executed once upon startup
    void loop(void);                                            // to be executed at each heart beat
    void key(int state);                                        // CW Key up/down event
    void cwptt(int state);                                      // PTT open/close event triggered by keyer
    void hwptt(int state);                                      // set hardware PTT
    void midiptt(int state);                                    // send MIDI PTT event
    void mastervolume(uint8_t level);                           // set master volume
    void sidetonevolume(uint8_t level);                         // Change side tone volume
    void sidetonefrequency(uint8_t freq);                       // Change side tone frequency
    void cwspeed(uint8_t speed);                                // send CW speed event
    void sidetoneenable(int onoff) {                            // enable/disable side tone
       teensyaudiotone.sidetoneenable(onoff);
    }

    void set_cwptt_mute_option(int v)    { mute_on_cwptt = v; }
    void set_midi_channel(int v)         { midi_channel  = v; }


private:
    void monitor_ptt(void);                                     // monitor PTT-in line, do PTT
    void midi(void);                                            // MIDI loop
    void pots(void);                                            // Potentiometer loop
    void adjust(void);                                          // slowly adjust SideTone/Master volume

    AudioSynthWaveformSine  sine;               // free-running side tone oscillator
    AudioInputUSB           usbaudioinput;      // Audio in from Computer
    AudioOutputUSB          usbaudiooutput;     // Audio out to Computer
    TeensyAudioTone         teensyaudiotone;    // Side tone mixer
    AudioConnection         patchinl;           // Cable "L" from Audio-in to side tone mixer
    AudioConnection         patchinr;           // Cable "R" from Audio-in to side tone mixer
    AudioConnection         patchwav;           // Mono-Cable from Side tone oscillator to side tone mixer
    AudioConnection         *patchusboutl=NULL;
    AudioConnection         *patchusboutr=NULL;
    //
    // These are dynamically created, since they depend on the actual
    // audio output device
    //
    AudioStream             *audioout=NULL;     // Audio output to headphone
    AudioStream             *audioin=NULL;      // Audio output to computer
    AudioControlSGTL5000    *sgtl5000=NULL;     // SGTL5000 output controller
    AudioControlWM8960      *wm8960=NULL;       // WM8960 output controller
    AudioConnection         *patchoutl=NULL;    // Cable "L" from side tone mixer to headphone
    AudioConnection         *patchoutr=NULL;    // Cable "R" from side tone mixer to headphone

    //
    // MIDI channel to use for communication with the controller
    // *and* with the radio
    // ATTN: the 16 midi channels are numbered 1-16 (not 0-15!),
    //   since this was designed for musicians not computer scientists.
    //   So a channel value of 0 means "no communication"
    //
    uint8_t midi_channel = 10;

    // Enable/disable  that MICPTT/CWPTT triggers the hardware PTT output.
    // (both will trigger a MIDI message in either case)
    uint8_t micptt_hwptt      = 1;
    uint8_t cwptt_hwptt       = 1;

    // PTT state from keyer. This flag is set if the keyer wants to
    // activate PTT. The actual PTT switching is done in monitor_ptt()
    uint8_t cwptt_state = 0;

    // PTT state of the MIDI and hardware PTT "lines"
    uint8_t hwptt_state=0;
    uint8_t midiptt_state=0;

    // Enable/disable MIDI responses to controller
    // NOTE: "key-down", "PTT", "side tone freq" and "CW speed"
    //       messages are sent independently of this value.
    uint8_t midi_controller_response     = 0;

    // Enable/disable POTS
    uint8_t enable_pots       = 1;

    //
    // (Digital) inputs to monitor / (Digital) output lines
    // A negative value indicates 'do not use'
    // Default values refer to the SofterHardware shield
    //
    int Pin_PTTin              = -1;
    int Pin_PTTout             = -1;
    int Pin_CWout              = -1;

    //
    // (Analog) inputs to monitor. A negative value indicates "do not use this feature"
    //
    int Pin_SideToneFrequency = -1;
    int Pin_SideToneVolume    = -1;
    int Pin_MasterVolume      = -1;
    int Pin_Speed             = -1;

    //
    // current states of the analog input lines,
    // kept for de-noising.
    //
    uint16_t Analog_SideFreq  = 0;
    uint16_t Analog_SideVol   = 0;
    uint16_t Analog_MasterVol = 0;
    uint16_t Analog_Speed     = 0;

    uint16_t last_sidefreq         = 0;
    uint16_t last_sidevol          = 0;
    uint16_t last_mastervol        = 0;
    uint16_t last_speed            = 0;

    int mute_on_cwptt  = 0;                 // If set, Audio from PC is muted while CWPTT is active

    unsigned long last_analog_read = 0;     // time of last analog read
    unsigned int  last_analog_line=0;       // which line was read last time

    unsigned long last_ptt_read = 0;        // time of last PTT-in reading
    uint8_t       last_ptt_in = 0;          // state of PTT-in line
    uint8_t       ptt_state = 0;            // PTT state


    // Accumulators for MIDI commands with multiple data
    int8_t accum_a = 0;
    int8_t accum_b = 0;
    int8_t accum_c = 0;

    //
    // Variables for the "continuous" adjustment of side tone and master volume.
    // This is meant to reduce audible "cracks" when changing the volume
    //
    float sidetonelevel_target;
    float sidetonelevel_actual;
    float masterlevel_target;
    float masterlevel_actual;
    unsigned long last_adjust=0;

    //
    // Side tone level (amplitude), in 32 steps from zero to one, covering 40 dB
    // alltogether.  Set first entry (nominally: -40 dB, amplitude 0.0100) to zero
    // to allow for "complete muting"
    //
    float VolTab[32] = {0.0000, 0.0116, 0.0135, 0.0156, 0.0181, 0.0210, 0.0244, 0.0283,
                        0.0328, 0.0381, 0.0442, 0.0512, 0.0595, 0.0690, 0.0800, 0.0928,
                        0.1077, 0.1250, 0.1450, 0.1682, 0.1951, 0.2264, 0.2626, 0.3047,
                        0.3535, 0.4101, 0.4758, 0.5520, 0.6404, 0.7430, 0.8620, 1.0000};

    //
    // CW speed table (wpm), in 32 steps from 5 to 52 wpm.
    // differences between adjacent steps increase at the
    // top of the scale. With the pot in center position we
    // have about 20 wpm.
    //
    uint8_t SpeedTab[32] = {  5,  6,  7,  8,  9, 10, 11, 12,
                             13, 14, 15, 16, 17, 18, 19, 20,
                             21, 22, 23, 24, 26, 28, 30, 32,
                             34, 36, 38, 40, 43, 46, 49, 52};

};

#endif
