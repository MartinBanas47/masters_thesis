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
        function output = evalUseCasesOnModel(obj)
            system = find_system(obj.SimulinkModel, 'SearchDepth', 1, 'LookUnderMasks', 'all');
            if (obj.ParentDepth < 0)
                parentsList = AllParentsList();
            else
                parentsList = ParentsList(obj.ParentDepth);
            end
            evalSystem(obj, system, parentsList);
            output = true;
        end
    end
end

function result = evalSystem(obj, system, parents)
for i = 2:numel(system)
    evalUseCasesOnBlock(obj, system(i), obj, parents);
    blockType = get_param(system(i), 'BlockType');
    if (strcmp(blockType, "SubSystem"))
        evalSubSystemRecursive(obj, find_system(system(i), 'SearchDepth', 1, 'LookUnderMasks', 'all'), parents);
    end
end
result = true;
end


function result = evalSubSystemRecursive(obj, subsystem, parents)
parents.addParent(subsystem(1))
for i = 2:numel(subsystem)
    evalUseCasesOnBlock(obj, subsystem(i), obj, parents);
    blockType = get_param(subsystem(i), 'BlockType');
    if (strcmp(blockType, "SubSystem"))
        evalSubSystemRecursive(obj, find_system(subsystem(i), 'SearchDepth', 1, 'LookUnderMasks', 'all'), parents);
    end
end
result = true;
end


function result = evalUseCasesOnBlock(obj, block,configFileRun, parents)
inliningResultsDictionary = InliningResultsDictionary();
for i = 1:numel(obj.UseCases)
    result = obj.UseCases{i}.evaluateCell(block, obj.Inlining, parents, inliningResultsDictionary);
    if (result)
        structToInput = struct("BlockName", getfullname(block), "UseCaseId",obj.UseCases{i}.Id);
        configFileRun.Output{end + 1} = structToInput;
    end
end
result = true;
end
