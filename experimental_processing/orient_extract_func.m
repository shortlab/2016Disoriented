function [saw_velocity,velocity_error,angles]=orient_extract_func(select)

%Selection choices include, as strings,
%Al_111_2
%Al_111_3
%Al_111_4
%Al_111_5
%Al_111_6
%Al_111_7
%Al_111_8
%Al_100_2
%Al_100_3
%Al_100_4
%Al_100_5
%Al_100_6
%Al_100_7
%Al_100_8
%Cu_111_1
%Cu_111_2
%Cu_100_0

plotty=1;
two_peak=0;

%Base directiory will need to be updated
dir_base='/Users/Cody/Documents/MIT/Short_Lab/LSAW/Measurements/080_Data/LSAW/';


sigma_W_freq_std=1.5e5;

cR_w=2665.88;

%Data used in publication provided in /experiment_raw_data/

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
elseif strcmp(select,'Al_100_6')
    cd(strcat(dir_base,'Al_Orientation/SC_100_6/'));
    rng=45;
    inc=5;
    W_cal_peak=552.09e6;
    sigma_W_cal_peak=7e4;
    num=3;
    str_base='Al_Orientation-SC_100_6-04.80um-';
elseif strcmp(select,'Al_100_7')
    cd(strcat(dir_base,'Al_Orientation/SC_100_7/'));
    rng=45;
    inc=5;
    W_cal_peak=552.09e6;
    sigma_W_cal_peak=7e4;
    num=3;
    str_base='Al_Orientation-SC_100_7-04.80um-';
elseif strcmp(select,'Al_100_8');
    cd(strcat(dir_base,'Al_Orientation/SC_100_8/'));
    rng=90;
    inc=5;
    W_cal_peak=553.45e6;
    sigma_W_cal_peak=5.2e4;
    num=3;
    str_base='Al_Orientation-SC_100_8-04.80um-';
elseif strcmp(select,'Cu_111_1');
    cd(strcat(dir_base,'Cu_Orientation/SC_111_1/'));
    rng=45;
    inc=5;
    W_cal_peak=552.20e6;
    sigma_W_cal_peak=8.3e4;
    num=3;
    str_base='Cu_Orientation-SC_111_1-04.80um-';
    two_peak=1;
elseif strcmp(select,'Cu_111_2');
    cd(strcat(dir_base,'Cu_Orientation/SC_111_2/'));
    rng=60;
    inc=5;
    W_cal_peak=551.93e6;
    sigma_W_cal_peak=6.8e4;
    num=3;
    str_base='Cu_Orientation-SC_111_2-04.80um-';
    two_peak=1;
elseif strcmp(select,'Cu_100_0');
    cd(strcat(dir_base,'Cu_Orientation/SC_100_0/'));
    rng=90;
    inc=5;
    W_cal_peak=552.13e6;
    sigma_W_cal_peak=1.1e5;
    num=3;
    str_base='Cu_Orientation-SC_100_0-04.80um-';
    two_peak=0;
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
    %sigma_W_grat=(cR_w/W_cal_peak^2)*sigma_W_freq;
    
    sigma_cR_W=0.001*cR_w;
    sigma_W_grat=sqrt(((cR_w/W_cal_peak^2)*sigma_W_freq)^2+sigma_cR_W^2/(W_cal_peak^2));
end

grat_units=grat*10^-6;

ang_select=0:inc:rng;
number_meas=rng/inc+1;
freq=zeros(1,number_meas);
therm=zeros(1,number_meas);
freq_fit_error=zeros(2,number_meas);
cR_err=zeros(1,number_meas);

if two_peak
    freq2=zeros(1,number_meas);
    freq_fit_error2=zeros(2,number_meas);
    cR_err2=zeros(1,number_meas);
end

for j=1:number_meas
    if ang_select(j)<10
        pos_str=strcat(str_base,'0',num2str(ang_select(j)),'_deg-POS-1.txt');
        neg_str=strcat(str_base,'0',num2str(ang_select(j)),'_deg-NEG-1.txt');
    else
        pos_str=strcat(str_base,num2str(ang_select(j)),'_deg-POS-1.txt');
        neg_str=strcat(str_base,num2str(ang_select(j)),'_deg-NEG-1.txt');
    end
    if two_peak
        [freq_t,therm(j),freq_fit_error_t]=param_extract(num,pos_str,neg_str,grat,two_peak);
        freq(j)=freq_t(1);
        freq2(j)=freq_t(2);
        freq_fit_error(:,j)=freq_fit_error_t(:,:,1);
        freq_fit_error2(:,j)=freq_fit_error_t(:,:,2);
    else
        [freq(j),therm(j),freq_fit_error(:,j)]=param_extract(num,pos_str,neg_str,grat);
    end
end

% display(therm)

for k=1:length(freq)
    sigma_freq_fit=(freq_fit_error(1,k)+freq_fit_error(2,k))/2;
    % Add contribution of systematic uncertainty to actual measurement too
    sigma_freq_fit=sqrt(sigma_freq_fit^2+sigma_W_freq_std^2); 
    cR_err(k)=sqrt(sigma_freq_fit^2*grat_units^2+sigma_W_grat^2*freq(k)^2);
    if two_peak
        sigma_freq_fit2=(freq_fit_error2(1,k)+freq_fit_error2(2,k))/2;
        % Add contribution of systematic uncertainty to actual measurement too
        sigma_freq_fit2=sqrt(sigma_freq_fit2^2+sigma_W_freq_std^2);
        cR_err2(k)=sqrt(sigma_freq_fit2^2*grat_units^2+sigma_W_grat^2*freq2(k)^2);
    end
end

%Specific case of Cu_111_1 where we need to kill off some of the PSAW once
%it gets too small to detect. This is true for everything 35 degrees above
%in this case
if strcmp(select,'Cu_111_1');
    freq2(end-2:end)=freq(end-2:end);
    freq=freq(1:end-3);
    cR_err2(end-2:end)=cR_err(end-2:end);
    cR_err=cR_err(1:end-3);
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
    errorbarxy(ang_select(1:length(freq)),freq*grat_units,ang_err(1:length(freq)),cR_err,{'b-','r','r'});
    hold on
    plot(ang_select(1:length(freq)),freq*grat_units,'k.','MarkerSize',7);
    if two_peak
        hold on
        errorbarxy(ang_select(1:length(freq2)),freq2*grat_units,ang_err(1:length(freq2)),cR_err2,{'g-','r','r'});
        hold on
        plot(ang_select(1:length(freq2)),freq2*grat_units,'k.','MarkerSize',7);
    end
    xlim([-1 rng+1]);
    title(strcat('SAW Velocity vs. Relative Orientation ',select));
    ylabel('SAW Velocity (m/s)');
    xlabel('Relative Orientation (deg)');
    
%     figure()
%     plot(ang_select,therm,'g-',ang_select,therm,'k*');
%     title('Thermal Diffusivity vs. Relative Orientation');
%     ylabel('Thermal Diffusivity (m^2/s)');
%     xlabel('Relative Orientation (deg)');
end

if two_peak
    saw_velocity=[freq*grat_units; freq2*grat_units];
    velocity_error=[cR_err; cR_err2];
else
    saw_velocity=freq*grat_units;
    velocity_error=cR_err;
end
angles=ang_select;
%angles=freq2*grat_units;

end