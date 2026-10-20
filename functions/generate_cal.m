function cal = generate_cal(path, names, scale, degree)
% calibration names MUST contain mic and ref to refer to the microphone
% being calibrated and the reference microphone, respectively

cal = pxi_to_frd(path, names);
cal = fitfrd(scale*cal('mic') / cal('ref'), degree);

cal.InputUnit = {'Pa'};
cal.OutputUnit = {'V'};

end