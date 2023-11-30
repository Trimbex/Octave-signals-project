% Q1
f0 = 440;
alpha = 2^(1/12);

T = 0.5;
fs = 1500;   % Sampling rate (Hz)
N = round(T * fs); % N = number of samples for the entire signal

% DO
f1 = f0 * alpha^(-9);
x1 = cos(2*pi*f1*(0:N-1)/fs);
% RE
f2 = f0 * alpha^(-7);
x2 = cos(2*pi*f2*(0:N-1)/fs);
% MI
f3 = f0 * alpha^(-5);
x3 = cos(2*pi*f3*(0:N-1)/fs);
% FA
f4 = f0 * alpha^(-4);
x4 = cos(2*pi*f4*(0:N-1)/fs);

combined_signal = [x1, x2, x3, x4];

% Q2
audiowrite('sequential_signal.wav', combined_signal, fs);

% Q3
t = (0:length(combined_signal)-1) / fs;
plot(t, combined_signal);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Combined Signal: DO, RE, MI, FA');
grid on;

% Q4
energy_time_domain = sum(abs(combined_signal).^2);
fprintf('Energy of the combined signal in the time domain: %f\n', energy_time_domain);

% Q5-7
% Compute the FFT
X = fftshift(fft(combined_signal));

% Compute the frequency axis
frequencies = linspace(-fs/2, fs/2, length(X));

% Plot the magnitude of X(f)
figure;
plot(frequencies, abs(X));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude of X(f)');
grid on;

% Set the x-axis limits
xlim([-fs/2 fs/2]);

% Compute the energy in the frequency domain
energy_frequency_domain = (1/length(combined_signal)) * sum(abs(X).^2);
fprintf('Energy of the combined signal in the frequency domain: %f\n', energy_frequency_domain);










