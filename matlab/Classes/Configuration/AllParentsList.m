classdef AllParentsList < handle & BaseParentList
    properties
        List,
        CurrentStart = 1,
        CurrentEnd = 0,
        IsEmpty = true,
    end
    
    methods
        function obj = AllParentsList()
        end
        
        function addParent(obj, value)
            %ADDPARENT Adds block to a list of parents
            obj.List(end + 1) = value;
            obj.CurrentEnd = obj.CurrentEnd + 1;
            obj.IsEmpty = false;
        end
        
        function outputArg = nextParentAvailable(obj)
            %NEXTPARENTAVAILABLE Returns if there is next parent available to pick
            outputArg = ~obj.IsEmpty;
        end
        
        function outputArg = getNextParent(obj)
            %GETNEXTPARENT Provides next parent from the list and sets it as removed
            %   Behaviour when NextParentAvailable returns false is undefined
            if(obj.CurrentEnd <= 0)
                outputArg = 0;
                return;
            end
            outputArg = obj.List(obj.CurrentEnd);
            obj.CurrentEnd = obj.CurrentEnd - 1;
            obj.IsEmpty = obj.CurrentEnd == 0;
        end
        
        function returnParent(obj)
            %RETURNPARENT Returns lastly taken parent from to list back to the list
            %   Behavior when returning more parents than removed is undefined
            %   Behavior when adding parents before returning all the removed parents is undefined
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

