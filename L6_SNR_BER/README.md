# Lab 6 - SNR and BER

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
The purpose of this experiment is to explore the benchmarks associated with quantifying the peformance of communication schemes. These take the of form signal-to-noise ratio and the bit error rate. For this, we ideally want an SNR as large as possible, and a BER as low as possible. Noise can introduce bit errors for digital signals which can have a range of severity depending on the application. Thus, calculating the SNR and BER is critical to mitigate the influence of noise.

## Hardware Requirements
- EMONA Telecoms Trainer 101
- ETT-101-22

## Software Requirements
- Diligent Discovery 2
- Diligent Waveform Software

## Useful Resources
- EMONA Handbook

## System Schematics

### SNR Diagram
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/System_Diagrams/SNR_Diagram.png)

### BER Diagram
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/System_Diagrams/BER_Diagram.png)

### Error Rate Diagram using ETT-101-22
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/System_Diagrams/Error_Rate_Diagram.png)

## System Analysis

### Signal-to-Noise Ratio

The first stage of the SNR schematic involves getting a feel for the noise levels being added to the signal. As depicted below using an adder to combine noise with the output of the sequence generator impacts the signal depending on the noise level. 20 dB of noise has a much smaller impact compared to 6 dB and 0 dB. 20 dB is a fraction of the signal while 0 dB is nearly the size of the signal itself thus one can observe more noise. The noise generated here additive white gaussian noise where its power is distributed evenly in its spectrum
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/A1_20db.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/A2_6dB.png)

Next, we connect the result of the adder to a baseband LPF channel to show how there isn't an unlimited bandwidth in real communications. We can see a reduction of the noise in the waveforms below because the baseband LPF performs filtering. It only accepts a certain range of frequencies given the nature of the channel
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/A2_BL_20dB.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/A3_BL_0dB.png)

We can begin to quantify the signal to noise ratio, by removing the noise and measuring the RMS voltage of the signal we can grab our first value to calculate the ratio. Following, we can then remove the signal itself and measure the RMS of the noise. We can then use: 20log(Vs/Vn) or alternatively SNR = (S + N)/N. The alternative form is useful for in the "field" as the level of noise is not pre-determined. The table below indicates calculated SNR.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/T1.png)

The ratio tells us the amount of the signal present to the noise. Thus, a high ratio indicates the signal is more dominant over the noise. The alternative calculation method yields a similar value because at 20 dB of noise, there isn't much of change to the numerator. Higher values of noise will result in differing values as shown in the table below for 0dB:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/T2.png)

We can now use eye diagrams to have a more visual representation of the effects of noise on a signal. As shown below, the openings of the eye diagram and clear and show clear transitions in logic. Again, 20 dB is only a fraction of the signal size thus the eye diagram is easy to read.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/A4_Eye_20dB.png)

Increasing the noise caueses the eye, and we see more timing jitter smearing the diagram
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/A5_Eye_6dB.png)

Bumping up to 0 dB we see complete occlusion of the eye making it impossible to decipher. One can also determine that the bit rate of the clock has an impact on the eye diagram as well. The higher the rate, the more closed the eye is, and there less and less time between logic transitions.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/A6_Eye_0dB.png)

Using the frequency adjust of the VCO we can validate the relationship between the rate of the CLK, and the eye diagram. Adjusting the VCO to a rate of about 3.5 KHz allows one to see about 5 eyes in the diagram. Pushing past this worsens the diagram.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/A7_Measurements.png)

### Bit Error Rate

Before moving forward into BER, it is first important to characterize the baseband LPF by increasing the frequency. The waveforms below are two examples of this:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/B1_BBLPF_Char.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/B2_BBLPF_Char.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/B3_BBLPF_Char.png)

We can collect the respective values into the table below to get a comprehensive view of the baseband LPF:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/T3.png)


![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/B4_Line_Code_Noise.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/B5_Line_Code_Repeat.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/B6_FFT_Line_Noise.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/B7_Measurements.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/B8_3dB.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/B9_Noise_Adder_Removed.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/C1_5K_Measurement.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/C1_5K_TD.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/C2_Measurements.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/C3_TD_Issue.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/C4_Init_Eye.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L6_SNR_BER/Figures/C5_Corrected_Eye.png)

## Results Discussion


## Additional Experimentation


## Conclusion


