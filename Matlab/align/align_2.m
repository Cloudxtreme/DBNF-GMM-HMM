clear;
align_name = 'train.align_1';
fid = fopen(align_name);
fid2 = fopen('train.align_2','w');
fid_line = fgetl(fid);
while ischar(fid_line)==1
    if isempty(strfind(fid_line,'lab'))~=1
        lab_name = sprintf('%s\n',fid_line);
        fwrite(fid2,lab_name);
        fwrite(fid2,lab_name);
        fid_line = fgetl(fid);
        first_line = sprintf('%s\n',fid_line);
        fwrite(fid2,first_line);
        while isempty(strfind(fid_line,'lab'))==1
            first_data = strsplit(fid_line);
            fid_line = fgetl(fid);
            if isempty(strfind(fid_line,'lab'))~=1
                first_data{2} = str2num(first_data{2}) + 1;
                first_line = sprintf('%s %d %s\n',first_data{1},first_data{2},first_data{3});
                fwrite(fid2,first_line);
            elseif fid_line == -1
                break
            else
                next_data = strsplit(fid_line);
                first_data{2} = next_data{1};
                write_first = sprintf('%s %s %s\n',first_data{1:3});
                fwrite(fid2,write_first);
                write_next = sprintf('%s %s %s\n',next_data{1:3});
                fwrite(fid2,write_next);
            end
        end
    end
end

first_data{2} = str2num(first_data{2}) + 1;
first_line = sprintf('%s %d %s\n',first_data{1},first_data{2},first_data{3});
fwrite(fid2,first_line);
fclose(fid2);
fclose(fid);
