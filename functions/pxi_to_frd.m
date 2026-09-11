function f = pxi_to_frd(path, names, varargin)
% pxi_to_frd(pxi_path, names, [units, [scale]])
% names, units, scale should be cell arrays
% scale factors should be scalars or frequency responses

p = inputParser;
addRequired(p, 'path', @(x) ischar(x) | isstring(x))
addRequired(p, 'names', @iscell);
addOptional(p, 'units', 'V', @iscell);
addOptional(p, 'scale', 1, @iscell);
parse(p, path, names, varargin{:});
args = p.Results;

args.names = args.names(:);
channels = length(args.names);

if ~iscell(p.Results.units)
    args.units = cell(channels, 1);
    args.units(:) = num2cell(p.Results.units);
end

if ~iscell(p.Results.scale)
    args.scale = cell(channels, 1);
    args.scale(:) = num2cell(p.Results.scale);
end

args.units = args.units(:);
if length(args.units) ~= channels
    error('Names and units input size must match!')
end

args.scale = args.scale(:);
if length(args.scale) ~= channels
    error('Names and scale input size must match!')
end

pxi_raw = rmmissing(readtable(args.path));
frd_raw = zeros(channels, 1, length(pxi_raw.x_Freq_Hz_));

for ch = 1:channels
    arg_mag = "Ch"+(ch-1)+"Mag_dB_";
    arg_phase = "Ch"+(ch-1)+"Phase_cyc_";
    frd_raw(ch, 1, :) = 10.^(pxi_raw.(arg_mag)./20).*exp(2j*pi*pxi_raw.(arg_phase));
end

f = frd(frd_raw, pxi_raw.x_Freq_Hz_, 'FrequencyUnit', 'Hz',...
    'OutputName', args.names, 'OutputUnit', args.units);

for ch = 1:channels
    f(ch) = f(ch) * args.scale{ch};
end

end