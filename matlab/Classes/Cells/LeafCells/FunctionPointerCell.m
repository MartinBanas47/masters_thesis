classdef FunctionPointerCell < BaseCell
    % FunctionPointerCell - A class to represent a cell that calls a function with arguments.
    properties
        Id
    end
    
    properties (Access = private)
        FunctionName
        Arguments
    end
    
    methods
        function obj = FunctionPointerCell(id, functionName, arguments)
            % FunctionPointerCell - Constructs an instance of the FunctionPointerCell class.
            %
            %   Input Arguments:
            %       - id: The unique identifier of the cell.
            %       - functionName: The name of the function to call.
            %       - arguments: The arguments to pass to the function.
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