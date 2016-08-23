function [freq_peak]=simulation_fft(file,st_line)
%Function used to process the MD simulated TG traces. Primarily those given
%to Cody on 08/03/16 from Mike. File is the string name of the output file
%to grab the data from, st_line is the line in that file at which to start
%grabbing data and fin_line is the ending line of data. Note that the
%columns of interest in these output files are COM1x[3] (column 9) and
%COM2x[3] (column 12). These correspond to the z position of the patch of
%atoms at the center and edge of the simulation, respectively. 

fin_line=st_line+10000;
raw_dat=dlmread(file,'',[st_line-1 0 fin_line-1 23]);

time_steps=raw_dat(:,1)-raw_dat(1,1);
COM_center_z=raw_dat(:,9)-raw_dat(1,9);
COM_edge_z=raw_dat(:,12)-raw_dat(1,12);
COM_all_z=raw_dat(:,24)-raw_dat(1,24);

true_time=time_steps*2*10^-15;
displace_fx=COM_center_z-COM_edge_z; %This one takes the plate modes out
% displace_fx=COM_center_z-COM_all_z; %This one leaves the plate modes in

record_length=length(displace_fx);
ave_num=floor(record_length*0.1);
displace_fx_norm=displace_fx-mean(displace_fx(end-ave_num:end));

% figure()
% plot(true_time,displace_fx_norm,'k-','LineWidth',1.10);
% hold on
% set(gca,...
% 'FontUnits','points',...
% 'FontWeight','normal',...
% 'FontSize',16,...
% 'FontName','Times',...
% 'LineWidth',1.25,...
% 'XTick',(0:0.2:2)*10^-9)

tstep=true_time(end)-true_time(end-1);
num=length(displace_fx_norm);
fs=num/(true_time(end)-true_time(1));
p=18;
pdsize=2^p-num-2;
pad_val=mean(displace_fx_norm(end-ave_num:end));
pad=zeros(pdsize,1);
pad(1:end)=pad_val;
% tpad=displace_fx_norm(end):tstep:displace_fx_norm(end)+(pdsize-1)*tstep;

sig_pad=[displace_fx_norm; pad];
% time_pad=[true_time; tpad'];

nfft=length(sig_pad);
[psd,freq]=periodogram(sig_pad,rectwin(nfft),nfft,fs);

amp=sqrt(psd);
keep_index=floor(length(amp)*0.08);
fft=[freq(1:keep_index) amp(1:keep_index)]; %discard the high frequency stuff

% figure()
% plot(fft(:,1),fft(:,2),'k-','LineWidth',1.25)
% hold on
% set(gca,...
% 'FontUnits','points',...
% 'FontWeight','normal',...
% 'FontSize',16,...
% 'FontName','Times',...
% 'LineWidth',1.25,...
% 'XTick',(0:0.4:2)*10^11)

% [peak,errs,ft]=fit_spectra_peaks_interact(fft,0);
[peak,errs,ft]=fit_spectra_peaks(fft,0);
freq_peak=peak;

end