s = tf('s');
ee = 1.602e-19;

tfs.s = s;

tfs.logain = 1.91e12 * (1 - 1/(s*0.01 + 1))^2;
tfs.logain.InputUnit = {'C'};
tfs.logain.OutputUnit = {'V'};

tfs.higain = (s*0.01 + 1) / (s*0.001 + 1) * tfs.logain;
tfs.higain.InputUnit = {'C'};
tfs.higain.OutputUnit = {'V'};

tfs.single = 5e12 * (1 - 1/(s*20e-3 + 1)) * (1 - 1/(s*10e-3 + 1)) * (1 - 1/(s*1e-3 + 1));
tfs.single.InputUnit = {'C'};
tfs.single.OutputUnit = {'V'};

tfs.a_weight = 7.39705e9 * s^4 / (...
    (s + 129.4)^2 * (s + 676.7) * (s + 4636) * (s + 76655)^2);

% The pressure sensitivity of 1.52e-3 V/Pa needs to be obtained
% experimentally during calibration

tfs.cal_03_02 = generate_cal(...
    'ayeiser_data/2022_03_02_probe_calibration/f8.txt', ...
    {'bayer', 'mic', 'ref'},...
    1.52e-3, 16);

tfs.cal_green_10_31_25 = generate_cal(...
    'data2/mic_calibration_green_10_31_25/f2.txt', ...
    {'mic', 'ref'},...
    1.52e-3, 16);
