tfs = load('common_tfs.mat');

names = {'probe', 'cant', 'ldv', 'crest'};
units = {'Pa', 'C', 'm/s', 'V'};
higain = {1/(100*tfs.cal_03_02), 1/tfs.higain, 0.005, 1};

%%
% Ear 1

data_dir_ear1 = "data/ear1_1/";
data_dir_ear1_2 = "data/ear1_2/";

umbo_velocity_ew28 = pxi_to_frd(data_dir_ear1+"f668.txt",names, units,higain);

umbo_velocity_39 = pxi_to_frd(data_dir_ear1_2+"f168.txt",names, units,higain);

G1_39 = pxi_to_frd(data_dir_ear1_2+"f3612.txt",names, units,higain);

G3_39 = pxi_to_frd(data_dir_ear1_2+"f420.txt",names, units,higain);

G6_39 = pxi_to_frd(data_dir_ear1_2+"f756.txt",names, units,higain);

G7_39 = pxi_to_frd(data_dir_ear1_2+"f1428.txt",names, units,higain);

G8_39 = pxi_to_frd(data_dir_ear1_2+"f2352.txt",names, units,higain);

G9_39 = pxi_to_frd(data_dir_ear1_2+"f3024.txt",names, units,higain);

G1_39 = pxi_to_frd(data_dir_ear1+"f1529.txt",names, units,higain);

G3_39 = pxi_to_frd(data_dir_ear1+"f2201.txt",names, units,higain);

G4_39 = pxi_to_frd(data_dir_ear1+"f2957.txt",names, units,higain);

G5_39 = pxi_to_frd(data_dir_ear1+"f3545.txt",names, units,higain);

G1_nf = pxi_wvf_noise(data_dir_ear1+'f4134wvf.txt',0,100) / tfs.higain;
%%
% Ear 2

data_dir_ear2 = "data/ear2/";
umbo_velocity_40 = pxi_to_frd(data_dir_ear2+"f84.txt",names, units,higain);

G1_40 = pxi_to_frd(data_dir_ear2+"f252.txt",names, units,higain);
G1_40_100mV = pxi_to_frd(data_dir_ear2+"f252.txt",names, units,higain);
G1_40_50mV = pxi_to_frd(data_dir_ear2+"f336.txt",names, units,higain);
G1_40_10mV = pxi_to_frd(data_dir_ear2+"f420.txt",names, units,higain);
G1_40_5mV = pxi_to_frd(data_dir_ear2+"f504.txt",names, units,higain);
G1_40_1mV = pxi_to_frd(data_dir_ear2+"f588.txt",names, units,higain);
G1_40_500uV = pxi_to_frd(data_dir_ear2+"f672.txt",names, units,higain);

G3_40 = pxi_to_frd(data_dir_ear2+"f840.txt",names, units,higain);

G4_40 = pxi_to_frd(data_dir_ear2+"f1596.txt",names, units,higain);

G5_40 = pxi_to_frd(data_dir_ear2+"f2268.txt",names, units,higain);
G5_40_100mV = pxi_to_frd(data_dir_ear2+"f2268.txt",names, units,higain);
G5_40_50mV = pxi_to_frd(data_dir_ear2+"f2352.txt",names, units,higain);
G5_40_10mV = pxi_to_frd(data_dir_ear2+"f2436.txt",names, units,higain);
G5_40_5mV = pxi_to_frd(data_dir_ear2+"f2520.txt",names, units,higain);
G5_40_1mV = pxi_to_frd(data_dir_ear2+"f2604.txt",names, units,higain);
G5_40_500uV = pxi_to_frd(data_dir_ear2+"f2688.txt",names, units,higain);
G5_40_100uV = pxi_to_frd(data_dir_ear2+"f2772.txt",names, units,higain);

G6_40 = pxi_to_frd(data_dir_ear2+"f2940.txt",names, units,higain);
G7_40 = pxi_to_frd(data_dir_ear2+"f5995.txt",names, units,higain);
G8_40 = pxi_to_frd(data_dir_ear2+"f4032.txt",names, units,higain);
G9_40 = pxi_to_frd(data_dir_ear2+"f6583.txt",names, units,higain);

