function evalConfigFileRun(configFileRun)
system = find_system(configFileRun.SimulinkModel, 'SearchDepth', 1, 'LookUnderMasks', 'all','FollowLinks', 'on', 'Type', 'Block');
if (configFileRun.ParentDepth < 0)
    parentsList = AllParentsList();
else
    parentsList = ParentsList(configFileRun.ParentDepth);
end
evalSystem(configFileRun, system, parentsList);
end


function result = evalSystem(configFileRun, system, parents)
for i = 2:numel(system)
    evalUseCasesOnBlock(system(i), configFileRun, parents);
    blockType = get_param(system(i), 'BlockType');
    if (strcmp(blockType, "SubSystem"))
        evalSubSystemRecursive(configFileRun, find_system(system(i), 'SearchDepth', 1, 'LookUnderMasks', 'all',  'FollowLinks', 'on','Type', 'Block'), parents);
    end
end
result = true;
end


function evalSubSystemRecursive(configFileRun, subsystem, parents)
parents.addParent(subsystem(1))
for i = 2:numel(subsystem)
    evalUseCasesOnBlock(subsystem(i), configFileRun, parents);
    blockType = get_param(subsystem(i), 'BlockType');
    if (strcmp(blockType, "SubSystem"))
        evalSubSystemRecursive(configFileRun, find_system(subsystem(i), 'SearchDepth', 1, 'LookUnderMasks', 'all',  'FollowLinks', 'on', 'Type', 'Block'), copy(parents));
    end
end
end


function evalUseCasesOnBlock(block,configFileRun, parents)
inliningResultsDictionary = InliningResultsDictionary();
for i = 1:numel(configFileRun.UseCases)
    try
        result = configFileRun.UseCases{i}.evaluateCell(block, configFileRun.Inlining, parents, inliningResultsDictionary);
        if (result)
        structToInput = struct("BlockName", getfullname(block), "UseCaseId",configFileRun.UseCases{i}.Id);
        configFileRun.Output{end+1} = structToInput;
        end
    catch
        error("Error in use case: " + configFileRun.UseCases{i}.Id + ", in block: " + getfullname(block)+ ", Error: " + lasterr);
    end
end
end
