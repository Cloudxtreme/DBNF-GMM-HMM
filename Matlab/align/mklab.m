clear;
align_name = 'train.align';
fid = fopen(align_name);
fid2 = fopen('fake','w');
line = fgetl(fid);
while ischar(line) == 1
    if isempty(strfind(line,'lab'))~=1
        fclose(fid2);
        write_name = sprintf('%s',line(1:end));
        fid2 = fopen(write_name,'w');
    else
        text0 = strsplit(line);
        text = sprintf('%s %s %s\n',text0{1:3});
        fwrite(fid2,text);
    end
    line = fgetl(fid);
end
fclose(fid2);
fclose(fid);