sG1 = [
    G1_40_100mV('cant').ResponseData(:)...
    G1_40_50mV('cant').ResponseData(:)...
    G1_40_10mV('cant').ResponseData(:)...
    G1_40_5mV('cant').ResponseData(:)...
    G1_40_1mV('cant').ResponseData(:)...
    G1_40_500uV('cant').ResponseData(:)...
];

pG1 = [
    G1_40_100mV('probe').ResponseData(:)...
    G1_40_50mV('probe').ResponseData(:)...
    G1_40_10mV('probe').ResponseData(:)...
    G1_40_5mV('probe').ResponseData(:)...
    G1_40_1mV('probe').ResponseData(:)...
    G1_40_500uV('probe').ResponseData(:)...
];


sG5 = [
    G5_40_100mV('cant').ResponseData(:)...
    G5_40_50mV('cant').ResponseData(:)...
    G5_40_10mV('cant').ResponseData(:)...
    G5_40_5mV('cant').ResponseData(:)...
    G5_40_1mV('cant').ResponseData(:)...
    G5_40_500uV('cant').ResponseData(:)...
    G5_40_100uV('cant').ResponseData(:)...
];

pG5 = [
    G5_40_100mV('probe').ResponseData(:)...
    G5_40_50mV('probe').ResponseData(:)...
    G5_40_10mV('probe').ResponseData(:)...
    G5_40_5mV('probe').ResponseData(:)...
    G5_40_1mV('probe').ResponseData(:)...
    G5_40_500uV('probe').ResponseData(:)...
    G5_40_100uV('probe').ResponseData(:)...
];

%%
% Ear 3
data_dir_ear3 = "data/ear3/";

umbo_velocity_41 = pxi_to_frd(data_dir_ear3+"f111.txt",names, units,higain);

G1_41 = pxi_to_frd(data_dir_ear3+"f279.txt",names, units,higain);
G1_41_100mV = G1_41;
G1_41_50mV = pxi_to_frd(data_dir_ear3+"f363.txt",names, units,higain);
G1_41_10mV = pxi_to_frd(data_dir_ear3+"f867.txt",names, units,higain);
G1_41_5mV = pxi_to_frd(data_dir_ear3+"f783.txt",names, units,higain);
G1_41_1mV = pxi_to_frd(data_dir_ear3+"f531.txt",names, units,higain);
G1_41_500uV = pxi_to_frd(data_dir_ear3+"f699.txt",names, units,higain);
G1_41_100uV = pxi_to_frd(data_dir_ear3+"f615.txt",names, units,higain);

G3_41 = pxi_to_frd(data_dir_ear3+"f1089.txt",names, units,higain);
G3_41_100mV = G3_41;
G3_41_50mV = pxi_to_frd(data_dir_ear3+"f1173.txt",names, units,higain);
G3_41_10mV = pxi_to_frd(data_dir_ear3+"f1257.txt",names, units,higain);
G3_41_5mV = pxi_to_frd(data_dir_ear3+"f1341.txt",names, units,higain);
G3_41_1mV = pxi_to_frd(data_dir_ear3+"f1425.txt",names, units,higain);
G3_41_500uV = pxi_to_frd(data_dir_ear3+"f1509.txt",names, units,higain);
G3_41_100uV = pxi_to_frd(data_dir_ear3+"f1593.txt",names, units,higain);

G4_41 = pxi_to_frd(data_dir_ear3+"f1677.txt",names, units,higain);
G4_41_50mV = pxi_to_frd(data_dir_ear3+"f1761.txt",names, units,higain);
G4_41_10mV = pxi_to_frd(data_dir_ear3+"f1845.txt",names, units,higain);
G4_41_5mV = pxi_to_frd(data_dir_ear3+"f2013.txt",names, units,higain);
G4_41_1mV = pxi_to_frd(data_dir_ear3+"f2097.txt",names, units,higain);
G4_41_500uV = pxi_to_frd(data_dir_ear3+"f2181.txt",names, units,higain);
G4_41_100uV = pxi_to_frd(data_dir_ear3+"f2265.txt",names, units,higain);


