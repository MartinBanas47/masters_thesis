classdef ParentCell < BaseCell
    %PARENTCELL Node cell which uses link to parent of the Simulink block which will be evaluated instead of the current block
    
    properties
        Id
    end

    properties (Access = private)
        Cell
    end
    
    methods
        function obj = ParentCell(id,cell)
            obj.Id = id;
            obj.Cell = cell;
        end
        
        function outputBool = evaluateCell(obj, block, inliningDef, parents, inliningResults)
            if (parents.nextParentAvailable())
                outputBool = evaluateCell(obj.Cell, parents.getNextParent(), inliningDef, parents, InliningResultsDictionary());
            else
                outputBool = false;
            end
            parents.returnParent();
        end
    end
end

