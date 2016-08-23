%Simulation Data information
%Cell Structure with following fields, in order
% 1 - material
% 2 - L_x in nm
% 3 - surface orientation
% 4 - surface direction 
% 5 - directory path
% 6 - input file name
% 7 - data start line
% 8 - vacancy fraction

dir_base='/Users/cody/Documents/MIT/Short_Lab/Publications:Meetings/TG_Al_Orientation/simulation_output_2016-08/';

%Al {001}<100>
Al_001_100=cell(1,8);
Al_001_100{1}='Al';
Al_001_100{2}=42.156319;
Al_001_100{3}='001';
Al_001_100{4}='100';
Al_001_100{5}=strcat(dir_base,'Inputs_Fig3/Al_100surface_100direction/');
Al_001_100{6}='in.laser.o885813';
Al_001_100{7}=724;
Al_001_100{8}=0;

%Al {001}<110>
Al_001_110=cell(1,8);
Al_001_110{1}='Al';
Al_001_110{2}=42.308983;
Al_001_110{3}='001';
Al_001_110{4}='110';
Al_001_110{5}=strcat(dir_base,'Inputs_Fig3/Al_100surface_110direction/');
Al_001_110{6}='in.laser.o885814';
Al_001_110{7}=722;
Al_001_110{8}=0;

%Al {111}<1-10>
Al_111_110=cell(1,8);
Al_111_110{1}='Al';
Al_111_110{2}=50.178473;
Al_111_110{3}='111';
Al_111_110{4}='1-10';
Al_111_110{5}=strcat(dir_base,'Inputs_Fig3/Al_111surface_1-10direction/');
Al_111_110{6}='in.laser.o885815';
Al_111_110{7}=724;
Al_111_110{8}=0;

%Al {111}<11-2>
Al_111_112=cell(1,8);
Al_111_112{1}='Al';
Al_111_112{2}=47.474852;
Al_111_112{3}='111';
Al_111_112{4}='11-2';
Al_111_112{5}=strcat(dir_base,'Inputs_Fig3/Al_111surface_11-2direction/');
Al_111_112{6}='in.laser.o885816';
Al_111_112{7}=724;
Al_111_112{8}=0;

%Cu {001}<100>
Cu_001_100=cell(1,8);
Cu_001_100{1}='Cu';
Cu_001_100{2}=47.196234;
Cu_001_100{3}='001';
Cu_001_100{4}='100';
Cu_001_100{5}=strcat(dir_base,'Inputs_Fig3/Cu_100surface_100direction/');
Cu_001_100{6}='in.laser.o885817';
Cu_001_100{7}=727;
Cu_001_100{8}=0;

%Cu {001}<110>
Cu_001_110=cell(1,8);
Cu_001_110{1}='Cu';
Cu_001_110{2}=47.242344;
Cu_001_110{3}='001';
Cu_001_110{4}='110';
Cu_001_110{5}=strcat(dir_base,'Inputs_Fig3/Cu_100surface_110direction/');
Cu_001_110{6}='in.laser.o885818';
Cu_001_110{7}=725;
Cu_001_110{8}=0;

%Cu {001}<210>
Cu_001_210=cell(1,8);
Cu_001_210{1}='Cu';
Cu_001_210{2}=38.966481;
Cu_001_210{3}='001';
Cu_001_210{4}='210';
Cu_001_210{5}=strcat(dir_base,'Inputs_Fig3/Cu_100surface_210_direction/');
Cu_001_210{6}='in.laser.o885819';
Cu_001_210{7}=3386;
Cu_001_210{8}=0;

%Cu {111}<1-10>
Cu_111_110=cell(1,8);
Cu_111_110{1}='Cu';
Cu_111_110{2}=46.101254;
Cu_111_110{3}='111';
Cu_111_110{4}='1-10';
Cu_111_110{5}=strcat(dir_base,'Inputs_Fig3/Cu_111surface_1-10direction/');
Cu_111_110{6}='in.laser.o885820';
Cu_111_110{7}=727;
Cu_111_110{8}=0;

%Cu {111}<11-2>
Cu_111_112=cell(1,8);
Cu_111_112{1}='Cu';
Cu_111_112{2}=46.096306;
Cu_111_112{3}='111';
Cu_111_112{4}='11-2';
Cu_111_112{5}=strcat(dir_base,'Inputs_Fig3/Cu_111surface_11-2direction/');
Cu_111_112{6}='in.laser.o885821';
Cu_111_112{7}=727;
Cu_111_112{8}=0;