function [speed]=simulation_process(dat_cell)
%Input is a cell with the following format:
% 1 - material (str)
% 2 - L_x in nm (num)
% 3 - surface orientation (str)
% 4 - surface direction (str)
% 5 - directory path (str)
% 6 - input file name (str)
% 7 - data start line (num)
% 8 - vacancy fraction (num)

cd(dat_cell{5})
lambda=dat_cell{2}*10^-9;
pk_freq=simulation_fft(dat_cell{6},dat_cell{7});

speed=lambda*pk_freq;

end