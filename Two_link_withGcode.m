clc
clear all
%% Import data from text file.
% Script for importing data from the following text file:
%
%    D:\Github\Two-link-Robotic-Arm\Shoaib.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2019/03/06 19:54:29

%% Initialize variables.
filename = 'D:\Github\Two-link-Robotic-Arm\Zain.txt';
delimiter = ' ';

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string',  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end


%% Allocate imported array to column variable names
% Desired points in cartesian space (meters)
x = cell2mat(raw(:, 2))/1000;
y = cell2mat(raw(:, 3))/1000;
plot(x,y)

% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp;

%% Create your Robotic Arm
L(1) = Link([0      0      0.20       0      0      0]);
L(2) = Link([0      0      0.15       0      0      0]);
% % Build a serial robot object
R2 = SerialLink(L(1:2), 'name', 'RR');
% 
% % Robot base coordinates (cartesian space)
% R2.base=transl(0,0,0);
hold on
view(-0.6,0.8);
xlim([-0.4,0.4]);
ylim([-0.4,0.4]); 
zlim([-0.1,0.2]); 
% % ##########Plotting#############
po = 3;
x_len = length(x);
for k=1:1:x_len
    pp1 = transl(x(k,1),y(k,1),0);
    pp2 = transl(x(k+1,1),y(k+1,1),0);
    crt_sp = ctraj(pp1,pp2,po);
    crt_ik  = R2.ikine(crt_sp,'mask',[1 1 0 0 0 0]);
    j = transpose(crt_sp(1:3,4));
    plot2(j,'r.');
    R2.plot(crt_ik);
end