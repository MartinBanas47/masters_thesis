classdef InliningCell < BaseCell
    % InliningCell - A class to represent a cell that inlines a predefined structure.
    
    properties
        Id
    end
    
    properties (Access = private)
        ReferenceName
    end
    
    methods
        function obj = InliningCell(id, referenceName)
            % InliningCell - Constructs an instance of the InliningCell class.
            %
            %   Input Arguments:
            %       - id: The unique identifier of the cell.
            %       - referenceName: The name of the predefined structure to inline.
            obj.Id = id;
            obj.ReferenceName = referenceName;
        end
        
        function outputBool  = evaluateCell(obj,block, inliningDef, parents, inliningResults)
            if (inliningResults.IsKey(obj.ReferenceName))
                outputBool  = inliningResults.Get(obj.ReferenceName);
            else
                value = inliningDef(obj.ReferenceName).Cell.evaluateCell(block, inliningDef, parents, inliningResults);
                inliningResults.Add(obj.ReferenceName, value);
                outputBool = value;
            end
        end
    end
end

