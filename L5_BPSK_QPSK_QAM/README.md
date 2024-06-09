# Lab 5 - BPSK, QPSK, and QAM

## Table of Contents
- [Laboratory Objective](#laboratory-objective)
- [Hardware Requirements](#hardware-requirements)
- [Software Requirements](#software-requirements)
- [Useful Resources](#useful-resources)
- [System Diagrams](#system-diagrams)
- [System Analysis](#system-analysis)
- [Results](#results)
- [Additional Experimentation](#additional-experimentation)
- [Conclusion](#conclusion)

## Laboratory Objective
The purpose of this laboratory experiment was to analyze, and compare three modulation/demodulation schemes: Binary Phase Shift Keying, Quadrature Phase Shift Keying, and Quadrature Amplitude Modulation. Each scheme has varying amounts of complexity with each being suited to different amplications. Using the EMONA Telecoms Trainer, students were able to link various modules together to modulate one or more message signals with a carrier, and demodulate and clean-up the output using filters, and comparators. Students also became familiar with the limitations of the hardware. 

## Hardware Requirements
- EMONA Telecoms Trainer 101

## Software Requirements
- Diligent Discovery 2
- Diligent Waveform Software

## Useful Resources
- EMONA Handbook

## System Schematics
The schematics for BPSK, QPSK, and QAM are depicted below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/System_Diagrams/BPSK_Diagram.png)


![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/System_Diagrams/QPSK_Diagram.png)


![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/System_Diagrams/QAM_Diagram.png)

## System Analysis

### Binary Phase Shift Keying
The first stage of BPSK involves generating the digital data via an 8 KHz clock, and a sequence generator. This is essentially the same process as FSK, but instead of frequency one uses phase reversals to encode information. The waveform below shows that phase reversal occur on the data stream's logic transitions. Examining the frequency spectrum below the time domain signals shows that the carrier is surpressed which confirms it is a DSBSC signal. This allows it to use its bandwidth more efficiently compared to other schemes.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/A1_BPSK_Rev.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/A2_Q2.png)

The second stage is also relatively simple as we just multiple by a stolen carrier, and then an LPF. Though, the same issues arises where the recovered signal is not a perfect or near perfect copy of the original. It is not a perfect copy because of timing jitter due to non-ideal synchronization between the signal and LPF. As a resutl we see the signal exceed and cross below the desired logic value before settling. Noise arising from sharp transitions are also a culprit.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/A3_Ripple_Out.png)

Once again we employ a comparator to clean up the signal by comparing it with a VDC value. If one varies the reference voltage, the shape of the output signal changes to meet the new value.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/A4_Comparator.png)

The introduction of noise using the noise modulle and BPF channel allows one to witness BPSK's noise resistanace to a point. Once the noise is larger than the original signal itself, we begin to see errors in logic transitions as seen below.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/A5_Noise_0dB.png)

______________________________________________________________________________________________________________________________________________________________________________

### Quadrature Phase Shift Keying
The QPSK scheme is essentially the same as BPSK, but we take in two digital messages instead of one. The intial 8 KHz clock is again fed into the sequence generator, however we employ a 2 bit serial to parallel converter to create a stream of even bits and a stream of odd bits. It may be obvious to think there is a speed advantage given that we are sending two bits at a time as opposed to one, however the advantage is halved/negated when converting back into pairs. The primary reason we use QPSK is it requires half the spectrum of BPSK. This allows for more efficient use of the bandwidth, and frees up room for additional users.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/B1_QPSK_Even_Odd.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/B2_Init_Output.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/B3_Close_X1.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/B4_Close_Y1.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/B5_Comp_X1.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/B6_Comp_X2.png)

______________________________________________________________________________________________________________________________________________________________________________

![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C1_QAM_QCH.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C2_QAM_ICH.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C3_IQ_Sum.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C4_Recov_Inc.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C5_M1_Recov.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C7_M1_NO_Full_RJ.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C6_M2_NO_Full_RJ.png)
## Results Discussion


## Additional Experimentation


## Conclusion



5
