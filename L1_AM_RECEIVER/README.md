# Lab 1 - AM Receiver

## Table of Contents
- [Laboratory Objective](#laboratory-objective)
- [System Schematic](#system-schematic)
- [Hardware Requirements](#technology-description)
- [Software Requirements](#technology-description)
- [System Analysis](#system-analysis)
- [Results](#results)
- [Results Discussion](#results-discussion)
- [Conclusion](#conclusion)

## Laboratory Objective
The purpose of this laboratory assignment was to introduce and build a simple amplitude modulated receiver capable of tuning into AM radio stations in Denver, CO. This was achieved using the GNU Radio Companion software and a NooElec RTL-SDR. Students reinforced concepts such as: Product modulation, resampling, decimation and filtering.

## Hardware Requirements
- NooElec NESDR Smart XTR SDR - Premium RTL-SDR
- Antenna Mast
- Antenna Base & Cable
  
## Software Requirements
- Windows, Ubuntu, or MacOS
- GNU Radio Companion

## Useful Resources
https://wiki.gnuradio.org

## System Schematic
The following schematic was designed, constructed, and tested: 

![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Schematic/am_receiver_schematic.png) 

## System Analysis
#### Preliminary Variables, Options, and Ranges
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/variables_ranges_options.png) 

The 'options' block in the image above allows one to set specific parameters such as a title and author to begin constructing the flow graph. Additionally, one can set the output language, windowing size, file id, and so on. It is important to note that there is only one options block allowed per flow graph.

The 'variable' block allows one to assign a specific value to a specific id that can be reused in later blocks to save time or perform mathematical operations. In this case, the id 'samp_rate' has been set to 400K. (still need to justify this)

The 'QT GUI RANGE' block is similar to a variable block, but with increased parameters such as a changeable label, start, stop, step size, and type. This block is primarily useful when simulating because it introduces a moveable slider that can be adjusted to observe real-time system behavior. In this case we have set:

- Center Frequency to a default value of 100 MHz with a range of 10 MHz to 560MHz and a step size of 100 KHz ('center_freq').
- RF Gain to a default value of 55 with a range of 10 to 70 and a step size of 5. ('rf_gain').

#### Signal Source Generation and Filtering
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/source_filter_freq.png) 

The 'RTL-SDR' block supports the SDR in use for this experiment, and actually supports a fair number of non-OsmoSDR hardware due to its hardware independent features. This step takes a received signal from the SDR and multiplies it with a carrier signal. There are numerous parameters pertaining to this block, but for this experiment the following parameters are of interest:

- Sample Rate, set to 'samp_rate'.
- Ch0 Frequency, set to 'center_freq'.
- RF and IF Gain, change our overall gain and the gain between 15 to 30 dB for IF gain.
- BB Gain, baseband gain of the device.

The 'QT GUI Frequency Sink' block creates the PSD for the desired signal which provides information on the power of a signal at different frequencies. It can also help establish the frequency range the system operates in

The 'Low Pass Filter' block is a critical step for this system, the signal passing through this filter is attenuated for values above 5 KHz and accepts values below that frequency. In GNU Radio Companion, this is simply a wrapper for a Decimating FIR Filter. For this system, at this stage, decimation and gain are kept at a value of 1 and the sampling rate remains consistent from previous blocks. The windowing technique for this block has been set to a default 'Hamming'. A notable parameter for this block is:

- Transition Width, set to a value of 1K

The transition width is the range of frequencies where the signal transitions from the passband to the stopband. The full transition width can be found by subtracting the passband frequency from the stopband frequency. An example of a transition width can be seen below:

![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/transition_width.png)

Pre-Filtering:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/pre_filter_waveforms.png)

Post-Filtering:
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/post_filtering_waveforms.png)

It is important to be aware of the 'type' of data being processed in this stage, which is 'complex'. Otherwise, the signal is now ready for demodulation.

#### Demodulation and Throttling
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/demod_throttle.png) 

The 'AM Demod' block takes the received complex signal and turns it into the original baseband signal (real float). The audio start and stop parameters indicate the additional low pass filtering being executed in this block. In this case, one can see these parameters as a transition width which is about 500 Hz. 

Note: Having different filtering stages prevents having to create a high-order low pass filter to deal with the first transition width (1K) and the second (500 Hz).

The 'throttle' block serves a critical purpose for the system in that it limits the rate at which the source signal block generates samples. Without this, the performance of simulation may suffer and cause the CPU of your computer to grind to a halt. The 'throttle' block is not always accurate and should not be preffered over using an actual hardware sink/source in conjunction with a sample clock. In this case, the 'throttle' block accepts a real float as an input and output.

#### Resampling, Waterfall Sink, and Audio Sink
![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/resample_audio_waterfall.png) 

The 'rational resampler' block is another critical step in the processing of the received signal. The signal sample rate prior to resampling is 400K, and the hardware for this system is only able to handle 32 KHz revealing an incompatibility. The 'rational resampler' allows one to interpolate and decimate the signal (in that order) to achieve a reduced or increased sample rate depending on system requirements. For this case:

Incoming Sample Rate = 400K = (400k * 32) = 12800000 Hz / 400 = 32 KHz

It is important to first interpolate because the reverse yields a float which is incompatible with the design of this system at this stage.

The 'QT GUI Waterfall Sink' creates a spectrogram of the demodulated signal and can only accept a single input stream at a time. This plot indicates what frequencies in the received signal contain the most energy. 

The 'Audio Sink' block allows the user to listen to the filtered, demodulated, refiltered, and resampled signal depending on the user's hardware. This block actually supports stereo audio with a max input of 2 and has a limited number of sampling rates. 

## Results
The lowest detectable frequency the RTL-SDR is capable of processing is 65MHz. Unfortunately, the overwhelming majority of AM radio stations are between 535 to 1705 KHz. This is not to say that the user cannot implement a small-scale transmitter to test the frequency range of the SDR and the system designed provided they exercise all necessary precautions and certifications. The following plots were generated with a center frequency of 100 MHz, which makes the majority of the data noise, but this noise can still be analyzed to observe its frequency components relative to its energies and its behavior over time (waterfall).

![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/final_freq_waterfall.png)

## Results Discussion
The results indicate that the baseband signal is centered at 100 MHz which can be adjusted using the sliders constructed. According to the waterfall plot, the majority of the baseband signal's energy resides between 100006 KHz and 99993 KHz which is a difference of about 13 KHz. Ideally, provided there were AM stations in the frequency range of the SDR, moving the center frequency slider would allow one to tune into different radio stations

## Future Experimentation
In the future, it may be worth while to introduce the 'Ham It Up Plus' by Nooelec into the system despite its cost. This piece of hardware can extend the range of the system down to 300 Hz which will enable the user to tune into AM Radio with, ideally, better fidelity. The hardware is pictured below:

![image](https://github.com/leoki6/Digital-Communications/blob/main/L1_AM_RECEIVER/Additional%20Figures/ham_it_up.png)

## Conclusion
This laboratory experiment introduced a simple AM Receiver for use with SDR hardware, which in theory, allows one to tune into AM radio stations in range. Concepts such as modulation, demodulation, and resamping in conjunction with parameters such as center frequency were emphasized in this experiment. This paves a very general path that can be used to begin experimenting with FM despite its increased complexity and associated theory.

