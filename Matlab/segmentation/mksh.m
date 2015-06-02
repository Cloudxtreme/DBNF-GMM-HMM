clear;
mlf_name = 'train.mlf';
fid = fopen(mlf_name);
fid2 = fopen('seg_train.sh','w');
line = fgetl(fid);
while ischar(line) == 1
    if isempty(strfind(line,'"*'))~=1
        write_name = sprintf('%s',line(4:end-4));
        write_data = sprintf('./segment.pl %smfc %slab\n',write_name,write_name);
        fwrite(fid2,write_data);
    end
    line = fgetl(fid);
end
fclose(fid2);
fclose(fid);
