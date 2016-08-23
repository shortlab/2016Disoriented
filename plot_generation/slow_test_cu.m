%Script will produce slowness surfaces with overlain experimental data for
%the copper surfaces inclusive of errorbars.

%Must hard-input the data from the copper traces to handle the two-mode
%response at different angles for each trace.

%Hard coded directory will need to be updated for locations of slowness surface calculation output
cd('/Users/Cody/Documents/MIT/Short_Lab/LSAW/A_Every_Code/EveryFixed/');

%111 data input on 2015/12/29 from output of orient_extract_func sorted for
%SAWs and PSAWs

%     slowness=dlmread('Cu_quarter_111.txt');
slowness111=dlmread('Cu_quarter_111_090.txt');
saw_speed111=[1.7346 1.8170 1.9033 1.9402 1.9009 1.8117 1.7284 1.6534 1.6095 1.5941 1.6126 1.6640 1.7408]*10^3;
saw_angles111=0:5:60;
saw_err111=[0.9669 1.0044 1.0124 0.9964 0.9881 0.9622 0.9883 0.9604 0.9404 0.9946 0.9639 0.9865 0.9527];
psaw_speed111=[2.5391 2.4274 2.4208 2.5064 2.6082 2.6737 2.6980 2.6719 2.6070 2.5183]*10^3;
psaw_angles111=[0 5 25 30 35 40 45 50 55 60];
psaw_err111=[1.1569 1.3698 1.1343 1.2661 1.1454 1.1276 1.1142 1.1337 1.1094 1.2294];

phase_adj111=15.5; 

md_saw_speed111=[1719 2037];
md_saw_angles111=[0 30];

md_psaw_speed111=[2493];
md_psaw_angles111=[0];

%100 data input on 2015/12/28 from output of orient_extract_func sorted for
%SAWs and PSAWs

%     slowness=dlmread('Cu_quarter_100_new.txt');
slowness100=dlmread('Cu_quarter_100_090.txt');
saw_speed100=[2.0456 2.0324 2.0123 1.9959 1.9928 1.9965 2.0113 2.0353 2.0531 2.0269 2.0518]*10^3;
saw_angles100=[0 5 10 15 20 25 30 35 40 45 90];
saw_err100=[1.0328 1.0243 1.0162 1.0219 1.0018 1.0063 1.0053 1.0174 1.0201 1.0396 1.0133];
psaw_speed100=[2.2493 2.2368 2.2625 2.2947 2.3089 2.2985 2.2643 2.2364 2.2293]*10^3;
psaw_angles100=[45 50 55 60 65 70 75 80 85];
psaw_err100=[2.9211 1.0707 1.0703 1.0666 1.0893 1.0840 1.0962 1.0759 1.0866];

phase_adj100=69; %Figure this out by eye

% md_saw_speed100=[1980 2001];
% md_saw_angles100=[0 26.57];

md_saw_speed100=[1970 2014];
md_saw_angles100=[0 26.57];

% md_psaw_speed100=[2309];
% md_psaw_angles100=[45];

md_psaw_speed100=[2303 2241];
md_psaw_angles100=[45 26.57];

saw_angles111=saw_angles111+phase_adj111;
psaw_angles111=psaw_angles111+phase_adj111;

saw_angles100=saw_angles100+phase_adj100;
psaw_angles100=psaw_angles100+phase_adj100;

for i=1:length(saw_angles111)
    if saw_angles111(i)>90
        saw_angles111(i)=saw_angles111(i)-(90);
    end
end

for i=1:length(psaw_angles111)
    if psaw_angles111(i)>90
        psaw_angles111(i)=psaw_angles111(i)-(90);
    end
end

for i=1:length(saw_angles100)
    if saw_angles100(i)>90
        saw_angles100(i)=saw_angles100(i)-(90);
    end
end

for i=1:length(psaw_angles100)
    if psaw_angles100(i)>90
        psaw_angles100(i)=psaw_angles100(i)-(90);
    end
end

