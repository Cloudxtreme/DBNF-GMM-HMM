clear;

fuzzy_rate = 0.2;
align_name = 'train.align';
align_file = fopen(align_name);
write_file = fopen('train.fuzzy','w');
line = fgetl(align_file);
n = 0;

while ischar(line) == 1
    if isempty(strfind(line,'lab'))~=1
        write_data = sprintf('%s\n',line);
        fwrite(write_file,write_data);
        line = fgetl(align_file);
    while isempty(strfind(line,'#'))~=1
        n = n+1;
        read_data = strsplit(line);
        fix_data{n,1} = read_data{1,1};
        fix_data{n,2} = read_data{1,2};
        fix_data{n,3} = read_data{1,3};
        line = fgetl(align_file);
    end
    index = randperm(n);
    use = round(n*fuzzy_rate);
    for i = 1 : 2 : use - 1;
        change1 = fix_data{index(i),3};
        change2 = fix_data{index(i+1),3};
        fix_data{index(i),3} = change2;
        fix_data{index(i+1),3} = change1;
    end
    for i = 1 : n;
        write_data = sprintf('%s %s %s\n',fix_data{i,1},fix_data{i,2},fix_data{i,3});
        fwrite(write_file,write_data);
    end
    n = 0;
    end
end
fclose(write_file);
fclose(align_file);