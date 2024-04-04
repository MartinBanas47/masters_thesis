function [cell, parentDepth] = parseUseCase(json, inlining)
switch json.type
    case 'attributeCell'
        parentDepth = 0;
        cell = AttributeCell(json.id,json.attributeName,json.expectedValue, json.operation);
    case 'orCell'
        [cell, parentDepth] = parseOrCell(json.id, json.cells, inlining);
    case 'andCell'
        [cell, parentDepth] = parseAndCell(json.id, json.cells, inlining);
    case 'negationCell'
        [tmpCell, parentDepth] = parseUseCase(json.cell, inlining);
        cell = NegationCell(json.id,tmpCell);
    case 'parentCell'
        [tmpCell, parentDepth] = parseUseCase(json.cell, inlining);
        cell = ParentCell(json.id,tmpCell);
        parentDepth = parentDepth + 1;
    case 'allParentCell'
        [tmpCell, ~] = parseUseCase(json.cell, inlining);
        cell = AnyParentCell(json.id,tmpCell);
        parentDepth = -9999;
    case 'inliningCell'
        parentDepth = inlining(json.referenceName).ParentDepth;
        cell = InliningCell(json.id,json.referenceName);
    case 'functionCell'
        parentDepth = 0;
        cell = FunctionCell(json.id, json.script);
    case 'functionalPointerCell'
        parentDepth = 0;
        cell = FunctionCell(json.id, json.functionName);
    otherwise
        error('Unsupported cell type')
end
end


%%refactor
function [resultAndCell, maxParentDepth] = parseAndCell(id, list, inlining)
resultCellArray = cell(1, length(list));  % Initialize a cell array
maxParentDepth = 0;
if isstruct(list)
    useCases = num2cell(list);
else
    useCases = list;
end
for i = 1:length(useCases)
    [resultCellArray{i}, tmpDepth] = parseUseCase(useCases{i}, inlining);
    if (tmpDepth >= 0 && maxParentDepth >= 0)
        maxParentDepth = max(tmpDepth, maxParentDepth);
    else
        maxParentDepth = min(tmpDepth, maxParentDepth);
    end
end
resultAndCell = AndCell(id,resultCellArray);
end

function [resultAndCell, maxParentDepth] = parseOrCell(id, list, inlining)
resultCellArray = cell(1, length(list));  % Initialize a cell array
maxParentDepth = 0;
if isstruct(list)
    useCases = num2cell(list);
else
    useCases = list;
end
for i = 1:length(useCases)
    [resultCellArray{i}, tmpDepth] = parseUseCase(useCases{i}, inlining);
    if (tmpDepth >= 0 && maxParentDepth >= 0)
        maxParentDepth = max(tmpDepth, maxParentDepth);
    else
        maxParentDepth = min(tmpDepth, maxParentDepth);
    end
end
resultAndCell = OrCell(id,resultCellArray);
end