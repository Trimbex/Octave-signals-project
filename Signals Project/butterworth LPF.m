source('muscial_notes.m');

% Design a Butterworth low-pass filter
filter_order = 20;
cutoff_frequency = 300; % Set an appropriate cutoff frequency in Hz

[b, a] = butter(filter_order, cutoff_frequency / (fs/2), 'low');

% Apply the filter to the combined signal
filtered_signal = filter(b, a, combined_signal);

% Time vector
t = (0:length(filtered_signal)-1) / fs;

% Create a new figure for time-domain plot
figure;

% Plot the signal against time
subplot(3, 1, 1);
plot(t, filtered_signal);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Filtered Signal vs Time');
grid on;

% energy
energy_filtered_signal = sum(abs(filtered_signal).^2);
fprintf('Energy of the filtered signal: %f\n', energy_filtered_signal);

% Create a new figure for magnitude spectrum
subplot(3, 1, 2);

% Compute the frequency spectrum of filtered_signal
fft_filtered_signal = fftshift(fft(filtered_signal));
fft_mag_filtered_signal = abs(fft_filtered_signal);

% Frequency axis
frequencies = linspace(-fs/2, fs/2, length(fft_filtered_signal));

% Plot the magnitude spectrum
plot(frequencies, fft_mag_filtered_signal);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of Filtered Signal');
grid on;

% Compute the energy of the signal in the frequency domain
energy_frequency_domain = (1/length(filtered_signal)) * sum(abs(fft(filtered_signal)).^2);
fprintf('Energy in Frequency Domain: %f\n', energy_frequency_domain);

% Create a new figure for frequency response
subplot(3, 1, 3);

% Plot the magnitude and phase responses
freqz(b, a, fs, fs);

