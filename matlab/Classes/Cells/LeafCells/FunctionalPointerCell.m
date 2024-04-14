classdef FunctionalPointerCell < BaseCell
    properties
        Id
        FunctionName
        Arguments
    end
    
    methods
        function obj = FunctionalPointerCell(id, functionName, arguments)
            obj.Id = id;
            obj.FunctionName = functionName;
            if isnumeric(arguments)
                obj.Arguments = num2cell(arguments);
            else
                obj.Arguments = arguments;
            end
        end
        
        function result = evaluateCell(obj, block, inliningDef, parents, inliningResults)
            result = feval(obj.FunctionName, obj.Arguments{:});
        end
    end
end