%Finds the signal in the frequency domain to be plotted on the main UI
function h = plot_freq_domain(signal)
    
    % Find the Fourier transform of the signal and shift it
    h = fftshift(fft(signal));
end

