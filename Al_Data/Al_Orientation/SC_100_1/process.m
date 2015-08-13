base='Al_Orientation-SC_100_1-05.50um-';
pos_end='_deg-POS-1.txt';
neg_end='_deg-NEG-1.txt';

pks=zeros(1,19);
diffs=zeros(1,19);

for j=0:18
    num_str=strcat(num2str(j),'0');
    pos=strcat(base,num_str,pos_end);
    neg=strcat(base,num_str,neg_end);
    [pks(j+1) diffs(j+1)]=param_extract(3,pos,neg,5.50);
end