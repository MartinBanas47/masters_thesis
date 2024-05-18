classdef NegationCell < BaseCell
    % NegationCell - A class to represent a cell that negates the result of another cell.
    
    properties
        Id
    end
    
    properties (Access = private)
        Cell
    end
    
    methods
        function obj = NegationCell(id, cell)
            % NegationCell - Constructs an instance of the NegationCell class.
            %
            %   Input Arguments:
            %       - id: The unique identifier of the cell.
            %       - cell: The cell to negate.
            obj.Id = id;
            obj.Cell = cell;
        end
        
        function outputBool = evaluateCell(obj, block, inliningDef, parents, inliningResults)
            outputBool = ~evaluateCell(obj.Cell, block, inliningDef, parents, inliningResults);
        end
    end
end

