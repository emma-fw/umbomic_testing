function [intens, bins, stair_bins] = third_octave_density(lower, upper, freqs, signal)
% stair_bins is for plotting with stairs() function
f_1_dec = [100 125 160 200 250 315 400 500 630 800];

band = @(n) 10.^floor(-2+n/10) .* f_1_dec(1+mod(n, 10));
gm = @(a, b) sqrt(a.*b);

bin_limits = band(lower-1:upper+1);
bins = bin_limits(2:end-1);
bin_limits = gm(bin_limits(1:end-1), bin_limits(2:end));
stair_bins = bin_limits(1:end-1);
noise_pow = abs(signal).^2;

intens = zeros(size(bins));
for i = 1:length(bins)
    fs = freqs((freqs > bin_limits(i)) & (freqs < bin_limits(i+1)));
    fs2 = [bin_limits(i); fs; bin_limits(i+1)];
    pows = interp1(freqs, noise_pow, fs2);
    
    intens(i) = sqrt(trapz(fs2, pows));
end
