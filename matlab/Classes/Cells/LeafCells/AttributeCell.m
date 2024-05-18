classdef AttributeCell < BaseCell
    % AttributeCell - A class to represent a cell that comapres value of block parameter with expected value.
    
    properties
        Id
    end
    
    properties (Access = private)
        AttributeName
        OperationHelper
    end
    
    methods
        function obj = AttributeCell(id, attributeName, expectedValue, operation)
            % AttributeCell - Constructs an instance of the AttributeCell class.
            %
            %   Input Arguments:
            %       - id: The unique identifier of the cell.
            %       - attributeName: The name of the attribute to evaluate.
            %       - expectedValue: The expected value for the attribute.
            %       - operation: The comparison operation to perform.
            
            obj.Id = id;
            obj.AttributeName = attributeName;
            
            if isnumeric(expectedValue) && isscalar(expectedValue)
                % Input is a single number
                obj.OperationHelper = NumericComparer(operation, expectedValue);
            elseif isstring(expectedValue) || ischar(expectedValue)
                % Input is a string
                obj.OperationHelper = StringComparer(operation, expectedValue);
            elseif isnumeric(expectedValue)
                % Input is a numeric array
                obj.OperationHelper = NumericArrayComparer(operation, expectedValue);
            elseif iscell(expectedValue) && (all(cellfun(@isstring, expectedValue)) || all(cellfun(@ischar, expectedValue)))
                % Input is a string array
                obj.OperationHelper = StringArrayComparer(operation, expectedValue);
            else
                error('Input type not supported');
            end
        end
        
        function r = evaluateCell(obj, block, inliningDef, parents, inliningResults)
            if (isprop(block, obj.AttributeName))
                param = get_param(block, obj.AttributeName);
                r = obj.OperationHelper.compare(param);
            else
                r = false;
            end
        end
    end
end
