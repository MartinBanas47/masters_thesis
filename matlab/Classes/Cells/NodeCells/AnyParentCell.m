classdef AnyParentCell < BaseCell
    % AnyParentCell - A class to represent a cell that checks whether any predecessor satisfies a condition.
    
    properties
        Id
    end
    
    properties (Access = private)
        Cell
    end
    
    methods
        function obj = AnyParentCell(id,cell)
            % AnyParentCell - Constructs an instance of the AnyParentCell class.
            %
            %   Input Arguments:
            %       - id: The unique identifier of the cell.
            %       - cell: The cell to evaluate.
            obj.Id = id;
            obj.Cell = cell;
        end
        
        function outputBool = evaluateCell(obj, block, inliningDef, parents, inliningResults)
            size = parents.size();
            outputBool = false;
            for i = 1 : size
                parent = parents.getNextParent();
                res = obj.Cell.evaluateCell(parent, inliningDef, parents, InliningResultsDictionary());
                if (res)
                    for j = 1 : i
                        parents.returnParent();
                    end
                    outputBool = true;
                    return;
                end
            end
            for i = 1 : size
                parents.returnParent();
            end
        end
    end
end

