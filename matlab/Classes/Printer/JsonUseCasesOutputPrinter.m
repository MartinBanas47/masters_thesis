classdef JsonUseCasesOutputPrinter < BaseUseCasesOutputPrinter
    %USECASESOUTPUTPRINTER Summary of this class goes here
    %   Detailed explanation goes here
        
    methods(Static)
        
        function printToFile(data,filePath)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            fileID = fopen(filePath, 'w');
            fwrite(fileID, jsonencode(data));
            fclose(fileID);
        end
        function printToConsole(data)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            disp(jsonencode(data));
        end
    end
end

