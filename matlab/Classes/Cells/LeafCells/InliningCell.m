classdef InliningCell < BaseCell
    %INLININGCELL Node cell which uses link to predefined inlining which will be evaluated instead of the cell
    
    properties
        Id
    end
    
    properties (Access = private)
        ReferenceName
    end
    
    methods
        function obj = InliningCell(id, referenceName)
            %INLININGCELL Construct an instance of this class
            %   REFERENCENAME Name of reference to predefined subtree
            obj.Id = id;
            obj.ReferenceName = referenceName;
        end
        
        function outputBool  = evaluateCell(obj,block, inliningDef, parents, inliningResults)
            %METHOD1 Evaluation of the predefined structure which is returned as a result of this cell
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

