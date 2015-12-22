clear;

% definitions
expDirName = 'C:\simulators\NetLogo 5.2.1\matlab\models\dual-asym-2\';
expOutName = strcat(expDirName, 'output\');

% todo - clear directory and run exp, wait for finish
% https://ccl.northwestern.edu/netlogo/docs/behaviorspace.html

% parse input
allData = parseExperimentDir(expOutName);

%score data
allData = scoreAllData(allData, 'SI', @getSI); 
allData = scoreAllData(allData, 'mix4', @getMixScale, 4); 
allData = scoreAllData(allData, 'ratio', @getARatio); 
allData = scoreAllData(allData, 'count', @getTotalCount);
allData = scoreAllData(allData, 'outpost4', @getOutposts, 4);
allData = scoreAllData(allData, 'g12', @getPairCorrelation, 4, 1, 2);
allData = scoreAllData(allData, 'g11', @getPairCorrelation, 4, 1, 1);
allData = scoreAllData(allData, 'g22', @getPairCorrelation, 4, 2, 2);
allData = scoreAllData(allData, 'g21', @getPairCorrelation, 4, 2, 1);
allData = scoreAllData(allData, 'g13', @getPairCorrelation, 4, 1, 3);
allData = scoreAllData(allData, 'g23', @getPairCorrelation, 4, 2, 3);

save(strcat(expDirName, 'allData.mat'), 'allData');