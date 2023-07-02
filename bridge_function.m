function [f1,f2,f3,f4]=bridge_function(d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18)
fout1=fopen('parameters_bridge.tcl','w');
fprintf(fout1,'set d1 %f \n',d1);
fprintf(fout1,'set d2 %f \n',d2);
fprintf(fout1,'set d3 %f \n',d3);
fprintf(fout1,'set d4 %f \n',d4);
fprintf(fout1,'set d5 %f \n',d5);  
fprintf(fout1,'set d6 %f \n',d6);
fprintf(fout1,'set d7 %f \n',d7);
fprintf(fout1,'set d8 %f \n',d8);
fprintf(fout1,'set d9 %f \n',d9);
fprintf(fout1,'set d10 %f \n',d10);
fprintf(fout1,'set d11 %f \n',d11);
fprintf(fout1,'set d12 %f \n',d12);
fprintf(fout1,'set d13 %f \n',d13);
fprintf(fout1,'set d14 %f \n',d14);
fprintf(fout1,'set d15 %f \n',d15);
fprintf(fout1,'set d16 %f \n',d16);
fprintf(fout1,'set d17 %f \n',d17);
fprintf(fout1,'set d18 %f \n',d18);
fclose(fout1);
infile='bridge.tcl';
eval(['! OpenSees ' infile '>screendump'])
tmp1=load('frequencies_bridge.out');
f1=tmp1(1,1);
f2=tmp1(2,1);
f3=tmp1(3,1);
f4=tmp1(4,1);
end