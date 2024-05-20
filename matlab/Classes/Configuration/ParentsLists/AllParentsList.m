classdef AllParentsList < handle & BaseParentList & matlab.mixin.Copyable
    %AllParentsList - A class to represent a list of all parents.
    
    properties
        List,
        CurrentStart = 1,
        CurrentEnd = 0,
        IsEmpty = true,
    end
    
    methods
        function addParent(obj, value)
            obj.List(end + 1) = value;
            obj.CurrentEnd = obj.CurrentEnd + 1;
            obj.IsEmpty = false;
        end
        
        function outputArg = nextParentAvailable(obj)
            outputArg = ~obj.IsEmpty;
        end
        
        function outputArg = getNextParent(obj)
            if(obj.CurrentEnd <= 0)
                outputArg = 0;
                return;
            end
            outputArg = obj.List(obj.CurrentEnd);
            obj.CurrentEnd = obj.CurrentEnd - 1;
            obj.IsEmpty = obj.CurrentEnd == 0;
        end
        
        function returnParent(obj)
            obj.IsEmpty = false;
            obj.CurrentEnd = obj.CurrentEnd + 1;
        end
        
        function size = size(obj)
            if (obj.IsEmpty)
                size = 0;
                return;
            end
            size = length(obj.List);
        end
    end
end

