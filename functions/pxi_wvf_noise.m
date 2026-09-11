function f = pxi_wvf_noise(path, channels, fmin)


pxi_raw = rmmissing(readtable(path));   

fsamp = 1000 * (height(pxi_raw) - 1) / ...
    (pxi_raw.x_Time_msec_(end) - pxi_raw.x_Time_msec_(1));

f = [];
for ch = channels % Hypothetically iterating through multiple channels, but we only have one channel.
    field = "Ch"+ch+"Resp_V_"; 
    [ffta, ff] = noise_avg_fft(pxi_raw.(field), fsamp, fmin); 
    
    f = [f; frd(ffta, ff, 'FrequencyUnit', 'Hz')];


end

end


