classdef AttributeCell < BaseCell
    
    properties
        Id
    end

    properties (Access = private)
        AttributeName,
        OperationHelper
    end

    methods
        function obj = AttributeCell(id,attributeName, expectedValue, operation)
            obj.Id = id;
            obj.AttributeName = attributeName;
            if (isnumeric(expectedValue))
                obj.OperationHelper = NumericCompareHelper(operation, expectedValue);
            else
                obj.OperationHelper = StringCompareHelper(operation, expectedValue);
            end


        end

        function r = evaluateCell(obj,block, inliningDef, parents, inliningResults)
            param = get_param(block, obj.AttributeName);
            r = obj.OperationHelper.compare(param);
        end
    end
end
