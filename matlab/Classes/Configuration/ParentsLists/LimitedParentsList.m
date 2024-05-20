classdef LimitedParentsList < handle & BaseParentList & matlab.mixin.Copyable
    %LimitedParentsList - A class to represent a list of parents.
    properties
        List,
        MaxDepth,
        CurrentStart = 1,
        CurrentEnd = 0,
        IsEmpty = true,
    end
    
    methods
        function obj = LimitedParentsList(maxDepth)
            %LimitedParentsList - Constructs an instance of the LimitedParentsList class.
            %
            %   Input Arguments:
            %       - maxDepth: The maximum number of parents to store.
            obj.List = zeros(1, maxDepth);
            obj.MaxDepth = maxDepth;
        end
        
        function addParent(obj, value)
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
        
        function outputArg = nextParentAvailable(obj)
            outputArg = ~obj.IsEmpty;
        end
        
        function outputArg = getNextParent(obj)
            outputArg = obj.List(obj.CurrentEnd);
            if (obj.CurrentEnd == obj.CurrentStart)
                obj.IsEmpty = true;
            end
            obj.CurrentEnd = obj.GetPrevIndex(obj.CurrentEnd);
        end
        
        function returnParent(obj)
            obj.CurrentEnd = obj.GetNextIndex(obj.CurrentEnd);
            obj.IsEmpty = false;
        end
        
        function size = size(obj)
            if (obj.IsEmpty)
                size = 0;
                return;
            end
            size = length(obj.List);
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

