function [PdB_signal,PdB_noise,SNR,v_rms] = pwelch_SNR(x,Fs)

x = x - mean(x);
Ts = 1/Fs;
N = length(x);
nfft = N/8;
window = rectwin(nfft);
overlap = nfft/2;

[pxx,f] = pwelch(x,window,overlap,nfft,Fs);
PdB_bin = 10*log10(pxx*Fs/nfft);

[Y, K_peak] = maxk(PdB_bin,2);
if f(K_peak(1)) == 60
    y = Y(2);
    k_peak = K_peak(2);
else
    y = Y(1);
    k_peak = K_peak(1);
end
Psum = Fs/nfft * sum(pxx(k_peak-2:k_peak+2));
PdB_signal = 10*log10(Psum);
PdB_Hz = 10*log10(pxx);
Fn = 12000;
kn = round(Fn/Fs*nfft);
PdB_noise = mean(PdB_bin(kn-10:kn+10));

SNR = PdB_signal - PdB_noise;

v_rms = sqrt(pxx(k_peak)*Fs/nfft);

% clf
plot(f,PdB_bin,'linewidth',1)
% hold on;
% scatter(f(k_peak),y,'filled','MarkerFaceColor',[0 0 0])
% hold on;
% scatter(Fn,PdB_noise,'filled','MarkerFaceColor',[0 0 0])
grid on;
xlabel('Frequency [Hz]')
ylabel('PSD [dB/Hz]')

end