G5_41 = pxi_to_frd(data_dir_ear3+"f2517.txt",names, units,higain);

G6_41 = pxi_to_frd(data_dir_ear3+"f3036.txt",names, units,higain);

G7_41 = pxi_to_frd(data_dir_ear3+"f3708.txt",names, units,higain);

G8_41 = pxi_to_frd(data_dir_ear3+"f4296.txt",names, units,higain);

G9_41 = pxi_to_frd(data_dir_ear3+"f4976.txt",names, units,higain);

sG1 = [
    G1_41_100mV('cant').ResponseData(:)...
    G1_41_50mV('cant').ResponseData(:)...
    G1_41_10mV('cant').ResponseData(:)...
    G1_41_5mV('cant').ResponseData(:)...
    G1_41_1mV('cant').ResponseData(:)...
    G1_41_500uV('cant').ResponseData(:)...
    G1_41_100uV('cant').ResponseData(:)...
];

pG1 = [
    G1_41_100mV('probe').ResponseData(:)...
    G1_41_50mV('probe').ResponseData(:)...
    G1_41_10mV('probe').ResponseData(:)...
    G1_41_5mV('probe').ResponseData(:)...
    G1_41_1mV('probe').ResponseData(:)...
    G1_41_500uV('probe').ResponseData(:)...
    G1_41_100uV('probe').ResponseData(:)...
];

sG3 = [
    G3_41_100mV('cant').ResponseData(:)...
    G3_41_50mV('cant').ResponseData(:)...
    G3_41_10mV('cant').ResponseData(:)...
    G3_41_5mV('cant').ResponseData(:)...
    G3_41_1mV('cant').ResponseData(:)...
    G3_41_500uV('cant').ResponseData(:)...
    G3_41_100uV('cant').ResponseData(:)...
];

pG3 = [
    G3_41_100mV('probe').ResponseData(:)...
    G3_41_50mV('probe').ResponseData(:)...
    G3_41_10mV('probe').ResponseData(:)...
    G3_41_5mV('probe').ResponseData(:)...
    G3_41_1mV('probe').ResponseData(:)...
    G3_41_500uV('probe').ResponseData(:)...
    G3_41_100uV('probe').ResponseData(:)...
];

sG4 = [
    G4_41('cant').ResponseData(:)...
    G4_41_50mV('cant').ResponseData(:)...
    G4_41_10mV('cant').ResponseData(:)...
    G4_41_5mV('cant').ResponseData(:)...
    G4_41_1mV('cant').ResponseData(:)...
    G4_41_500uV('cant').ResponseData(:)...
    G4_41_100uV('cant').ResponseData(:)...
];

pG4 = [
    G4_41('probe').ResponseData(:)...
    G4_41_50mV('probe').ResponseData(:)...
    G4_41_10mV('probe').ResponseData(:)...
    G4_41_5mV('probe').ResponseData(:)...
    G4_41_1mV('probe').ResponseData(:)...
    G4_41_500uV('probe').ResponseData(:)...
    G4_41_100uV('probe').ResponseData(:)...
];

%%
% Ear 4
data_dir_ear4 = "data/ear4/";

umbo_velocity_43 = pxi_to_frd(data_dir_ear4+"f336.txt",names, units,higain);

G9_43 = pxi_to_frd(data_dir_ear4+"f433.txt",names, units,higain);

G8_43 = pxi_to_frd(data_dir_ear4+"f517.txt",names, units,higain);

G7_43 = pxi_to_frd(data_dir_ear4+"f685.txt",names, units,higain);

G6_43 = pxi_to_frd(data_dir_ear4+"f853.txt",names, units,higain);

