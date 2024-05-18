classdef InliningDefinition
    % InliningDefinition - A class to represent an inlining definition.
    
    properties
        Name,
        ParentDepth,
        Cell
    end
    
    methods
        function obj = InliningDefinition(name,cell, parentDepth)
            % InliningDefinition - Constructs an instance of the InliningDefinition class.
            %
            %   Input Arguments:
            %       - name: The name of the inlining definition.
            %       - cell: The cell to inline.
            %       - parentDepth: The parent depth of the cell.
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

