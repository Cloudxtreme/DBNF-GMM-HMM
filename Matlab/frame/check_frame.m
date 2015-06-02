clear;

flab = fopen('solo_totalframe.log');
fhtk = fopen('clean_totalframe.log');
ffix = fopen('fix_data.log','w');

for n = 1:3234
    lab_line = fgetl(flab);
    htk_line = fgetl(fhtk);
    lab_data = strsplit(lab_line);
    lab_frame = str2double(lab_data{2});
    htk_data = strsplit(htk_line);
    htk_frame = (str2double(htk_data{2}) - 14) / 7;
    if lab_frame == htk_frame
    else
        fix_data = sprintf('%s ',lab_data{3});
        fwrite(ffix, fix_data);
    end
end
fclose(flab);
fclose(fhtk);
fclose(ffix);