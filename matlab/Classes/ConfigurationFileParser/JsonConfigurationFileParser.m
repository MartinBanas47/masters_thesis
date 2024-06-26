classdef JsonConfigurationFileParser
    %JsonConfigurationFileParser - A class to parse JSON configuration files.
    
    properties
        FolderPath
    end
    
    methods
        function obj = JsonConfigurationFileParser(folderPath)
            %JsonConfigurationFileParser - Constructor method for JsonConfigurationFileParser class.
            %   obj = JsonConfigurationFileParser(folderPath) creates an instance of JsonConfigurationFileParser class.
            %   folderPath - The path to the folder containing the JSON configuration files.
            obj.FolderPath = folderPath;
        end
        
        function [useCases, inlining, maxParentDepth] = parseConfigs(obj)
            
            if ~isfolder(obj.FolderPath)
                errorMessage = sprintf('Error: The following folder does not exist:\n%s', folderPath);
                uiwait(warndlg(errorMessage));
                return;
            end
            filePattern = fullfile(obj.FolderPath, '*');
            theFiles = dir(filePattern);
            jsons = [];
            for i = 1 : length(theFiles)
                baseFileName = theFiles(i).name;
                if theFiles(i).isdir || strcmp(baseFileName, '.') || strcmp(baseFileName, '..')
                    continue; % Skip this iteration if it's a directory or special entry
                end
                fullFileName = fullfile(obj.FolderPath, baseFileName);
                jsons{end+1} = jsondecode(fileread(fullFileName));
            end
            inlining = parseInlining(jsons);
            [useCases, maxParentDepth] = obj.processUseCases(jsons, inlining);
        end
        
        function [resultCellArray, maxParentDepth] =  processUseCases(obj, list, inlining)
            resultCellArray = {};
            maxParentDepth = 0;
            for f = 1:length(list)
                x = list{f};
                tmpList = x.useCases;
                if isstruct(tmpList)
                    tmpList = num2cell(tmpList);
                end
                
                for i = 1:length(tmpList)
                    [x, tmpDepth] = parseUseCase(tmpList{i}, inlining);
                    resultCellArray{end+1} = x;
                    if (maxParentDepth >= 0 && tmpDepth >= 0)
                        maxParentDepth = max(tmpDepth, maxParentDepth);
                    else
                        maxParentDepth = min(tmpDepth, maxParentDepth);
                    end
                end
            end
        end
        
    end
end

