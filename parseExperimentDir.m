function [parsedData] = parseExperimentDir( dirName )

fileNames = dir(dirName);

allData = struct.empty;

for i = 1:size(fileNames)
    
    fileName = strcat(dirName, fileNames(i).name);
    if ((length(fileName) > 3) && (strcmp(fileName(end-3:end), '.txt') == 1))
        % open the file
        fid = fopen(fileName);

        data = [];
        data.id = 0;
        fscanf(fid, '{\n', 1);
        s = fscanf(fid, '%s:%s\n', 1);
%        s = fgets(fid);
        while (s ~= '}')
           expression = ':';
           splitStr = regexp(s,expression,'split');
           if (size(splitStr,2) > 1)
                data.(char(splitStr(1))) = str2double(splitStr(2));
           end
           s = fscanf(fid, '%s:%s\n', 1);
        end
        
        % read the file headers, find N (one value)
%         data.time = fscanf(fid, 'time: %d\n', 1);
%         data.width = fscanf(fid, 'width: %d\n', 1);
%         data.height = fscanf(fid, 'height: %d\n', 1);
% %        data.nameA = fscanf(fid, 'name-A: %s\n', 1);
% %        data.nameA = fscanf(fid,  ' %s\n', 1);
%         data.paramA = fscanf(fid, 'param-A: %f\n', 1);
% %        data.nameB = fscanf(fid, 'name-B: %s\n', 1);
%         data.paramB = fscanf(fid, 'param-B: %f\n', 1);
% %         
% %         %data.('SI') = 0;
        
        if ((sum(data.width) > 0) && sum((data.height) > 0))
            % read world
            
            table = fscanf(fid, '%d', [data.width, data.height])';
            data.world  = table;
            
        end
        
        % close the file
        fclose(fid);
        allData = [allData ; data];
        
    end
end

'done'

parsedData = allData;
