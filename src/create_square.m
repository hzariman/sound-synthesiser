% Creates sampled version of a square wave
function x = create_square(amplitude, frequency, phase, fs, duration)

% Input Pramaters
% amplitude: the amplitude of the desired sine signal
% frequency: the desired frequency
% phase : the phase shift wanted
% fs : the sampling frequency
% duration: how long you want the signal to be played

    nsamples = fs * duration; % number of samples from signal wanted
    tsamples = 1 / fs; % sampling period = 1 / sampling frequency
    duty = 0.5; % how often the amplitude of the square wave fluctuates
    
    % The output array to hold the sample values
    x = zeros(1, nsamples);
    
    % for every index in the output array
    for i = 1:nsamples

        % wanted time at the specific sample
        t = i * tsamples;

        % if the position in its cycle is less than halfway through
        % then amplitude is still positive
        if(frequency * t - phase < 0.5)
            x(i) = amplitude;
         
        % Otherwise its flips to become negative
        else
            x(i) = -amplitude;
        end
    end
end

