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
The entire system is depicted below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Sys_Diag.png)

## System Analysis
The majority of system blocks used in this experiment have been previously described in detail, thus only critical sub-processes and new modules. Please refer to the following repository for in-depth explanations of reused system blocks:

https://github.com/leoki6/Digital-Communications

### Message Generation & Modulation

![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Message_Gen_Modulation.png)

The first step in creating the FSK transmitter is generating a digital message using the vector source block and an interpolation block. This repeats the signal sufficiently for modulation and consists of two levels (-1 or 1). Following this, the generated signal enters a frequency modulation block where its components are changed into I and Q signals according to the sampling rate, deviation, and threshold. 

This IQ signal is then multiplied with a higher frequency carrier for transmission across some medium. A source block generates a 2 MHz cosine wave with a sampling rate of 8 MHz which is then passed into a sampling rate limiter to ensure the rate remains consistent and is then passed into the multiplication block. The resulting time domain waveform from this step is difficult to read thus the waterfall plot of this wave is emphasized. The signal is then passed into a virtual sink acting as a placeholder for the medium.

The digital message generated can be seen below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Dig_Message.png)

The IQ signals generated from the frequency mod block are seen below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/IQ_Signals.png)

The waterfall plot of the modulated signal with the carrier is shown below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Waterfall_Mod.png)

### Demodulation & Filtering
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Demodulation_Filtering.png)
Following the generation and transmission, the receiver now needs to process, clean-up, and display the signal. This first involves passing the modulated signal into a low pass filter to effectively remove the high frequency carrier components with a center frequency of 2 MHz and a sampling rate in line with previous blocks. Alternatively, it can be understood that this filter works as a channelizer that grabs a narrow baseband signal from a much larger stream.

This signal is then passed into a quadrature demodulation block. This block takes the product of the one sample delayed-conjugated input and an underdelayed signal and then caluclates the resulting angle in radians thus outputing a complex number. It then effectively extracts the symbols by comparing the upper and lower frequencies using the fsk deviation assigning 1s and 0s accordingly.

The filtered signal and demodulated signal is then passed to a virtual sink for further processing as the signal is not meeting desired characteristics.

The demodulated output is shown below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Demod_Output.png)

Waterfall plot of the demodulated and filtered signal:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Demod_Filtered.png)

### Clean-Up & Display
The last step involves cleaning up the signal further using 
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/Conversion_Display.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L3_FSK_RECEIVER_TRANSMITTER/Figures/R_Output.png)


## Results Discussion

## Additional Experimentation

## Conclusion

