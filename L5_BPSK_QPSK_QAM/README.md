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

_____________________________________________________________________________________________________________________________________________________________________________

### Quadrature Phase Shift Keying
The QPSK scheme is essentially the same as BPSK, but we take in two digital messages instead of one. The intial 8 KHz clock is again fed into the sequence generator, however we employ a 2 bit serial to parallel converter to create a stream of even bits and a stream of odd bits. It may be obvious to think there is a speed advantage given that we are sending two bits at a time as opposed to one, however the advantage is halved/negated when converting back into pairs. The primary reason we use QPSK is it requires half the spectrum of BPSK. This allows for more efficient use of the bandwidth, and frees up room for additional users. Given that we are still following the BPSK scheme, the signals are also DSBSC. 
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/B1_QPSK_Even_Odd.png)

If one observes the PSK signals coming out of the multipliers which are then fed into an adder one would see a signal sine wave. This of course is due to the adder, and multiplication of respective carrier waves. Demodulating the wave presents the first limitation of the hardware, one is only able to demodulate and observe one PSK signal at a time. Thus, the waveform below is the initial demodulation of Message 1. Naturally, recovered Message 1 is not an exact copy of the original following the filtering stage. 
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/B2_Init_Output.png)

Before using a comparator, we can use a phase shifter to achieve the closest possible results to the original signals. Granted, it is again not a perfect copy, but it has improved. Additionally, students used the phase shifter to observe the effect of the wrong carrier to demodulate which is a wave that is nothing like the original, though it was recoverable. This is likely due to improper phase synchronization as we are not employing a PLL. Additionally, using the phase shifter does not allow for too much precision which will lead to issues.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/B3_Close_X1.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/B4_Close_Y1.png)

Once again, we employ a comparator to clean up the signal given the undesirable qualities of the previous waveforms. When we first modulate the digital messages, we use a carrier with the same frequency, but 90 degrees apart meaning they are orthogonal. When we demodulate a single QPSK signal, multiplying by the shifted carrier for message 1 will cancel out Message 2, and using the shifted carrier for message 2 on the QPSK signal cancels out the contents of Message 1.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/B5_Comp_X1.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/B6_Comp_X2.png)

_____________________________________________________________________________________________________________________________________________________________________________

### Quadrature Amplitude Modulation

QAM bears similaries to QPSK, in that we take in two messages, and combine them using an adder. However, the messages are now analog rather than digital. We employ the same demodulation scheme for AM. In the first, the two analog messages of 1 KHz and 2 KHz are mutliplied by carriers of 100 KHz orthogonal to one another. Observing its frequency spectrum we once again see a suppresed carrier which indicates a DSBSC. We can also determine that there 3 significant frequency components per multiplier outputs, they are at the intial frequency of Message 1 or 2, the frequency of the carrier, and another at 2x the frequency of the carrier. Below we observe the time domain waveforms and frequency spectrum of I and Q.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C1_QAM_QCH.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C2_QAM_ICH.png)

We then add these signals together to obtain a QAM signal with the most siginificant frequency components present at the carrier frequency and 2x the carrier frequency.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C3_IQ_Sum.png)

Passing the QPSK signal into an RC LPF, produces a result that may appear to be one of the recovered messages, however looks nothing like either because we are attempting to recover both signals at once. One was able to verify this using headphones to show the audible frequency was neither 1 KHz or 2 KHz. 
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C4_Recov_Inc.png)

We can perform a more effective recovery of either message by using the carrier and shifting it appropriately using the phase shifter to remove message 1 or message 2's contents. Ideally, this would completely eliminate the contents. The recovered signal of Message 1 is shown below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C5_M1_Recov.png)

The hardware is not ideal, very few things are. Examing the frequency spectrum of either message reveals that both messages are not completely rejected when multiplying by the neccessary carrier. For case 1, we see that the message 2 is 28 dB smaller than message 2, and for case 2, message 1 is 27 dB smaller than message 2. Though the attenuation is significant, it is not perfect. This is likely due to the improver phase synchronization due to the precisions of the modules and instruments. For real receiver, this can result in a signal that looks correct, but has incorrect logic transitions, or corrupted data. There would be an increase in the error rate, noise enhancement, and a reduced signal-to-noise ratio.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C7_M1_NO_Full_RJ.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L5_BPSK_QPSK_QAM/Figures/C6_M2_NO_Full_RJ.png)

## Results Discussion
One similarity across all schemes is the use of DSBSC to improve the efficiency of the techniques. PSK and QPSK deal with digital data while QAM deals with analog data. QPSK and QAM share the use of the quadrature scheme to combine two messages together using two carriers orthogonal to one another and summing them together using an adder. QPSK and PSK are fundamentally the same. Functionally, QPSK encodes two signals while BPSK encodes one. One additionally benefit of QPSK and PSK is their abillity to be convered to FSK and QFSK given a small change in the demodulation scheme. 

In terms of performance, one would see more noise resistance for PSK and QPSK than QAM thus their uses apply differently. QAM would be more useful for lower fidelity systems where noise is not a big factor. PSK and QPSK are more robust against noise, this lends itself to space communication, cellular networks, and RF. Existing broadband infrastructure enlists QAM, and so does software defined radio and direct subscriber lines. This however isn't to say that cannot be used in conjunction with one another depending on the conditions present.

The use of orthogonal signals is not a hard requirement for quadrature systems. One could use carriers 60 degrees apart to modulate 3 messages. However, inter-symbol interference would be more present and the rejection of components would be more difficult. While possible, it would be more suitable to use OFDM with subcarrier to reduce potential cross talk.

## Additional Experimentation
In the future, it may be worthwhile to perform speed tests depending on the scheme and observe which scheme transmits the fastest and with the least errors. Though from this Lab we can see what characteristics are present, using a microcontroller to construct these systems at a low level can help quantify the time/complexity of each system. Departing from the use of the EMONA hardware, via FGPAs can bring these systems closer to reality, and possibly transmiting to an ESP when expecting a certain type of message can show the performance of each more directly.

## Conclusion
In this experiment, students observed the modulation and demodulation of different schemes to observe differences in time domain reconstruction, bandwidth, and complexity. Students were able to compare and constrast traits between schemes to consider some of the design choices and behavior communication engineers take into account. It additionally serves to influence future student projects, and what system may be the most effective for an application. With this strong foundation in more complex systems, we can move forward into charcterizing the quality and error rate of respective schemes.
