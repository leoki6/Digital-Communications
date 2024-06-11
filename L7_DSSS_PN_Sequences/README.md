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
This laboratory involves a variation of the DSBSC modulation scheme called Direct Sequence Spread Spectrum. This scheme involves the use of a pulse train rather than a sine wave as the carrier, which in essentially made up of a bunch of small sinusoids that produce the pulse train. This pulse train is a psuedo-noise sequence. The benefit of this signal is its resistance to jamming since the message contents are spread across so many of these pulses that deliberately trying to jam them is difficult. To be able to capture message information one would need the specific PN sequence and as the sequence gets longer brute forcing becomes near-infeasible. Thus, in this lab students investigate the DSSS scheme and its use of PN sequences to prevent jamming and encode information using a pulse train.

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

Alternatively, we can feed a speech signal in addition to the line code, to observe real time speech modulation. We'll notice here that there is no signal when there is no speech occurring. This is likely due to the nature of PN sequences where if there is very little signal, the result of the mulitiplication will be minimal. There may also be an activation thershold that is not met.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A2_Speech_Mod.png)

We can get more of an active modulation by speaking as shown below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A3_Modulation.png)

To demodulate the signal we build a typical product detector which involves multiplying by the stolen PN sequence, and passing it through a filter. More interestingly, we can introduce a VCO to begin to jam the signal. By tuning the frequency and gain knobs of the adder where the DSSS signal and VCO interact we observe impacts to the signal, but we'll notice that these adjustments don't seem to affect the demodulated output much.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A4_F_Adjust.png)

Again, we don't see much of an impact even increasing the gain of the VCO. This is due to the PN sequence spreading the signal over a wide-frequency band. Thus, targetting only a specific frequency even with an increase in gain is not effective.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A4_G_F_Adjust.png)

We can perform a more robust form of jamming by sweeping the DSSS signal with a range of frequencies. Even the distortion as a result is still minimal.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A5_VCO_Sweep.png)

We can go even further by introducing noise to achieve a broadband form of jamming using varying noise sizes. Again, we'll notice that even peforming this with larger sweeps and using growing noise sizes the output is still minimally affected. The strength of DSSS is shown very clearly in the figures below:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A6_20dB.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A7_6dB.png)
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/A8_0dB.png)

### PN Sequences

To expand on our work with DSSS, we'll take a deeper dive into PN sequences. We'll start by examining the SYNC output of the sequence generator and its X code. We'll note here that the pulse of the sync output lines up with the start of the X sequence. We can calculate the width of of one of bit by using the oscilloscope to find the period of the X sequence and then dividing by 31 bits. This results in a width of 477.4 microseconds for one bit. The period for the SYNC Pulse is 14.80 ms using the oscilloscope. There is a small difference between the period of the sync and the duration of the sequence. This is likely due to the initial pulse time, and the X sequence'ss response to it. 
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/B1_SYNC_X.png)

Moving forward, we'll observe the FFT of the PN Sequence to find its frequency nulls. These are about 2 KHz, 4 KHz, 6 KHz, and 8 KHz. However, we can see more lobes than initially predicted. This is due to the bandwidth of the system because we are not passing it through any filter which allows it to go beyond what was expected, and the wideband of the sequence itself. Theoreticlly, there would be an infinite amount of harmonics making up each lobe.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/B2_Freq_Nulls.png)

We can take the output of the PN sequence and observe the 'psuedo-noise' generated to gain an understanding of what is being multiplied into the message. The period of the noise is about 76 microseconds. Passing this through an LPF we'll see a much smoother signal beacuse even though it appears as noise it is still a pulse train made up of sinusoids. We'll see repetitive smooth signals here.
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/B3_Psuedo_Noise.png)

We can notice here that despite X and Y having different lengths of 31 bits and 255 bits the spectra have the same number of lobes. This is primiarly due to the spreading factor of the PN sequence and its bandwidth. The autocorrelation of PN sequences is also strong thus the spread takes dominance in the FFT. 
![image](https://github.com/leoki6/Digital-Communications/blob/main/L7_DSSS_PN_Sequences/Figures/B4_X_Lobes.png)


## Results Discussion

The use of DSSS shows its strength of its scheme by being highly resistant to jamming. Additionally, it is also a DSBSC signal thus it makes use of its spectrum efficiently. The difference from typical DSBSC comes from the use of a pulse train rather than a sinewave. As we've observed in figures above, increasing the jamming signal's gain, frequency, and frequency range still allows the demodulated signal to be recovered with minimal effect. This in turn is due to the use of PN sequences. Observing the spectrum of the PN sequences we are able to understand that it isn't true noise as it is still used as a carrier, but with increasing lengths of PN sequences it becomes harder and harder to jam which shows its applications in reliable communications and so on.

We can also observe the spread factor of the PN Sequence as it encodes information across a wideband even in a bandlimited channel. Passing it through an LPF reveals its nature as a theoretically infinite combination of sinusoids. We can even call it a psuedo-random sequence. Despite not being truly random you'll need the exact sequence to jam the signal or reveal its contents which is difficult considering modern PN sequences. The power of the DSSS signal can be redistributed to the orignal baseband to receive the message.

## Additional Experimentation
For future work, we can apply SNR and BER calculations to the DSSS signal to observe its performance metrics. Though, we'd expect low values given the robust nature of PN Sequences. We can look for a point where the jamming signal or added channel noise is too strong to make the signal recoverable. This could end up being quite a challenge. Alternatively, we can investigate the use of alternative carriers besides sine and pulse trains and observe the effect and whether recovery is feasible.

## Conclusion
In this experiment, students observed the robustness of the DSSS scheme in conjunction with PN sequences to reject jamming signals while still being recoverable. We were able to observe the spread of power as modulation occurs due to the wideband and pulse train of the carrier. One was also able to idenitify the psuedo-noise properties of PN sequences which makes them predictable, but when using longer and longer sequences becomes difficult to brute force even with more comprehensive jamming techniques. The main properties of DSSS and PN sequences lends itself well to ensuring clear communication in noisy environments or where jamming is present like in a millitary setting. 


