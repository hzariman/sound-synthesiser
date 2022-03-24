% Applies a rudimentary bandpass filter given any signal
% Credit: inspired by Darell Chua Yun Da ECE 45 FA2021 Project
function y = bandpass(signal, fs, low_bound, high_bound)

% Input Pramaters
% signal: the signal the band pass will be applied to
% fs: the sampling frequency
% low bound : the lowest bound for the range of frequencies kept
% high bound : the highest bound for the range of frequencies kept

    % The length of the signal
    singalLength = length(signal);

    % Creates a vector of all possible frequencies present and multiplies
    % it by sampling frequency
    F = fs * (-singalLength/2 : (singalLength/2 - 1))/singalLength;

    % Fourier Transform of the signal and shifts it to the centre of the
    % spectrum
    h = fftshift(fft(signal));

    % The length of the frequency vector
    FLength = length(F);

    % The output matrix in the frequency domain
    Y =  zeros([1,FLength]); 
    
    % For every index in the output matrix
    for n = 1:FLength

        % if the frequency at the specific index is greater than the lowest
        % bound and smaller at the highest bound then let through.
        if low_bound < abs(F(n))
            if (high_bound > abs(F(n)))
                Y(n) = 1;
            end
        else
            Y(n) = 0;
        end
    end
        
    % Perform inverse transform to get sampled signal back in time domain.
    Y = fftshift(h .* Y);
    y = real(ifft(Y));
end

