clc
fid = fopen('G1.txt');
text = textscan(fid,'%s','delimiter','\n')
% You will need to adjust this to fit more than your example
lines = find(cellfun(@(x) strcmp(x(1),'G'),text)) % Looking for lines which start with G. This may not work
for i = 1:length(lines)
    nums = regexp(text{lines(i)},'G\d+ X(\d+.\d*) Y(\d+.\d*) .*','tokens') % Locate numbers in line
    coords = [str2num(nums{1}{1}) str2num(nums{1}{2})] % Convert to numbers from strings
    text{lines(i)} = [text{lines(i)}(1:3),' = [',num2str(coords),']']; % Replace the line with new format
end
fclose(fid);
fid = fopen('myfile.txt','w'); % Open as writable file (overwrites old stuff)**************
% fprintf(fid,'%s\n',text{:});
fclose(fid);
[text(1); cellfun(@str2num,text(2:end),'un',0).']