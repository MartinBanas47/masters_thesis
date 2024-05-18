classdef OrCell < BaseCell
    %OrCell - A class to represent a cell that combines the results of other cells using OR.
    
    properties
        Id
    end
    
    properties (Access = private)
        CellsArray
    end
    
    methods
        function obj = OrCell(id,cellsArray)
            %OrCell - Constructs an instance of the OrCell class.
            %
            %   Input Arguments:
            %       - id: The unique identifier of the cell.
            %       - cellsArray: The array of cells to combine using OR.
            obj.Id = id;
            obj.CellsArray = cellsArray;
        end
        
        function outputBool = evaluateCell(obj, block, inliningDef, parents, inliningResults)
            for i = 1 : length(obj.CellsArray)
                tmp = obj.CellsArray{i}.evaluateCell( block, inliningDef, parents, inliningResults);
                if tmp
                    outputBool = true;
                    return;
                end
            end
            outputBool = false;
        end
    end
end

