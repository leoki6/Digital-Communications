# Lab 2 - FM Receiver

## Table of Contents
- [Laboratory Objective](#laboratory-objective)
- [System Schematic](#system-schematic)
- [Hardware Requirements](#technology-description)
- [Software Requirements](#technology-description)
- [System Analysis](#system-analysis)
- [Results](#results)
- [Additional Experimentation](#additional-experimentation)
- [Conclusion](#conclusion)

## Laboratory Objective
The purpose of this laboratory experiment was to introduce and build a simple FM receiver capable of tuning into local FM sations in Denver, CO. It follows a very similar structure to the previous AM receiver, but has more complex underlying theory and principles particularly with analog FM techniques. Concepts emphasized include instantaneous frequency, modulation index, and mathematical representations. This experiment utilized GNU Radio Companion software and a NooElec RTL-SDR to achieve the laboratory objective.

## Hardware Requirements
- NooElec NESDR Smart XTR SDR - Premium RTL-SDR
- Antenna Mast
- Antenna Base & Cable

## Software Requirements
- Windows, Ubuntu, or MacOS
- GNU Radio Companion

## Useful Resources
- https://wiki.gnuradio.org
- https://complextoreal.com/tutorials/tutorial-17-frequency-modulation-fm-fsk-msk-and-more/

## System Schematic
The FM receiver was designed and tested according to the follow system diagram:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L2_FM_RECEIVER/General_System_Diagram/system_block_diagram.png)

## System Analysis
The majority of system blocks used in this experiment have been previously described in detail, thus only new system blocks are thoroughly described. Please refer to the following experiment for in-depth explanations of reused system blocks:

https://github.com/leoki6/Digital-Communications/tree/main/L1_AM_RECEIVER

#### Preliminary Variables, Options, and Ranges
![image](https://github.com/leoki6/Digital-Communications/blob/main/L2_FM_RECEIVER/Additional_Figures/prelim_vars.png)

This system uses one variable to set up and reuse a sampling rate of 2 MHz and three ranges for volume, frequency, and gain that can be adjusted on the fly when running the system. The range for gain specifically adjusts the gain of the 'SDR-RTL' source. The range for volume adjusts a 'multiply const' block that can help fine tune the demodulated signal for better fidelity and listening. The range for frequency is what the user interacts with the most often to directly tune into FM stations such as 91.2 MHz.

#### Signal Source Generation, Initial Resampling, and Demodulation
![image](https://github.com/leoki6/Digital-Communications/blob/main/L2_FM_RECEIVER/Additional_Figures/generation_resample_demod.png)

The message signal is generated using the frequency range slider created previously, and a sampling rate of 2 MHz. This passes through a low pass filter within the 'SDR-RTL' and is resampled to meet the channel rate of the 'FM Demod' block (400k).

The 'FM Demod' block takes a band-limited, complex down-converted FM channel and turns it into the message signal according to existing GNU Radio documentation. Low pass filtering is performed at the end of this conversion. There is an additional option to incorporate 'deemphasis'. 

Sample Rate = 2M / 5 = 400K

This is the current sample rate at this point in the system. Keeping track of this value is critical.

#### Resampling, Frequency and Waterfall Visualization, and Audio Sink
![image](https://github.com/leoki6/Digital-Communications/blob/main/L2_FM_RECEIVER/Additional_Figures/resamp_audio_plots.png)



Sample Rate = 400K*32 = 12800000/400 = 32 KHz

#### Relevant Theory
The general definition of frequency modulation can be thought of as varying the instantaneous frequency of the carrier signal in relation to the instantanous value of the modulating signal. We can rely on the following equation:

![image](https://github.com/leoki6/Digital-Communications/blob/main/L2_FM_RECEIVER/Additional_Figures/mod_eqn_v2.png)

Where s(t) is the frequency modulated signal, f_c is the carrier frequency, k_f is the modulation index, and m(t) is the desired message signal. A key idea in the derivation of this equation is instantaneous frequency. It allows one to relate phase and frequency according to the equation below:

![image](https://github.com/leoki6/Digital-Communications/blob/main/L2_FM_RECEIVER/Additional_Figures/phase_freq_relation.png)

This relation is critical because integrating a PM signal will produce an FM signal and taking the derivative of an FM signal will produce a PM signal. Even with a simple message such as a cosine wave it enlists the use of special trignometric identities to produce Bessel equations. Typically, only first-kind Bessel equations are of interest and they help identify where the ampltitude of some sidebands are zero. Additionally, Bessel functions in conjunction with the modulation index help describe the spread of the sidebands and how energy may be distributed across it. There are a large variety of complexities assocaited with FM theory and it is best to consult a dedicated resource.

## Results
After successfully demodulating the baseband signal, the waterfall and FFT plots were obtained and are shown below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L2_FM_RECEIVER/Additional_Figures/demod_waterfall_fft.png)

## Results Discussion
TODO: describe previous plots

## Additional Experimentation
Besides tuning into radio stations, it is feasible to tune into a wealth of frequencies involving walkie talkies such as the Cobra ACXT145 pictured below:

![image](https://github.com/leoki6/Digital-Communications/blob/main/L2_FM_RECEIVER/Additional_Figures/cobra_radio.png)

These radios operate according to the Family Radio Service which are channelized frequencies operating between 462 and 467 MHz. This specific model supports 22 channels. Channels 17 to 22 use 2 W instead of 500 mW, thus one can use the waterfall plot to observe this increase in power. One can also observe the call alert of the walkie talkie on the waterfall plot and even listen in on the conversation after some tinkering in GNU Radio Companion. A critical observation is when both walkie talkies are trying to transmit at the same time they interfere with one another and nothing is communicated. This highlights the lack of access control for the hardware for example Ethernet and CSMA/CD.

A center frequency of 462.5625 MHz was used for this additional experimentation.

## Conclusion
TODO:

