classdef FunctionCell < BaseCell
    %FUNCTIONCELL Leaf cell used to evaluate MATLAB script provided by constructor

    properties
        Id
    end
    
    properties (Access = private)
        Script
    end
    
    methods
        function obj = FunctionCell(id, script)
            obj.Id = id;
            obj.Script = script;
        end
        
        function outputBool = evaluateCell(obj,block, inliningDef, parents, inliningResults)
            outputBool = eval(obj.Script);
        end
    end
end

