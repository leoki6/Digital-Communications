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

## System Schematic
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Schematic/am_receiver_schematic.png) 

## System Analysis
### Preliminary Variables, Options, and Ranges
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/variables_ranges_options.png) 

### Signal Source Generation and Filtering
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/source_filter_freq.png) 

### Demodulation and Throttling
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/demod_throttle.png) 

### Resampling, Waterfall Sink, and Audio Sink
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/resample_audio_waterfall.png) 


