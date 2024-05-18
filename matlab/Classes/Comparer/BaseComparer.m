classdef (Abstract) BaseComparer
    %BaseComparer Abstract class included all mandatory parts of comparers
    methods (Abstract)
        %compare is an abstract method to compare the object with a value
        result = compare(obj, value)
    end
end