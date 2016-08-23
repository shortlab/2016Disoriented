%Script will produce slowness surfaces with overlain experimental data for
%the aluminum surfaces inclusive of errorbars.

%Hard coded directory will need to be updated for locations of slowness surface calculation output
cd('/Users/Cody/Documents/MIT/Short_Lab/LSAW/A_Every_Code/EveryFixed/');
%     slowness111=dlmread('Al_quarter_111_new.txt');
slowness111=dlmread('Al_quarter_111_055.txt');
[speed111,speed_err111,angles111]=orient_extract_func('Al_111_8');
phase_adj111=37.5; %Figure this out by eye
angles111=angles111+phase_adj111;
for i=1:length(angles111)
    if angles111(i)>90
        angles111(i)=angles111(i)-(60);
    end
end

md_saw_speed111=[2762 2740];
md_saw_angles111=[0 30];

cd('/Users/Cody/Documents/MIT/Short_Lab/LSAW/A_Every_Code/EveryFixed/');
%     slowness100=dlmread('Al_quarter_100_new.txt');
slowness100=dlmread('Al_quarter_100_055.txt');
[speed100,speed_err100,angles100]=orient_extract_func('Al_100_8'); % This will be changed once we have new data
phase_adj100=75; %Figure this out by eye
angles100=angles100+phase_adj100;
for i=1:length(angles100)
    if angles100(i)>90
        angles100(i)=angles100(i)-(90);
    end
end

md_saw_speed100=[2868 2833];
md_saw_angles100=[0 45];


slow111=(1./speed111)*1000;
slow_x111=slow111.*sin(deg2rad(angles111));
slow_y111=slow111.*cos(deg2rad(angles111));

slow100=(1./speed100)*1000;
slow_x100=slow100.*sin(deg2rad(angles100));
slow_y100=slow100.*cos(deg2rad(angles100));

slow_err111=(speed_err111./(speed111.^2))*1000;
slow_err_min111=slow111-slow_err111/2;
slow_err_max111=slow111+slow_err111/2;

slow_err100=(speed_err100./(speed100.^2))*1000;
slow_err_min100=slow100-slow_err100/2;
slow_err_max100=slow100+slow_err100/2;

slow_err_x111=[slow_err_min111.*sin(deg2rad(angles111)); slow_err_max111.*sin(deg2rad(angles111))];
slow_err_y111=[slow_err_min111.*cos(deg2rad(angles111)); slow_err_max111.*cos(deg2rad(angles111))];

slow_err_x100=[slow_err_min100.*sin(deg2rad(angles100)); slow_err_max100.*sin(deg2rad(angles100))];
slow_err_y100=[slow_err_min100.*cos(deg2rad(angles100)); slow_err_max100.*cos(deg2rad(angles100))];

md_saw_slow111=(1./md_saw_speed111)*1000;
md_saw_slow_x111=md_saw_slow111.*sin(deg2rad(md_saw_angles111));
md_saw_slow_y111=md_saw_slow111.*cos(deg2rad(md_saw_angles111));

md_saw_slow100=(1./md_saw_speed100)*1000;
md_saw_slow_x100=md_saw_slow100.*sin(deg2rad(md_saw_angles100));
md_saw_slow_y100=md_saw_slow100.*cos(deg2rad(md_saw_angles100));

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

limit=0.55;
delta_s=limit/900;
min_s=0.5*delta_s;
max_s=(900-0.5)*delta_s;

h1=figure('Position',[100,100,600,600]);
% contourf(min_s:delta_s:max_s,min_s:delta_s:max_s,slowness111,100,'EdgeColor','none');
contourf(min_s:delta_s:max_s,min_s:delta_s:max_s,stitched,100,'EdgeColor','none');
hold on
colormap(gray)
hold on
plot(slow_x100,slow_y100,'gs','MarkerFaceColor','g','MarkerSize',8);
hold on
% for j=1:length(slow_x);
%     plot(slow_err_x(:,j),slow_err_y(:,j),'r-');
%     hold on
% end
plot(md_saw_slow_x100,md_saw_slow_y100,'bd','MarkerFaceColor','b','MarkerSize',10);
hold on
xlim([0 limit]);
ylim([0 limit]);
plot([0 limit],[limit 0],'k-');
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
plot(slow_x111,slow_y111,'gs','MarkerFaceColor','g','MarkerSize',8);
hold on
plot(md_saw_slow_x111,md_saw_slow_y111,'bd','MarkerFaceColor','b','MarkerSize',10);
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

