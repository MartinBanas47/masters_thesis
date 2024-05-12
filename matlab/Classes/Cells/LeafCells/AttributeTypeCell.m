classdef AttributeTypeCell < BaseCell
    
    properties
        Id
    end
    
    properties (Access = private)
        AttributeName,
        ExpectedAttributeType
    end
    
    methods
        function obj = AttributeTypeCell(id,attributeName, expectedType)
            obj.Id = id;
            obj.AttributeName = attributeName;
            obj.ExpectedAttributeType = expectedType;
        end
        
        function r = evaluateCell(obj,block, inliningDef, parents, inliningResults)
            global memHitCnt;
            global memMaxVal;

            if(isprop(block, obj.AttributeName))
                param = get_param(block, obj.AttributeName);
                r = isa(param, obj.ExpectedAttributeType);
                [memHitCnt, memMaxVal] = tryMemoryScan(memHitCnt, memMaxVal);
            else
                r = false;
                [memHitCnt, memMaxVal] = tryMemoryScan(memHitCnt, memMaxVal);
            end
        end
    end
end
