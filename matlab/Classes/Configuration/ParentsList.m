classdef ParentsList < handle 
    properties
        List,
        MaxDepth,
        CurrentStart = 1,
        CurrentEnd = 0,
        IsEmpty = true,
    end
    
    methods
        function obj = ParentsList(maxDepth)
            obj.List = zeros(1, maxDepth);
            obj.MaxDepth = maxDepth;
        end

        function AddParent(obj, value)
            %ADDPARENT Adds block to a list of parents
            if (obj.MaxDepth == 0)
                return;
            elseif(obj.CurrentEnd == 0 && obj.IsEmpty)
                obj.CurrentEnd = 1;
                obj.List(1) = value;
                obj.IsEmpty = false;
            elseif(obj.GetNextIndex(obj.CurrentEnd) == obj.CurrentStart)
                obj.List(obj.CurrentStart) = value;
                obj.CurrentEnd = obj.CurrentStart;
                obj.CurrentStart = obj.GetNextIndex(obj.CurrentStart);
            else
                obj.CurrentEnd = obj.GetNextIndex(obj.CurrentEnd);
                obj.List(obj.CurrentEnd) = value;
            end
        end
        
        function outputArg = NextParentAvailable(obj)
            %NEXTPARENTAVAILABLE Returns if there is next parent available to pick
            outputArg = ~obj.IsEmpty;
        end

        function outputArg = GetNextParent(obj)
            %GETNEXTPARENT Provides next parent from the list and sets it as removed
            %   Behaviour when NextParentAvailable returns false is undefined
            outputArg = obj.List(obj.CurrentEnd);
            if (obj.CurrentEnd == obj.CurrentStart)
                obj.IsEmpty = true;                
            end
            obj.CurrentEnd = obj.GetPrevIndex(obj.CurrentEnd);
        end

        function ReturnParent(obj)
            %RETURNPARENT Returns lastly taken parent from to list back to the list
            %   Behavior when returning more parents than removed is undefined
            %   Behavior when adding parents before returning all the removed parents is undefined
            obj.CurrentEnd = obj.GetNextIndex(obj.CurrentEnd);
            obj.IsEmpty = false;
        end

       
    end

    methods(Access = private)
        function resultIndex = GetNextIndex(obj, index)
            resultIndex =  mod((index), obj.MaxDepth) + 1;
        end

        function resultIndex = GetPrevIndex(obj, index)
            if (index == 1)
                resultIndex = obj.MaxDepth;
            else
                resultIndex = index - 1;
            end
        end
    end 
end

