clear;

align_name = 'train.align_rough';
align_file = fopen(align_name);
write_file = fopen('train.align','w');
line = fgetl(align_file);

while ischar(line) == 1
    if isempty(strfind(line,'lab'))~=1
        write_data = sprintf('%s\n',line);
        fwrite(write_file,write_data);
    else
        read_data = strsplit(line);
        first_flame = str2num(read_data{1});
        last_flame = str2num(read_data{2});
        for n = 1 : last_flame - first_flame
            start = first_flame + n - 1;
            next = first_flame + n;
            write_data = sprintf('%d %d %s\n',start,next,read_data{3});
            fwrite(write_file,write_data);
        end
    end
    line = fgetl(align_file);
end
fclose(write_file);
fclose(align_file);