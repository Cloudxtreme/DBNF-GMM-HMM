clear;
align_name = 'train.trans';
fid = fopen(align_name);
fid2 = fopen('train.align_1','w');
line = fgetl(fid);
while ischar(line)==1
    if isempty(strfind(line,'lab'))~=1
        text = sprintf('%s\n',line);
        fwrite(fid2,text);
    elseif isempty(strfind(line,'['))~=1
        data = strsplit(line);
        text = sprintf('%s %s %s%s\n',data{2},data{3},data{5},data{6});
        fwrite(fid2,text);
    %elseif isempty(strfind(line,'read'))==1
    else
    end
    line = fgetl(fid);
end
fclose(fid2);
fclose(fid);
