classdef (Abstract) BaseParentList < handle & matlab.mixin.Copyable
    %BaseParentList Abstract class included all mandatory parts of parent lists
    methods(Abstract)
        %addParent is an abstract method to add a parent to the list
        addParent(obj, value)
        %nextParentAvailable is an abstract method to check if there is a next parent available
        outputArg = nextParentAvailable(obj)
        %getNextParent is an abstract method to get the next parent
        %   Behaviour when NextParentAvailable returns false is undefined
        outputArg = getNextParent(obj)
        %returnParent is an abstract method to return the last retrieved parent
        %   Behavior when returning more parents than removed is undefined
        returnParent(obj)
        %size is an abstract method to get the size of the list
        size = size(obj)
    end
end

