%Second version of the vacancy vs speed data analysis

%Note that the hardcoded directory for the location of the .mat file will need to be updated
cd('/Users/cody/Documents/MIT/Short_Lab/Publications:Meetings/TG_Al_Orientation/simulation_output_2016-08/Inputs_Fig5_vacancy/');

load('fig5_data.mat');

mats={'Al','Cu'};
Xvs_str={'1e4','2e4','5e4','1e3','2e3','5e3','1e2'};

Xvs=[10^-4 2*10^-4 5*10^-4 1*10^-3 2*10^-3 5*10^-3 1*10^-2];
Al_means=zeros(1,length(Xvs));
Al_errs=zeros(1,length(Xvs));
Cu_means=zeros(1,length(Xvs));
Cu_errs=zeros(1,length(Xvs));

for ii=1:length(mats)
    for jj=1:length(Xvs)
        temp_store=zeros(1,10);
        for kk=1:10
            if ii==1 && jj==4 && kk==4
                temp_store(kk)=0;
            elseif ii==1 && jj==7 && kk==2
                temp_store(kk)=0;
            elseif ii==1 && jj==5 && (kk==2 || kk==4)
                temp_store(kk)=0;
            elseif ii==2 && jj==1 && kk==10
                temp_store(kk)=0;
            elseif ii==2 && jj==6 && kk==3
                temp_store(kk)=0;
            elseif ii==2 && jj==3 && kk==3
                temp_store(kk)=0;
            elseif ii==2 && jj==5 && kk==10
                temp_store(kk)=0;
            else
                temp_store(kk)=simulation_process(eval(strcat(mats{ii},'_',Xvs_str{jj},'_',num2str(kk))));
            end
        end
        if ii==1
            if jj==4
                Al_means(jj)=mean([temp_store(1:3) temp_store(5:10)]);
                Al_errs(jj)=std([temp_store(1:3) temp_store(5:10)]);
            elseif jj==2
                Al_means(jj)=mean([temp_store(1) temp_store(4:10)]);
                Al_errs(jj)=std([temp_store(1) temp_store(4:10)]);
            elseif jj==5
                Al_means(jj)=mean([temp_store(1) temp_store(3) temp_store(5:10)]);
                Al_errs(jj)=std([temp_store(1) temp_store(3) temp_store(5:10)]);
            elseif jj==7
                Al_means(jj)=mean([temp_store(1) temp_store(3:10)]);
                Al_errs(jj)=std([temp_store(1) temp_store(3:10)]);
            else
                Al_means(jj)=mean(temp_store);
                Al_errs(jj)=std(temp_store);
            end
        else
            if jj==1
                Cu_means(jj)=mean(temp_store(1:9));
                Cu_errs(jj)=std(temp_store(1:9));
            elseif jj==3
                Cu_means(jj)=mean([temp_store(1:2) temp_store(4:10)]);
                Cu_errs(jj)=std([temp_store(1:2) temp_store(4:10)]);
            elseif jj==5
                Cu_means(jj)=mean(temp_store(1:9));
                Cu_errs(jj)=std(temp_store(1:9));
            elseif jj==6
                Cu_means(jj)=mean([temp_store(1:2) temp_store(4:10)]); %try losing case 2 even though it works
                Cu_errs(jj)=std([temp_store(1:2) temp_store(4:10)]);
            else
                Cu_means(jj)=mean(temp_store);
                Cu_errs(jj)=std(temp_store);
            end
        end
        close all
    end
end

Al_v0=2868; %from the fig3 data
Cu_v0=1970; %from the fig3 data

% Al_v0=Al_means(1);
% Cu_v0=Cu_means(1);

figure()
errorbar(Xvs,Cu_means/Cu_v0,Cu_errs/Cu_v0,'^b-','MarkerSize',10,'MarkerFaceColor','b')
hold on
errorbar(Xvs,Al_means/Al_v0,Al_errs/Al_v0,'vr-','MarkerSize',10,'MarkerFaceColor','r')
set(gca,'xscale','log')
hold on
xlim([7.5e-5 1.5e-2]);
hold on
set(gca,...
'FontUnits','points',...
'FontSize',16,...
'FontName','Times')
ylabel({'Normalized speed ($c/c_0$)'},...
'FontUnits','points',...
'interpreter','latex',...
'FontWeight','bold',...
'FontSize',20,...
'FontName','Times')
xlabel({'Vacancy fraction ($X_v$)'},...
'FontUnits','points',...
'interpreter','latex',...
'FontWeight','bold',...
'FontSize',20,...
'FontName','Times')