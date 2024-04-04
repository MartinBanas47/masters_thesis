classdef UseCasesOutputPrinter
    %USECASESOUTPUTPRINTER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        UseCasesResults
    end
    
    methods
        function obj = UseCasesOutputPrinter(useCasesResults)
            %USECASESOUTPUTPRINTER Construct an instance of this class
            %   Detailed explanation goes here
            obj.UseCasesResults = useCasesResults;
        end
        
        function result = PrintJsonToFile(obj,filePath)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            fileID = fopen(filePath, 'w');
            fwrite(fileID, jsonencode(obj.UseCasesResults));
            fclose(fileID);
            result = true;
        end
        function result = PrintJsonToConsole(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            disp(jsonencode(obj.UseCasesResults));
            result = true;
        end
    end
end