G5_43 = pxi_to_frd(data_dir_ear4+"f937.txt",names, units,higain);

G4_43 = pxi_to_frd(data_dir_ear4+"f1055.txt",names, units,higain);

G3_43 = pxi_to_frd(data_dir_ear4+"f1223.txt",names, units,higain);

G3_43_80 = pxi_to_frd(data_dir_ear4+"f1307.txt",names, units,higain);

G1_43 = pxi_to_frd(data_dir_ear4+"f1979.txt",names, units,higain);

nf_43 = pxi_wvf_noise(data_dir_ear4+'f2233wvf.txt',0,10) / tfs.higain;

nf_43_oct = third_octave_normalize(nf_43);

%%
% Ear 5
data_dir_ear5 = "data/ear5/";

umbo_velocity_45 = pxi_to_frd(data_dir_ear5+"f84.txt",names, units,higain);

G9_45 = pxi_to_frd(data_dir_ear5+"f1344.txt",names, units,higain);

G8_45 = pxi_to_frd(data_dir_ear5+"f1092.txt",names, units,higain);

G7_45 = pxi_to_frd(data_dir_ear5+"f924.txt",names, units,higain);

G6_45 = pxi_to_frd(data_dir_ear5+"f840.txt",names, units,higain);

G5_45 = pxi_to_frd(data_dir_ear5+"f756.txt",names, units,higain);

G4_45 = pxi_to_frd(data_dir_ear5+"f672.txt",names, units,higain);

G3_45 = pxi_to_frd(data_dir_ear5+"f252.txt",names, units,higain);

G1_45 = pxi_to_frd(data_dir_ear5+"f168.txt",names, units,higain);

nf_45 = pxi_wvf_noise(data_dir_ear5+'f1429wvf.txt',0,10) / tfs.higain;

nf_45_oct = third_octave_normalize(nf_45);

%%
% Bench Testing
data_dir_bench1 = "data/bench1/";
data_dir_bench2 = "data/bench2/";

B9_bench = pxi_to_frd(data_dir_bench1+"f84.txt",names, units,higain);

G1_bench = pxi_to_frd(data_dir_bench1+"f504.txt",names, units,higain);
G3_bench = pxi_to_frd(data_dir_bench1+"f672.txt",names, units,higain);
G4_bench = pxi_to_frd(data_dir_bench1+"f756.txt",names, units,higain);
G5_bench = pxi_to_frd(data_dir_bench1+"f840.txt",names, units,higain);
G6_bench = pxi_to_frd(data_dir_bench2+"f402.txt",names, units,higain);
G7_bench = pxi_to_frd(data_dir_bench2+"f654.txt",names, units,higain);
G8_bench = pxi_to_frd(data_dir_bench2+"f570.txt",names, units,higain);
G9_bench = pxi_to_frd(data_dir_bench2+"f822.txt",names, units,higain);

B9_ew38_bench = pxi_to_frd(data_dir_bench2+"f318.txt",names, units,higain);

%%
% Umbo Loading

tfs = load('common_tfs_new.mat').tfs;
higain = {1/(10*tfs.cal_10_31_25), 1/tfs.higain, 0.002, 1};

data_dir_loading = 'data/umbo_loading/';

umbo_velocity_loading = pxi_to_frd(data_dir_loading+"f505.txt",names, units,higain);
load1 = pxi_to_frd(data_dir_loading+"f589.txt",names, units,higain);
load2 = pxi_to_frd(data_dir_loading+"f673.txt",names, units,higain);
load3 = pxi_to_frd(data_dir_loading+"f757.txt",names, units,higain);
load4 = pxi_to_frd(data_dir_loading+"f841.txt",names, units,higain);
load5 = pxi_to_frd(data_dir_loading+"f925.txt",names, units,higain);


%%
function f = third_octave_normalize(f)

scaling = sqrt((2^(1/6) - 2^(-1/6)) .* f.Frequency);
f = frd(scaling.*f.ResponseData(:), f.Frequency, 'FrequencyUnit', 'Hz');

end


