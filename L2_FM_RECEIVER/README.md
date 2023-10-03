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
The purpose of this laboratory experiment was to introduce and build a simple FM receiver capable of tuning into local FM sations in Denver, CO. It follows a very similar structure to the previous AM receiver, but has more complex underlying theory and principles particularly with analog FM techniques. Concepts emphasized include bessel functions, instantaneous frequency, and modulation index. This experiment utilized GNU Radio Companion software and a NooElec RTL-SDR to achieve the laboratory objective.

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

## System Analysis
The majority of system blocks used in this experiment have been previously described in detail, thus only new system blocks are thoroughly described. Please refer to the following experiment for in-depth explanations of reused system blocks:

https://github.com/leoki6/Digital-Communications/tree/main/L1_AM_RECEIVER

#### Preliminary Variables, Options, and Ranges
![image](https://github.com/leoki6/Digital-Communications/blob/main/L2_FM_RECEIVER/Additional_Figures/prelim_vars.png)

This system uses one variable to set up and reuse a sampling rate of 2 MHz and three ranges for volume, frequency, and gain that can be adjusted on the fly when running the system. The range for gain specifically adjusts the gain of the 'SDR-RTL' source. The range for volume adjusts a 'multiply const' block that can help fine tune the demodulated signal for better fidelity and listening. The range for frequency is what the user interacts with the most often to directly tune into FM stations such as 91.2 MHz.

#### Signal Source Generation, Initial Resampling, and Demodulation
![image](https://github.com/leoki6/Digital-Communications/blob/main/L2_FM_RECEIVER/Additional_Figures/generation_resample_demod.png)

#### Resampling, Frequency and Waterfall Visualization, and Audio Sink

#### Relevant Theory

## Results

## Additional Experimentation

## Conclusion

