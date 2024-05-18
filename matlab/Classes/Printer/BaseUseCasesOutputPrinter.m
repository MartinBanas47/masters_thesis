classdef BaseUseCasesOutputPrinter
    % BaseUseCasesOutputPrinter - A class for printing the output of use cases.
    methods (Abstract, Static)
        % printToFile is an abstract method to print the data to a file
        printToFile(data, filePath)
        % printToConsole is an abstract method to print the data to the console
        printToConsole(data)
    end
end