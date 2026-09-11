function f = third_octave_normalize(f)

scaling = sqrt((2^(1/6) - 2^(-1/6)) .* f.Frequency);
f = frd(scaling.*f.ResponseData(:), f.Frequency, 'FrequencyUnit', 'Hz');

end