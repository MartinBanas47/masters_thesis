classdef AttributeTypeCell < BaseCell
    % AttributeTypeCell - A class to represent a cell that compares value of block parameter type with expected value.
    
    properties
        Id
    end
    
    properties (Access = private)
        AttributeName,
        ExpectedAttributeType
    end
    
    methods
        function obj = AttributeTypeCell(id,attributeName, expectedType)
            % AttributeTypeCell - Constructs an instance of the AttributeTypeCell class.
            %
            %   Input Arguments:
            %       - id: The unique identifier of the cell.
            %       - attributeName: The name of the attribute to evaluate.
            %       - expectedType: The expected type for the attribute.
            obj.Id = id;
            obj.AttributeName = attributeName;
            obj.ExpectedAttributeType = expectedType;
        end
        
        function r = evaluateCell(obj,block, inliningDef, parents, inliningResults)
            if(isprop(block, obj.AttributeName))
                param = get_param(block, obj.AttributeName);
                r = isa(param, obj.ExpectedAttributeType);
            else
                r = false;
            end
        end
    end
end
