function inliningDictionary = parseInlining(jsonList)
%PARSEINLINING Summary of this function goes here
%   Detailed explanation goes here
inliningDictionary = dictionary;
for f = 1:length(jsonList)
    parsedInliningJson = jsonList{f}.inlining;
    for i = 1:length(parsedInliningJson)
        [cell, parentDepth] = parseUseCase(parsedInliningJson(i).object,[]);
        inliningDictionary(parsedInliningJson(i).name) = InliningDefinition(parsedInliningJson(i).name, cell, parentDepth);
    end
end
end

