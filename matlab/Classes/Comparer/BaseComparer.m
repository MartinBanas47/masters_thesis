classdef (Abstract) BaseComparer
    methods (Abstract)
        result = compare(obj, value)
    end
end