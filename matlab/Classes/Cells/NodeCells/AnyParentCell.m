classdef AnyParentCell < BaseCell
    %PARENTCELL Node cell which uses link to parent of the Simulink block which will be evaluated instead of the current block
    
    properties
        Id
    end

    properties (Access = private)
        Cell
    end
    
    methods
        function obj = AnyParentCell(id,cell)
            obj.Id = id;
            obj.Cell = cell;
        end
        
        function outputBool = evaluateCell(obj, block, inliningDef, parents, inliningResults)
            size = parents.size();
            for i = 1 : size
                parent = parents.getNextParent();
                res = obj.Cell.evaluateCell(parent, inliningDef, parents, InliningResultsDictionary());
                if (res)
                    outputBool = true;
                    return;
                end
            end
            for i = 1 : length(size)
                parents.returnParent();
            end
            outputBool = false;
        end
    end
end

