classdef ConfigFileRun < handle
    %CONFIGCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Inlining,
        UseCases,
        ParentDepth = 0,
        SimulinkModel,
        Output = {}
    end
    
    methods
        function obj = ConfigFileRun(useCases, inlining, simulinkModel, maxParentDepth)
            %CONFIGCLASS Construct an instance of this class
            %   Detailed explanation goes here
            obj.SimulinkModel = simulinkModel;
            obj.UseCases = useCases;
            obj.Inlining = inlining;
            obj.ParentDepth = maxParentDepth;
        end
        function evalUseCasesOnModel(obj)
            evalConfigFileRun(obj);
        end
    end
end

