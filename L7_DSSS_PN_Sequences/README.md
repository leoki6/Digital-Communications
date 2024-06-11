# Lab 7 - DSSS and PN Sequences

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
This laboratory involves a variation of the DSBSC modulation scheme called Direct Sequence Spread Spectrum. This scheme involves the using a pulse trainer rather than a sine wave as the carrier, which in essentially made up of bunch of small sinusoids that produce the pulse train. This pulse train is a psuedo-noise sequence. The benefit of this signal is its resistance to jamming since the message contents are spread across so many of these pulses that deliberately trying to jam them is difficult. To be able to capture message information one would need the specific PN sequence and as the sequence get the longer the change of brute forcing it is slow. Thus, in this lab students investigate the DSSS scheme and its use of PN sequences to prevent jamming and encode information using a pulse train instead of a typical sine wave.

## Hardware Requirements
- EMONA Telecoms Trainer 101

## Software Requirements
- Diligent Discovery 2
- Diligent Waveform Software

## Useful Resources
- EMONA Handbook

## System Schematics

### Direct Sequence Spread Spectrum Diagram
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/System_Diagrams/DSSS_Diagram.png)

### Psuedo-Noise Sequences Diagram
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/System_Diagrams/DSSS_Diagram.png)

## System Analysis

### DSSS

The first stage of DSSS involves multiplying a 2 KHz message with the output of the sequence generator using a 100 KHz CLK. The output of the sequence generator represents the PN Sequence, and the output of the multiplier is the DSSS Signal. We'll see here the signal is large and clear, when we expect it to be indistinguishable from noise. This is likely due to the bandwidth limitations of the multiplier which is around 600 KHz and the k factor which is in respect to the output thus increasing the size of the signal
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A1_DSSS_Sig.png)

Alternatively, we can feed a speech signal in addition to the line code, to observe real time speech modulation. We'll notice here that there is no signal when there is no speech occurring. This is likely due to the nature of PN sequences where if there is very little signal, the result of the mulitiplication will be minimal. There may also be an activation thershold that is not meant.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A2_Speech_Mod.png)

We can an get more of an active modulation by speaking as shown below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A3_Modulation.png)

To demodulate the signal we build a typical product detector which involves multiplying by the stolen PN sequence, and passing it through a filter. More interestingly, we can introduce a VCO to begin to jam the signal. By tuning the frequency and gain knobs of the adder where the DSSS signal and VCO interact we observe impacts to the signal, but we'll notice that these adjusts don't seem to impact the demodulated output much.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A4_F_Adjust.png)

Again, we don't see much of an impact even increasing the gain of the VCO. This is due to the PN sequence spreading the signal over a wide-frequency band. Thus, targetting only a specific frequency even with an increase in gain is not effective.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A4_G_F_Adjust.png)

We can perform a more robust form of jamming by sweeping the DSSS signal with a range of frequencies. Even the distortion as a result is still minimal.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A5_VCO_Sweep.png)

We can go even further by introducing noise to achieve a broadband form of jamming using varying noise sizes. Again, we'll notice that even peforming this even larger sweep using growing noises sizes the output is still minimally affected. The strength of DSSS is shown very clearly in the figures below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A6_20dB.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A7_6dB.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A8_0dB.png)

### PN Sequences
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/B1_SYNC_X.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/B2_Freq_Nulls.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/B3_Psuedo_Noise.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/B4_X_Lobes.png)


## Results Discussion


## Additional Experimentation


## Conclusion


