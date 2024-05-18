classdef ConfigFileRun < handle
    %ConfigFileRun - A class to represent a configuration file run.
    
    properties
        Inlining,
        UseCases,
        ParentDepth = 0,
        SimulinkModel,
        Output = {}
    end
    
    methods
        function obj = ConfigFileRun(useCases, inlining, simulinkModel, maxParentDepth)
            %ConfigFileRun - Constructs an instance of the ConfigFileRun class.
            %
            %   Input Arguments:
            %       - useCases: The use cases to evaluate.
            %       - inlining: The inlining definitions.
            %       - simulinkModel: The Simulink model to evaluate.
            %       - maxParentDepth: The maximum number of nested parent cells.
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