%SAW points for slowness surface
saw_slow111=(1./saw_speed111)*1000;
saw_slow_x111=saw_slow111.*sin(deg2rad(saw_angles111));
saw_slow_y111=saw_slow111.*cos(deg2rad(saw_angles111));

saw_slow100=(1./saw_speed100)*1000;
saw_slow_x100=saw_slow100.*sin(deg2rad(saw_angles100));
saw_slow_y100=saw_slow100.*cos(deg2rad(saw_angles100));

saw_slow_err111=(saw_err111./(saw_speed111.^2))*1000;
saw_slow_err_min111=saw_slow111-saw_slow_err111/2;
saw_slow_err_max111=saw_slow111+saw_slow_err111/2;

saw_slow_err100=(saw_err100./(saw_speed100.^2))*1000;
saw_slow_err_min100=saw_slow100-saw_slow_err100/2;
saw_slow_err_max100=saw_slow100+saw_slow_err100/2;

saw_slow_err_x111=[saw_slow_err_min111.*sin(deg2rad(saw_angles111)); saw_slow_err_max111.*sin(deg2rad(saw_angles111))];
saw_slow_err_y111=[saw_slow_err_min111.*cos(deg2rad(saw_angles111)); saw_slow_err_max111.*cos(deg2rad(saw_angles111))];

saw_slow_err_x100=[saw_slow_err_min100.*sin(deg2rad(saw_angles100)); saw_slow_err_max100.*sin(deg2rad(saw_angles100))];
saw_slow_err_y100=[saw_slow_err_min100.*cos(deg2rad(saw_angles100)); saw_slow_err_max100.*cos(deg2rad(saw_angles100))];

md_saw_slow111=(1./md_saw_speed111)*1000;
md_saw_slow_x111=md_saw_slow111.*sin(deg2rad(md_saw_angles111));
md_saw_slow_y111=md_saw_slow111.*cos(deg2rad(md_saw_angles111));

md_saw_slow100=(1./md_saw_speed100)*1000;
md_saw_slow_x100=md_saw_slow100.*sin(deg2rad(md_saw_angles100));
md_saw_slow_y100=md_saw_slow100.*cos(deg2rad(md_saw_angles100));

%PSAW points for slowness surface
psaw_slow111=(1./psaw_speed111)*1000;
psaw_slow_x111=psaw_slow111.*sin(deg2rad(psaw_angles111));
psaw_slow_y111=psaw_slow111.*cos(deg2rad(psaw_angles111));

psaw_slow100=(1./psaw_speed100)*1000;
psaw_slow_x100=psaw_slow100.*sin(deg2rad(psaw_angles100));
psaw_slow_y100=psaw_slow100.*cos(deg2rad(psaw_angles100));

psaw_slow_err111=(psaw_err111./(psaw_speed111.^2))*1000;
psaw_slow_err_min111=psaw_slow111-psaw_slow_err111/2;
psaw_slow_err_max111=psaw_slow111+psaw_slow_err111/2;

psaw_slow_err100=(psaw_err100./(psaw_speed100.^2))*1000;
psaw_slow_err_min100=psaw_slow100-psaw_slow_err100/2;
psaw_slow_err_max100=psaw_slow100+psaw_slow_err100/2;

psaw_slow_err_x111=[psaw_slow_err_min111.*sin(deg2rad(psaw_angles111)); psaw_slow_err_max111.*sin(deg2rad(psaw_angles111))];
psaw_slow_err_y111=[psaw_slow_err_min111.*cos(deg2rad(psaw_angles111)); psaw_slow_err_max111.*cos(deg2rad(psaw_angles111))];

psaw_slow_err_x100=[psaw_slow_err_min100.*sin(deg2rad(psaw_angles100)); psaw_slow_err_max100.*sin(deg2rad(psaw_angles100))];
psaw_slow_err_y100=[psaw_slow_err_min100.*cos(deg2rad(psaw_angles100)); psaw_slow_err_max100.*cos(deg2rad(psaw_angles100))];

