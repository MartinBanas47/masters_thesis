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
        
        function r = evaluateCell(obj,block, inliningDef,parents, inliningResults)
            evalin('base', 'global memHitCnt;');
            evalin('base', 'global memMaxVal;');
            global memHitCnt;
            global memMaxVal;

            if (isprop(block, obj.AttributeName))
                param = get_param(block, obj.AttributeName);
                r = obj.OperationHelper.compare(param);
                [memHitCnt, memMaxVal] = tryMemoryScan(memHitCnt, memMaxVal);
            else
                r = false;
            end
            [memHitCnt, memMaxVal] = tryMemoryScan(memHitCnt, memMaxVal);
        end
    end
end
