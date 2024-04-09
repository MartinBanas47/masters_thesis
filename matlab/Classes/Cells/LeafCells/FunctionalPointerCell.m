classdef FunctionalPointerCell < BaseCell
    %FUNCTIONALPOINTERCELL Leaf cell used to evaluate MATLAB functioname provided by constructor
    
    properties
        Id
    end
    
    properties (Access = private)
        FunctionName, % Name of the MATLAB function to be evaluated
        Function, % Function handle to evaluate the MATLAB function
        Args % Arguments to be passed to the MATLAB function
    end
    
    methods
        function obj = FunctionalPointerCell(id, functionName, varargin)
            %FUNCTIONALPOINTERCELL Constructor for FunctionalPointerCell class
            %   obj = FunctionalPointerCell(id, functionName, varargin) creates a FunctionalPointerCell object with the specified id, function name, and optional arguments.
            
            obj.Id = id;
            obj.FunctionName = str2func(functionName);
            obj.Args = varargin;
            obj.Function = @() obj.FunctionName(obj.Args{:});
        end
        
        function outputBool = evaluateCell(obj,block, inliningDef, parents, inliningResults)
            %evaluateCell Evaluates the MATLAB function associated with the FunctionalPointerCell object
            %   outputBool = evaluateCell(obj, block, inliningDef, parents, inliningResults) evaluates the MATLAB function associated with the FunctionalPointerCell object and returns the output as a boolean value.
            
            outputBool = obj.Function();
        end
    end
end
