classdef JsonUseCasesOutputPrinter < BaseUseCasesOutputPrinter
    % JsonUseCasesOutputPrinter - A class for printing the output of use cases evaluation in JSON format.
    
    methods(Static)
        
        function printToFile(data,filePath)
            fileID = fopen(filePath, 'w');
            fwrite(fileID, jsonencode(data));
            fclose(fileID);
        end
        function printToConsole(data)
            disp(jsonencode(data));
        end
    end
end

