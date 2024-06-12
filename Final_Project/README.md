# Lab 7 - Final Project

## Table of Contents
- [Project Objective](#project-objective)
- [Software Requirements](#software-requirements)
- [Useful Resources](#useful-resources)
- [System Diagrams](#system-diagrams)
- [System Analysis](#system-analysis)
- [Results Discussion](#results-discussion)
- [Additional Experimentation](#additional-experimentation)
- [Conclusion](#conclusion)

## Project Objective
In this project, the purpose was to encode, modulate, and demodulate a FLAC file using the QAM-256 scheme. This serves to encapsulate some of the processes and tools during the duration of the Digital Communications. We'll observe the encoding of information and the use of carriers to transmite information reliably. This also includes quantizing and restoring the quantized information for comparison with the original. We'll note the robustness of QAM and its ability to retain high fidelity information, and what the parameters necessary to meet that are.

## Software Requirements
- MATLAB R2022b
- Audio File (FLAC, MP3, WAV)

## Useful Resources
- MATLAB Documentation

## System Schematics
![image](https://github.com/leoki6/Digital-Communications/blob/main/Final_Project/System_Diagrams/System_Diagram.png)

## System Analysis

### Audio Extraction and Initial Analysis
The first stage of the system involves reading in a FLAC file, and isolating one channel for analysis. Before moving into further analysis, its important we establish the initial time domain and frequency spectrum of the signal.
![image](https://github.com/leoki6/Digital-Communications/blob/main/Final_Project/Figures/LEFT_RIGHT_CHANNELS.png)

The frequency spectrum of spectrum for double sided and single side is shown below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/Final_Project/Figures/LEFT_RIGHT_LIN_SPECTRUM.png)

We can notice that there is a lot of content contained in this file which means we have a lot of data we can lose. Fortunately we are using FLAC files which are high fidelity, and QAM which is a robust scheme
![image](https://github.com/leoki6/Digital-Communications/blob/main/Final_Project/Figures/DS_Spectrum.png)

### Quantization and QAM-256
To utilize the QAMMOD, we need to quantize the FLAC file for processing. For QAM256 this involves quantizing for 255 levels. This involves scaling the signal by 255 and rounding to the nearest integer. We can pass this to QAMMOD in MATLAB and produce a constellation plot:
![image](https://github.com/leoki6/Digital-Communications/blob/main/Final_Project/Figures/CONST_PLOT.png)

It's important to notice that is an ideal constellation because there are no noisy conditions.

Furthermore, we can also look at the spectrum from this modulation as shown below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/Final_Project/Figures/QAM_Spectrum.png)

### Carrier Modulation
Moving forward, we can multiply the result of the QAM modulation by 100 KHz complex carrier. We can observe the new spectrum down below with a spike at the carrier frequency:
![image](https://github.com/leoki6/Digital-Communications/blob/main/Final_Project/Figures/MOD_SPECTRUM.png)

### Carrier Demodulation
To demodulate carrier, it is as simple as multiplying by the complex carrier. This prepares the data to be processed in QAMDEMOD. 

### QAM Demodulation and Recovery
To demodulate from QAM, we can pass this to the QAMDEMOD function in MATLAB to return the recovered signal. However, this involves restoring the integer inputs to their original form, and removing the quantization performed earlier.

Here we can see, we divide the integer data by 255, and then idenitfying the min and max values from this divsion and then finally shift by the minimum values to align with the original signal properly.
![image](https://github.com/leoki6/Digital-Communications/blob/main/Final_Project/Figures/CODE_SNIP.png)

Following this recovery, we can verify the spectrum once more and write the recovered signal to a FLAC file for audio comparison:
![image](https://github.com/leoki6/Digital-Communications/blob/main/Final_Project/Figures/REC_SPECTRUM.png)

### Custom FFT
Through out this project, there is the use of a custom FFT function which is based heavily on the Cooley-Tukey algorithm where we split the sequence into even and odd bits and then recursively compute the DFT. This speeds up the computation significantly from the typical DFT. Specifically from N^2 to Nlog(N) which is very significant for a large N like in this case.

For example, an N = 1,000,000 results in 1 Trillion calculations for the typical DFT, but only 20 million for the Cooley-Tukey FFT algorithm. This is several orders of magnitude apart, not even addressing the time to perform those calculations. The results from this function allow us to compute the magnitude frequency spectrum at various points to verify results and observe the results of modulation.

## Results Discussion
As we've observed the frequency spectrum at different points we'll notice the effective modulation and demodulation of the 10 KHz carrier, and QAM. If looking at the alternative source code for this project you notice an attempt to introduce AWGN via a channel, however it had no effect on the recovered signal. There was a minor attenuation, but it was minimal. This suggests the robustness of QAM or MATLAB's QAMDEMOD function has built in filtering in clean up.

Observing the constellation plot, we can see 255 symbols which indicates the quanitization was successful. This is further verified by the reconstruction of the signal when listening on speakers, they sound the same. Overall, QAM256 is an effective modulation/demodulation scheme that maintains the integrity of audio files, and exemplifies the continuation of AM despite its lower fidelity compared to other schemes.

## Additional Experimentation
For further work, constructing a stand-alone QAM modulator and demodulator would prove as a useful exercise to get into more of the inner workings of QAM. This is typically multiplying two quantized signals by two orthogonal carriers and then adding their results to obtain a QAM signal. However, as learned in this project, it is not that simple. There is often padding to perform, filter selection, and measuring SNR and BER.

Additionally, it would be useful to continue work on noise modeling. There was an attempt to do so in this project, but there was very little effect even with low SNR values.

## Conclusion
This project involved modulating a snippet of a FLAC file using QAM and observing its spectrum at various points and its reconstruction for aural comparison. This showed the robustness of QAM and its abillity to retain the fidelity of its message contents even in noisy environments.  The quantization, and recovery of the signal played an integral part in encoding a large amount of data for efficient transmission. Despite an N of 2657147, the FTT computed the coefficients quickly which allowed one to quickly compute relevant spectrums for verification. The power of QAM for audio signals is on full display in this project.


