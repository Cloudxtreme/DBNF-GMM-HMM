clear;
mlf_name = 'test.mlf';
fid = fopen(mlf_name);
fid2 = fopen('fake','w');
line = fgetl(fid);
while ischar(line) == 1
    if isempty(strfind(line,'"*'))~=1
        fclose(fid2);
        write_name = sprintf('%s',line(4:end-1));
        fid2 = fopen(write_name,'w');
    elseif isempty(strfind(line,'.'))~=1
    else
        text = sprintf('%s\n',line);
        fwrite(fid2,text);
    end
    line = fgetl(fid);
end
fclose(fid2);
fclose(fid);
