classdef FunctionalPointerCell < BaseCell
    %FUNCTIONALPOINTERCELL Leaf cell used to evaluate MATLAB functioname provided by constructor
    
    properties
        Id
    end
    
    properties (Access = private)
        Function
    end
    
    methods
        function obj = FunctionalPointerCell(id, functionName)
            obj.Id = id;
            obj.Function = @() functionName;
        end
        
        function outputBool = evaluateCell(obj,block, inliningDef, parents, inliningResults)
            outputBool = obj.Function();
        end
    end
end

