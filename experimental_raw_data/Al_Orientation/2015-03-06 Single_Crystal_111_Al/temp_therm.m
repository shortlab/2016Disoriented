pos_str_base='Mike_Irradiated_Metals-02.75um-AC-5.00E-9sec-POS-0K-100DPA_polyCu_spot';
neg_str_base='Mike_Irradiated_Metals-02.75um-AC-5.00E-9sec-NEG-0K-100DPA_polyCu_spot';
str_end='-0.4mV.4.5mV.1.txt';

% meta=[];
% for j=1:150;
    therm3=[];
    for i=1:7
        if i<10
            num=strcat('0',num2str(i));
        else
            num=num2str(i);
        end
        pos=strcat(pos_str_base,num,str_end);
        neg=strcat(neg_str_base,num,str_end);
        out=make_fft(5,pos,neg,'therm',10);
%         out=make_fft(5,pos,neg,'therm',j);
        therm3=[therm3 out];
    end
%     meta=[meta mean(therm3)];
% end