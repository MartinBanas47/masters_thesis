classdef AndCell < BaseCell
    %AndCell - A class to represent a cell that performs logical AND operation on multiple cells.
    
    properties
        Id
    end
    
    properties (Access = private)
        CellsArray
    end
    
    methods
        function obj = AndCell(id,cellsArray)
            %AndCell - Constructs an instance of the AndCell class.
            %
            %   Input Arguments:
            %       - id: The unique identifier of the cell.
            %       - cellsArray: The array of cells to perform logical AND operation on.
            obj.Id = id;
            obj.CellsArray = cellsArray;
        end
        
        function outputBool = evaluateCell(obj, block, inliningDef, parents, inliningResults)
            %EVALUATECELL Evaluates formula using lazy evaluation
            for i = 1 : length(obj.CellsArray)
                tmp = obj.CellsArray{i}.evaluateCell( block, inliningDef, parents, inliningResults);
                if ~tmp
                    outputBool = false;
                    return;
                end
            end
            outputBool = true;
        end
    end
end

