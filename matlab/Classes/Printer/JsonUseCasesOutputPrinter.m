classdef JsonUseCasesOutputPrinter < BaseUseCasesOutputPrinter
    %USECASESOUTPUTPRINTER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        UseCasesResults
    end
    
    methods
        function obj = JsonUseCasesOutputPrinter(useCasesResults)
            %USECASESOUTPUTPRINTER Construct an instance of this class
            %   Detailed explanation goes here
            obj.UseCasesResults = useCasesResults;
        end
        
        function printToFile(obj,filePath)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            fileID = fopen(filePath, 'w');
            fwrite(fileID, jsonencode(obj.UseCasesResults));
            fclose(fileID);
        end
        function printToConsole(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            disp(jsonencode(obj.UseCasesResults));
        end
    end
end

