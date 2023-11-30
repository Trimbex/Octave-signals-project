source('muscial_notes.m');

% Design a Butterworth high-pass filter
filter_order_hp = 20;
cutoff_frequency_hp = 370; % Adjust as needed

% High-pass filter coefficients
[b_hp, a_hp] = butter(filter_order_hp, cutoff_frequency_hp / (fs/2), 'high');

% Apply the high-pass filter to the combined signal
filtered_signal_hp = filter(b_hp, a_hp, combined_signal);
y2 = filtered_signal_hp;

% Save the high-pass filtered signal to a .wav file using audiowrite
audiowrite('butterworth_high_pass.wav', y2, fs);

% Plot the magnitude and phase response of the high-pass filter
freqz(b_hp, a_hp, fs, fs);

% Time vector for the high-pass filtered signal
t_hp = (0:length(y2)-1) / fs;

% Plot the high-pass filtered signal against time
figure;
plot(t_hp, y2);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('High-Pass Filtered Signal vs Time');
grid on;

% Compute the energy of the high-pass filtered signal in the time domain
energy_time_domain_hp = sum(abs(y2).^2);
fprintf('Energy in Time Domain (High-Pass): %f\n', energy_time_domain_hp);

% Compute the frequency spectrum of the high-pass filtered signal
fft_y2 = fftshift(fft(y2));
fft_mag_y2 = abs(fft_y2);

% Frequency axis for the high-pass filtered signal
frequencies_hp = linspace(-fs/2, fs/2, length(fft_y2));

% Plot the magnitude spectrum of the high-pass filtered signal
figure;
plot(frequencies_hp, fft_mag_y2);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of High-Pass Filtered Signal');
grid on;

% Compute the energy of the high-pass filtered signal in the frequency domain
energy_frequency_domain_hp = (1/length(y2)) * sum(abs(fft(y2)).^2);
fprintf('Energy in Frequency Domain (High-Pass): %f\n', energy_frequency_domain_hp);

