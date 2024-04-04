classdef NegationCell < BaseCell
    %NEGATIONCELL Node cell used to negating value of provided cell
    
    properties
        Id
    end
    
    properties (Access = private)
        Cell
    end
    
    methods
        function obj = NegationCell(id, cell)
            obj.Id = id;
            obj.Cell = cell;
        end
        
        function outputBool = evaluateCell(obj, block, inliningDef, parents, inliningResults)
            outputBool = ~evaluateCell(obj.Cell, block, inliningDef, parents, inliningResults);
        end
    end
end

