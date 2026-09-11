function [ffta, ff] = noise_avg_fft(arr, fsamp, fmin)
% noise_avg_fft(arr, fsamp, fmin) generates a smoothed noise floor from a
% raw recording.  fsamp is the sampling frequency, typically double the
% PXI maximum frequency (99 kHz --> 198e3). fmin is the fft bin size in the
% smoothed recording.  10 Hz with a 10 s recording produces good results.
%
% The output of this function has units <unit>/sqrt(Hz).
%
% This function operates by taking the RMS average of many individual DFTs.
% For instance, a 10 second recording with fmin = 10 Hz would take the RMS
% average of 100 DFTs of duration 100 ms.

n = floor(fsamp/fmin);
fmin = fsamp / n;
n_avgs = floor(length(arr) / n);

fftarr = fft(reshape(arr(1:n*n_avgs), n, n_avgs), [], 1);
ffta = sqrt(sum(abs(fftarr).^2, 2).*fmin./n_avgs)./fsamp.*sqrt(2);
ffta = ffta(2:(floor(length(ffta)/2)+1));
ff = fmin * (1:length(ffta)).';
end