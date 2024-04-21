# Lab 3 - FSK Transceiver and Receiver GNU Radio

## Table of Contents
- [Laboratory Objective](#laboratory-objective)
- [System Schematic](#system-schematic)
- [Software Requirements](#software-requirements)
- [System Analysis](#system-analysis)
- [Results](#results)
- [Additional Experimentation](#additional-experimentation)
- [Conclusion](#conclusion)

## Laboratory Objective
In this experiment, students implemented a transceiver and receiver capable of handling frequency shift keying modulation. This involved obtaining the time and frequency plots at various stages of the system and employing signal processing techniques to clean up the signal. Students used GNU Radio Companion and its various modules to effectively modulate and demodulate a digital message.

## Software Requirements
- Windows, Linux, or MacOS
  
## Useful Resources
- https://wiki.gnuradio.org
  
## System Schematic
The entire system is pictured below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Sys_Diag.png)

## System Analysis
The majority of system blocks used in this experiment have been previously described in detail, thus only critical sub-processes and new modules. Please refer to the following repository for in-depth explanations of reused system blocks:

https://github.com/leoki6/Digital-Communications

### Message Generation & Modulation
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Message_Gen_Modulation.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Dig_Message.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/IQ_Signals.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Waterfall_Mod.png)

### Demodulation & Filtering
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Demodulation_Filtering.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Demod_Output.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Demod_Filtered.png)

### Conversion & Display
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Conversion_Display.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/R_Output.png)


## Results Discussion

## Additional Experimentation

## Conclusion

