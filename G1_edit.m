clc
% Read txt into cell A
fid = fopen('G1.txt','r')
i = 1;
tline = fgetl(fid)
A{i} = tline;
while ischar(tline)
    i = i+1;
    tline = fgetl(fid);
    A{i} = tline
end

fclose(fid);

% 
% % Change cell A
A{3} = sprintf('%d',2)
% % Write cell A into txt
fid = fopen('test2.txt', 'w')
for i = 1:numel(A)
    if A{i+1} == -1
        fprintf(fid,'%s', A{i});
        break
    else
        fprintf(fid,'%s\n', A{i});
    end
end