md_psaw_slow111=(1./md_psaw_speed111)*1000;
md_psaw_slow_x111=md_psaw_slow111.*sin(deg2rad(md_psaw_angles111));
md_psaw_slow_y111=md_psaw_slow111.*cos(deg2rad(md_psaw_angles111));

md_psaw_slow100=(1./md_psaw_speed100)*1000;
md_psaw_slow_x100=md_psaw_slow100.*sin(deg2rad(md_psaw_angles100));
md_psaw_slow_y100=md_psaw_slow100.*cos(deg2rad(md_psaw_angles100));

[sx,sy]=size(slowness111);
stitched=zeros([sx,sy]);
for i=1:sx
    for j=1:sy
        if i<sy-j
            stitched(i,j)=slowness100(i,j);
        else
            stitched(i,j)=slowness111(sx-i+1,sy-j+1);
        end
    end
end



%Plotting
% delta_s=0.75/900;
limit=0.9;
delta_s=limit/900;
min_s=0.5*delta_s;
max_s=(900-0.5)*delta_s;

h1=figure('Position',[100,100,600,600]);
%contourf(0:0.75/899:0.75,0:0.75/899:0.75,slowness,100,'EdgeColor','none');
% contourf(min_s:delta_s:max_s,min_s:delta_s:max_s,slowness,100,'EdgeColor','none');
contourf(min_s:delta_s:max_s,min_s:delta_s:max_s,stitched,100,'EdgeColor','none');
hold on
colormap(gray)
hold on
plot(saw_slow_x100,saw_slow_y100,'gs','MarkerFaceColor','g','MarkerSize',8);
hold on
% for j=1:length(saw_slow_x);
%     plot(saw_slow_err_x(:,j),saw_slow_err_y(:,j),'r-');
%     hold on
% end
plot(psaw_slow_x100,psaw_slow_y100,'r^','MarkerFaceColor','r','MarkerSize',8);
hold on
plot(md_saw_slow_x100,md_saw_slow_y100,'bd','MarkerFaceColor','b','MarkerSize',10);
hold on
plot(md_psaw_slow_x100,md_psaw_slow_y100,'bd','MarkerFaceColor','b','MarkerSize',10);
xlim([0 limit]);
ylim([0 limit]);
plot([0 limit],[limit 0],'k-');
% set(gca,'XTickLabel','','YTickLabel','');
set(gca,'Box','off',...
'FontUnits','points',...
'FontWeight','normal',...
'FontSize',16,...
'FontName','Times',...
'LineWidth',1.25)
ylabel({'$s_2$ ($\mu$s/mm)'},...
'FontUnits','points',...
'interpreter','latex',...
'FontSize',20,...
'FontName','Times')
xlabel({'$s_1$ ($\mu$s/mm)'},...
'FontUnits','points',...
'interpreter','latex',...
'FontSize',20,...
'FontName','Times')

ax1=gca;
ax1_location=ax1.Position;
hold on
ax2=axes('Position',ax1_location,'XAxisLocation','top','YAxisLocation','right','Color','none');
xlim([0 limit]);
ylim([0 limit]);
hold on
plot(saw_slow_x111,saw_slow_y111,'gs','MarkerFaceColor','g','MarkerSize',8);
hold on
plot(psaw_slow_x111,psaw_slow_y111,'r^','MarkerFaceColor','r','MarkerSize',8);
hold on
plot(md_saw_slow_x111,md_saw_slow_y111,'bd','MarkerFaceColor','b','MarkerSize',10);
hold on
plot(md_psaw_slow_x111,md_psaw_slow_y111,'bd','MarkerFaceColor','b','MarkerSize',10);
hold on
set(gca,...
'FontUnits','points',...
'FontWeight','normal',...
'FontSize',16,...
'FontName','Times',...
'LineWidth',1.25)
ylabel({'$s_2$ ($\mu$s/mm)'},...
'FontUnits','points',...
'interpreter','latex',...
'FontSize',20,...
'FontName','Times')
xlabel({'$s_1$ ($\mu$s/mm)'},...
'FontUnits','points',...
'interpreter','latex',...
'FontSize',20,...
'FontName','Times')
view([180,90]);