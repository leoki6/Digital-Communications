# Lab 4 - FSK & ASK Comparison and Analysis

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
In this experiment, students used the EMONA Telecoms Trainer 101 and lab equipment to generate, detect, and restore digital messages using ASK and FSK schemes. This involved linking several modules with the hardware to modulate the message with a carrier and employing signal processing techniques like low pass filters and comparators to clean up the signal. With the available results, a comparison will be made between FSK and ASK in addition to recalling AM and FM from previous experiments.

## Hardware Requirements
- EMONA Telecoms Trainer 101

## Software Requirements
- Diligent Discovery 2
- Diligent Waveform Software

## Useful Resources
- EMONA Handbook

## System Schematics
The schematics for ASK and FSK are depicted below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L4_FSK_ASK/System_Diagrams/ASK_Schematic.png)


![image](https://github.com/leoki6/Digital-Communications/blob/main/L4_FSK_ASK/System_Diagrams/FSK_Schematic.png)


## System Analysis
The first stage in ASK involves modulating a carrier with a digital message generated from a sequence generator. Initially, the lab has the student use a 2 KHz carrier with a dual analog switch to produce a 'psuedo-ASK' signal. The primary issue with this setup is the use of the the same signal which makes the fundamental and carrier frequency to close to be effective. However, from this waveform one can see that amplitude only varies when the carrier is 'on' representing a logic 1. For logic 0, the ASK signal's voltage is approximately -1.79 V. The time domain waveforms are depicted below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L4_FSK_ASK/Figures/1_Initial_ASK_Gen.png)

To improve this, a VCO is implemented to obtain a carrier of 100 KHz which will make recovery much more feasible. After overlaying the time domain waveforms, one is able to see the carrier is only active when there is a rise in the digital message aka logic 1. The waveforms are depicted, and further analysis uses the VCO approach:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L4_FSK_ASK/Figures/2_ASK_VCO_Gen.png)

Moving forward into the second stage, an envelope detector is effectively built. The ASK signal passes through a rectifier and LPF and is represented on the digital oscilloscope. However, while the demodulation was successful its current state is not a perfect copy of the original. This is due to attenuation, rectifier losses, and delays between modules. The waveform is depecited below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L4_FSK_ASK/Figures/3_Initial_ASK_Demod.png)

To improve the recovered signal, one can employ a comparator in conjuction with a variable VDC to set the voltage level for the reference. It accomplishes this by comparing voltage values to the reference input and quickly switches the output to the relevant logic level. Its characteristics involve high gain, sensitivity to small changes, and hysteresis. The wavefroms are depicted below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L4_FSK_ASK/Figures/4_Comparator.png)

As additional work, introducing noise using the noise module and the adder module shows how the impact of noise can cause errors and make a signal unrecovorable despite looking "correct". The influence of 6 dB and 0 db of noise are shown below:

![image](https://github.com/leoki6/Digital-Communications/blob/main/L4_FSK_ASK/Figures/5_Noise_6dB.png)

![image](https://github.com/leoki6/Digital-Communications/blob/main/L4_FSK_ASK/Figures/6_Noise_0dB.png)
______________________________________________________________________________________________________________________________________________________________________________
Shifting to FSK analysis, the general steps are similar, but the encoding of information involves variations in defined frequencies as opposed to amplitude. The first stage involves feeding a 2 KHz signal into the sequence generator and then into the VCO to generate the FSK signal. As shown in the figure below, the frequency changes for logic 1 and again for logic 0. The mark frequency represents a binary 1 and the space frequency represents a binary 0. One can observe that the mark frequency has more cycles than the space though this is not a hard requirement for FSK signals. 
![image](https://github.com/leoki6/Digital-Communications/blob/main/L4_FSK_ASK/Figures/7_FSK_Gen.png)

The second stage involves demodulating the FSK signal using the same techniques as ASK which is a low pass filter, envelope detector, and baseband LPF channel. The initial filter removes the mark frequency as it is higher. This leaves the space frequency intact and active for logic 1 and inactive for 0. The baseband LPF identifies the baseband signal by performing further filtering and acting as a bandlimited channel. The output following this process is depicted below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L4_FSK_ASK/Figures/9_FSK_Recov.png)

Similar to ASK, the final stage involves using a comparator to sharpen transitions and obtain an acceptable copy of the original digital message. The difference being a small time delay between input and output signals.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L4_FSK_ASK/Figures/10_Comparator.png)

## Results Discussion
The primary difference between ASK and FSK is the parameter they use to encode information, amplitude or frequency respectively. ASK is simpler to implement, but has lower noise resistance. It is more cost effective so to speak, at the cost of lower fidelity. FSK is more complex to implement, but it is much more robust against noise, and even when the recovered values are very low, it is still possible to recover the signal via comparator. However, they do share the same goal which is to encode digital information as opposed to analog.

The most obvious difference between ASK and AM is the levels involved. ASK has a discrete number of levels, while AM has infinite levels relative to its continuous range. FSK and FM have differences analogous to ASK vs AM. The varied frequencies in FSK are discrete, while FM involves keeping track of an acceptable frequency variation relative to the continuous range. 

## Additional Experimentation
In the future, it may be worthwhile to highlight the pros and cons of AM, ASK, FM, and FSK by determining cost values for various modules, and noise impact to quantify the system complexity/cost across schemes. Coming up with scenarios where one is preferred over the other, and using data on cost and noise impact can elucidate the decisions communication system designers make in terms of performance and cost.

## Conclusion
In this experiment, students enlisted the use EMONA hardware, and lab equipment to observe the waveforms of ASK and FSK to serve as a comparison between one another, and their analog counter parts. One was able to observe the similar techniques used like rectification, comparators, and LPFs to modulate, demodulate, and clean-up the signal to effectively recover the original message. Additionally, the impact of noise on signal recovery was observed, and why filtering is critical in signal processing for communication systems. As students move forward into more complex schemes, and tools, the foundation built with simpler systems will serve as a point of reference for future work. 



