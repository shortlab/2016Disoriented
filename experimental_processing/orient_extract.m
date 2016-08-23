% Orientation Parameter Extract Matlab Script

plotty=1;
select='Al_100_5';
dir_base='/Users/Cody/Documents/MIT/Short_Lab/LSAW/Measurements/080_Data/LSAW/';

% sigma_W_freq_std=4.3908e5;
sigma_W_freq_std=1e6;
%sigma_W_freq_std=2.7460e5;
% sigma_W_freq_std=9.48e5; %From data on 2015-10-16
cR_w=2665.88;

if strcmp(select,'Al_111_2')
    cd(strcat(dir_base,'Al_Orientation/SC_111_2/'));
    rng=120;
    inc=10;
    W_cal_peak=480.87e6;
    sigma_W_cal_peak=4e4;
    num=3;
    str_base='Al_Orientation-SC_111_2-05.50um-'; 
elseif strcmp(select,'Al_111_3')
    cd(strcat(dir_base,'Al_Orientation/SC_111_3/'));
    rng=120;
    inc=10;
    W_cal_peak=486.71e6;
    sigma_W_cal_peak=4e4;
    num=3;
    str_base='Al_Orientation-SC_111_3-05.50um-';
elseif strcmp(select,'Al_111_4')
    cd(strcat(dir_base,'Al_Orientation/SC_111_4/'));
    rng=120;
    inc=10;
    W_cal_peak=484.83e6;
    sigma_W_cal_peak=4e4;
    num=3;
    str_base='Al_Orientation-SC_111_4-05.50um-';
elseif strcmp(select,'Al_100_2')
    cd(strcat(dir_base,'Al_Orientation/SC_100_2/'));
    rng=180;
    inc=10;
    W_cal_peak=488.08e6;
    sigma_W_cal_peak=4e4;
    num=3;
    str_base='Al_Orientation-SC_100_2-05.50um-';
elseif strcmp(select,'Al_100_3')
    cd(strcat(dir_base,'Al_Orientation/SC_100_3/'));
    rng=180;
    inc=10;
    W_cal_peak=487.40e6;
    sigma_W_cal_peak=3e4;
    num=3;
    str_base='Al_Orientation-SC_100_3-05.50um-';
elseif strcmp(select,'Al_100_4')
    cd(strcat(dir_base,'Al_Orientation/SC_100_4/'));
    rng=180;
    inc=10;
    W_cal_peak=485.95e6;
    sigma_W_cal_peak=3e4;
    num=3;
    str_base='Al_Orientation-SC_100_4-05.50um-';
%Start here with including new data in October 2015
elseif strcmp(select,'Al_111_5')
    cd(strcat(dir_base,'Al_Orientation/SC_111_5/'));
    rng=30;
    inc=5;
    W_cal_peak=552.97e6; %made this one up
    sigma_W_cal_peak=1.9e4;
    num=3;
    str_base='Al_Orientation-SC_111_5-04.80um-';
elseif strcmp(select,'Al_111_6')
    cd(strcat(dir_base,'Al_Orientation/SC_111_6/'));
    rng=30;
    inc=5;
    W_cal_peak=552.79e6; %from calibration spot 1
    sigma_W_cal_peak=4e4;
    num=3;
    str_base='Al_Orientation-SC_111_6-04.80um-';
elseif strcmp(select,'Al_111_7')
    cd(strcat(dir_base,'Al_Orientation/SC_111_7/'));
    rng=30;
    inc=5;
    W_cal_peak=553.52e6;
    sigma_W_cal_peak=3e4;
    num=3;
    str_base='Al_Orientation-SC_111_7-04.80um-';
elseif strcmp(select,'Al_111_8')
    cd(strcat(dir_base,'Al_Orientation/SC_111_8/'));
    rng=60;
    inc=5;
    W_cal_peak=553.48e6;
    sigma_W_cal_peak=5e4;
    num=3;
    str_base='Al_Orientation-SC_111_8-04.80um-';
elseif strcmp(select,'Al_100_5')
    cd(strcat(dir_base,'Al_Orientation/SC_100_5/'));
    rng=45;
    inc=5;
    W_cal_peak=553.15e6;
    sigma_W_cal_peak=3.5e4;
    num=3;
    str_base='Al_Orientation-SC_100_5-04.80um-';
else
    cd(strcat(dir_base,'W_Orientation/SC_100_0/'));
    rng=180;
    inc=10;
    W_cal_peak=0;
    sigma_W_cal_peak=2e4;
    num=3;
    str_base='W_Orientation-SC_100_0-05.50um-';
end

if W_cal_peak==0
    grat=5.50;
    sigma_W_grat=0;
else
    grat=(cR_w/W_cal_peak)*10^6;
    sigma_W_freq=sqrt(sigma_W_freq_std^2+sigma_W_cal_peak^2);
    sigma_W_grat=(cR_w/W_cal_peak^2)*sigma_W_freq;
end

grat_units=grat*10^-6;

% rng=180;    % End relative orientation
% inc=10;     % Degree increment
% grat=5.50;  % Grating Spacing used
% num=3;      % Number of batches for each measurement
% str_base='W_Orientation-SC_100_0-05.50um-'; % String identifier of the round of measureents to be analyzed

ang_select=0:inc:rng;
number_meas=rng/inc+1;
freq=zeros(1,number_meas);
therm=zeros(1,number_meas);
freq_fit_error=zeros(2,number_meas);

for j=1:number_meas
    if ang_select(j)<10
        pos_str=strcat(str_base,'0',num2str(ang_select(j)),'_deg-POS-1.txt');
        neg_str=strcat(str_base,'0',num2str(ang_select(j)),'_deg-NEG-1.txt');
    else
        pos_str=strcat(str_base,num2str(ang_select(j)),'_deg-POS-1.txt');
        neg_str=strcat(str_base,num2str(ang_select(j)),'_deg-NEG-1.txt');
    end
    [freq(j),therm(j),freq_fit_error(:,j)]=param_extract(num,pos_str,neg_str,grat);
end

cR_err=zeros(1,number_meas);
for k=1:length(freq)
    sigma_freq_fit=(freq_fit_error(1,k)+freq_fit_error(2,k))/2;
    cR_err(k)=sqrt(sigma_freq_fit^2*grat_units^2+sigma_W_grat^2*freq(k)^2);
end

ang_err=zeros(1,length(ang_select));
ang_err(:)=1;

if plotty
%     figure()
%     plot(ang_select,freq,'m-',ang_select,freq,'k*');
%     title('Peak Frequency vs. Relative Orientation');
%     ylabel('Peak Frequency (Hz)');
%     xlabel('Relative Orientation (deg)');
    
    figure()
    errorbarxy(ang_select,freq*grat_units,ang_err,cR_err,{'b-','r','r'});
    hold on
    plot(ang_select,freq*grat_units,'k.','MarkerSize',7);
    xlim([-1 rng+1]);
    title('SAW Velocity vs. Relative Orientation SC\_Al\_111\_8');
    ylabel('SAW Velocity (m/s)');
    xlabel('Relative Orientation (deg)');
    
%     figure()
%     plot(ang_select,therm,'g-',ang_select,therm,'k*');
%     title('Thermal Diffusivity vs. Relative Orientation');
%     ylabel('Thermal Diffusivity (m^2/s)');
%     xlabel('Relative Orientation (deg)');
end