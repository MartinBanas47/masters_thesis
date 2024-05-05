classdef (Abstract) BaseUseCasesOutputPrinter
    methods (Abstract)
        printToFile(obj, data)
        printToConsole(obj, data)
    end
end