% Title:    Import .csv data files
% Author:   A.Marinov
% Date:     8th Jan 2020
% Version:  A1
% Status:   Working

function xrd_data_out = xrd_csv_import(filename, dataLines)
% Auto-generated by MATLAB on 08-Jan-2020 10:10:40

% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [28, Inf];
end

%  Setup the Import Options
opts = delimitedTextImportOptions("NumVariables", 3);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Sampleidentification", "VarName2", "Var3"];
opts.SelectedVariableNames = ["Sampleidentification", "VarName2"];
opts.VariableTypes = ["double", "double", "string"];
opts = setvaropts(opts, 3, "WhitespaceRule", "preserve");
opts = setvaropts(opts, 3, "EmptyFieldRule", "auto");
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Export the data
dataTable = readtable(filename, opts);
xrd_data_out = table2array(dataTable);
end