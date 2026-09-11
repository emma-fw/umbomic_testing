function loglog_pxi_frd(runs, fns, varargin)

if ~iscell(runs)
    runs = {runs};
end

if ~iscell(fns)
    fns = {fns};
end

for i = 1:length(runs)
    run = runs{i};
    for j = 1:length(fns)
        fn = fns{j};
        if nargin > 2
            run_scaled = run*varargin{1};
            loglog(run_scaled.Frequency, abs(run_scaled(fn).ResponseData(:)), varargin{2:end})
        else
            loglog(run.Frequency, abs(run(fn).ResponseData(:)));
        end
        hold on
    end
end
grid on
% xlabel('Frequency [Hz]')

end