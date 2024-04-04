classdef OrCell < BaseCell
    %ORCELL Node cell which connects all provided cells with logical OR
    %   Lazy evaluation is applied
    
    properties
        Id
    end
    
    properties (Access = private)
        CellsArray
    end
    
    methods
        function obj = OrCell(id,cellsArray)
            %ORCELL Construct an instance of this class
            obj.Id = id;
            obj.CellsArray = cellsArray;
        end
        
        function outputBool = evaluateCell(obj, block, inliningDef, parents, inliningResults)
            %EVALUATECELL Evaluates formula using lazy evaluation
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

