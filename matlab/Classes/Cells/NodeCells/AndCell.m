classdef AndCell < BaseCell
    %ANDCELL Node cell which connects all provided cells with logical AND
    %   Lazy evaluation is applied
    
    properties
        Id
    end
    
    properties (Access = private)
        CellsArray
    end
    
    methods
        function obj = AndCell(id,cellsArray)
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

