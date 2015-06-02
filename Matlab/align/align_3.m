clear;
align_name = 'train.align_2';
fid = fopen(align_name);
fid2 = fopen('train.align_rough','w');
line = fgetl(fid);
line = fgetl(fid);
while ischar(line)==1
    text = sprintf('%s\n',line);
    fwrite(fid2,text);
    line = fgetl(fid);
    line = fgetl(fid);
end
fclose(fid2);
fclose(fid);