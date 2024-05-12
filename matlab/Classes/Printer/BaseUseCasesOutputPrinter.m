classdef (Abstract) BaseUseCasesOutputPrinter
    methods (Abstract)
        printToFile(obj, data, filePath)
        printToConsole(obj, data)
    end
end