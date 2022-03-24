% Returns a sampled sine wave
function x = create_sine(amplitude, frequency, phase, fs, duration)

% Input Pramaters
% amplitude: the amplitude of the desired sine signal
% frequency: the desired frequency
% phase : the phase shift wanted
% fs : the sampling frequency
% duration: how long you want the signal to be played

    nsamples = fs * duration; % number of samples from signal wanted
    tsamples = 1 / fs; % sampling period = 1 / sampling frequency
    
    % The output array to hold the sample values
    x = zeros(1, nsamples);
    
    % for every index in the output array
    for i = 1:nsamples

        % wanted time at the specific sample
        t = i * tsamples;

        % obtain the value of the sin function using given parameters
        % store in output array. 
        x(i) = amplitude * sin(2 * pi * frequency * t - phase);
    end
end

