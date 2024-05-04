classdef (Abstract) BaseParentList < handle & matlab.mixin.Copyable
    methods(Abstract)
        addParent(obj, value)
        outputArg = nextParentAvailable(obj)
        outputArg = getNextParent(obj)
        returnParent(obj)
        size = size(obj)
    end
end

