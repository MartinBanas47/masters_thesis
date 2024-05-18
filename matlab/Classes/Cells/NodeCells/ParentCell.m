classdef ParentCell < BaseCell
    %ParentCell - A class to represent a cell that checks whether a parent satisfies a condition.
    
    properties
        Id
    end
    
    properties (Access = private)
        Cell
    end
    
    methods
        function obj = ParentCell(id,cell)
            %ParentCell - Constructs an instance of the ParentCell class.
            %
            %   Input Arguments:
            %       - id: The unique identifier of the cell.
            %       - cell: The cell to evaluate.
            obj.Id = id;
            obj.Cell = cell;
        end
        
        function outputBool = evaluateCell(obj, block, inliningDef, parents, inliningResults)
            if (parents.nextParentAvailable())
                outputBool = evaluateCell(obj.Cell, parents.getNextParent(), inliningDef, parents, InliningResultsDictionary());
                parents.returnParent();
            else
                outputBool = false;
            end
        end
    end
end

