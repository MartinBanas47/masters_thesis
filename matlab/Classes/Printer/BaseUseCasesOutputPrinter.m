classdef BaseUseCasesOutputPrinter
    methods (Abstract, Static)
        printToFile(data, filePath)
        printToConsole(data)
    end
end