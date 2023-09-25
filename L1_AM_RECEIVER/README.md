# Lab 1 - AM Receiver

## Table of Contents
- [Laboratory Objective](#laboratory-objective)
- [System Schematic](#system-schematic)
- [Hardware Requirements](#technology-description)
- [Software Requirements](#technology-description)
- [System Analysis](#system-analysis)

## Laboratory Objective
The purpose of this laboratory assignment was to introduce and build a simple amplitude modulated receiver capable of tuning into AM radio stations in Denver, CO. This was achieved using the GNU Radio Companion software and a NooElec RTL-SDR. Students reinforced concepts such as: Product modulation, resampling, decimation and filtering.

## Hardware Requirements
- NooElec NESDR Smart XTR SDR - Premium RTL-SDR
- Antenna Mast
- Antenna Base & Cable
  
## Software Requirements
- Windows, Ubuntu, or MacOS
- GNU Radio Companion

## Useful Resources
https://wiki.gnuradio.org

## System Schematic
The following schematic was designed, constructed, and tested: 

![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Schematic/am_receiver_schematic.png) 

## System Analysis
#### Preliminary Variables, Options, and Ranges
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/variables_ranges_options.png) 

The 'options' block in the image above allows one to set specific parameters such as a title and author to begin constructing the flow graph. Additionally, one can set the output language, windowing size, file id, and so on. It is important to note that there is only one options block allowed per blockgraph.

The 'variable' block allows one to assign a specific value to a specific id that can be reused in later blocks to save time. In this case, the id 'samp_rate' has been set to 400K. (still need to justify this)

The 'QT GUI RANGE' block is similar to a variable block, but with increased parameters such as a changeable label, start, stop, step size, and type. This block is primarily useful when simulating because it introduces a moveable slider that can be adjusted to observe real-time system behavior. In this case we have set:

- Center Frequency to a default value of 100 MHz with a range of 10 MHz to 560MHz and a step size of 100 KHz.
- RF Gain to a default value of 55 with a range of 10 to 70 and a step size of 5.

#### Signal Source Generation and Filtering
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/source_filter_freq.png) 
to-do
#### Demodulation and Throttling
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/demod_throttle.png) 
to-do
#### Resampling, Waterfall Sink, and Audio Sink
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/resample_audio_waterfall.png) 
to-do

