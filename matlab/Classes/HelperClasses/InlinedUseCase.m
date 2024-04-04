classdef InlinedUseCase
    %INLININGCELL Representation of inlining definition
    
    properties
        Name,
        ParentDepth,
        Cell
    end
    
    methods
        function obj = InlinedUseCase(name,cell, parentDepth)
            obj.Name = name;
            obj.Cell = cell;
            obj.ParentDepth = parentDepth;
        end

        function h = keyHash(obj)
            h = keyHash(obj.Name);
        end
        
        function tf = keyMatch(objA, objB)
            tf = keyMatch(objA.Name, objB.Name);
        end
    end
end

    