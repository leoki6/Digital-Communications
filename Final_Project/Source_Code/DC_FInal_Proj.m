% Leonel Gomez
% Digital Communnications
% Final Project Source Code

clear

% Read the audio file
[audioData, FS] = audioread('Trim_File.flac');

% Extract left channel (assuming stereo audio, using only the left channel)
leftChannel = audioData(:, 1);

% Normalize the audio signal to the range [0, 1]
normalizedSignal = (leftChannel - min(leftChannel)) / (max(leftChannel) - min(leftChannel));

% Scale the normalized signal to the range [0, 255] for 8-bit quantization
scaledSignal = normalizedSignal * 255;

% Quantize the audio signal by rounding to the nearest integer
leftChannelQuantized = round(scaledSignal);

% Ensure the quantized values are within the valid range [0, 255]
leftChannelQuantized = max(0, min(255, leftChannelQuantized));

% Convert to uint8
leftChannelQuantized = uint8(leftChannelQuantized);

% Choose the QAM order
qam_order = 256;

% Modulate the data using qammod
qamModulator = qammod(leftChannelQuantized, qam_order, 'UnitAveragePower', true, 'InputType', 'integer');
scatterplot(qamModulator)

% Define a carrier frequency
carrierFrequency = 10000; % Hz

% Generate the carrier signal
t = (0:length(qamModulator)-1)' / FS;
carrierSignal = exp(1j * 2 * pi * carrierFrequency * t);

% Modulate the signal by multiplying with the carrier
modulatedSignal = qamModulator .* carrierSignal;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pad the modulated signal for FFT
nextPow2 = 2^nextpow2(length(modulatedSignal));
paddedModulatedSignal = [modulatedSignal; zeros(nextPow2 - length(modulatedSignal), 1)];

% Call the custom FFT function
fourier_coeffs = custom_fft(paddedModulatedSignal);

% Compute the magnitude spectrum
magnitude_spectrum1 = abs(fourier_coeffs);

% Plot the magnitude spectrum
figure;
plot(linspace(0, FS/2, nextPow2/2), magnitude_spectrum1(1:nextPow2/2));
title('Magnitude Spectrum of the Modulated Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add some noise (does not affect the signal)
%modulatedSignal = awgn(modulatedSignal, 30, 'measured');

% Demodulate the signal by multiplying with the complex conjugate of the carrier
demodulatedSignal = modulatedSignal .* conj(carrierSignal);

% Pad the demodulated signal for FFT
paddeddemodulatedSignal = [demodulatedSignal; zeros(nextPow2 - length(demodulatedSignal), 1)];

% Call the custom FFT function
fourier_coeffs_demod = custom_fft(paddeddemodulatedSignal);

% Compute the magnitude spectrum
magnitude_spectrum2 = abs(fourier_coeffs_demod);

% Plot the magnitude spectrum
figure;
plot(linspace(0, FS/2, nextPow2/2), magnitude_spectrum(1:nextPow2/2));
title('Magnitude Spectrum of the Deodulated Signal without Filtering');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Demodulate the signal by multiplying with the complex conjugate of the carrier
demodulatedSignal = modulatedSignal .* conj(carrierSignal);

% Pad the demodulated signal for FFT
paddeddemodulatedSignal = [demodulatedSignal; zeros(nextPow2 - length(demodulatedSignal), 1)];

% Call the custom FFT function
fourier_coeffs_demod = custom_fft(paddeddemodulatedSignal);

% Compute the magnitude spectrum
magnitude_spectrum3 = abs(fourier_coeffs_demod);

% Plot the magnitude spectrum
figure;
plot(linspace(0, FS/2, nextPow2/2), magnitude_spectrum3(1:nextPow2/2));
title('Magnitude Spectrum of the Deodulated Signal With Filtering and QAM Demod');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Demodulate the QAM signal
demodulated_ints = qamdemod(filteredSignal, qam_order, 'UnitAveragePower', true, 'OutputType', 'integer');

% Convert the demodulated integers to a signal if needed
demodulated_signal = double(demodulated_ints);

% Convert the quantized signal back to the normalized range [0, 1]
normalizedSignalRecovered = double(leftChannelQuantized) / 255;

% Recover the original signal range
minValue = min(leftChannel); % Minimum value of the original signal
maxValue = max(leftChannel); % Maximum value of the original signal
recoveredSignal = normalizedSignalRecovered * (maxValue - minValue) + minValue;

% Pad the demodulated signal for FFT
paddedRecSignal = [recoveredSignal; zeros(nextPow2 - length(recoveredSignal), 1)];

% Call the custom FFT function
fourier_coeffs_rec = custom_fft(paddedRecSignal);

% Compute the magnitude spectrum
magnitude_spectrum4 = abs(fourier_coeffs_rec);

% Plot the magnitude spectrum
figure;
plot(linspace(0, FS/2, nextPow2/2), magnitude_spectrum4(1:nextPow2/2));
title('Magnitude Spectrum of Recovered Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Save the recovered signal to a FLAC file
%audiowrite('recovered_signal.flac', recoveredSignal, FS);

% Custom FFT function
function fourier_coeffs = custom_fft(signal)
    % Get the length of the signal
    N = length(signal);
    
    % Check if N is a power of 2
    if ~(log2(N) == floor(log2(N)))
        error('Signal length must be a power of 2 for FFT.');
    end
    
    % Pad the signal with zeros if necessary (does not actually do this)
    if N > length(signal)
        signal = [signal; zeros(N - length(signal), 1)];
    end
    
    % Bit-reversal permutation
    signal = bitrevorder(signal);
    
    % Compute the FFT recursively
    fourier_coeffs = fft_recursion(signal, N);
end

function X = fft_recursion(x, N)
    % Base case: N = 1
    if N == 1
        X = x;
        return;
    end
    
    % Divide the input sequence 
    x_even = x(1:2:N);
    x_odd = x(2:2:N);
    
    % Recursively compute the FFT of the even and odd sequences
    X_even = fft_recursion(x_even, N/2);
    X_odd = fft_recursion(x_odd, N/2);
    
    % Combine the results
    X = zeros(1, N);
    for k = 0:(N/2 - 1)
        X(k+1) = X_even(k+1) + exp(-1j * 2 * pi * k / N) * X_odd(k+1);
        X(k+N/2+1) = X_even(k+1) - exp(-1j * 2 * pi * k / N) * X_odd(k+1);
    end
end
