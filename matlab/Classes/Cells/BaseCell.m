classdef (Abstract) BaseCell
    %BaseCell Abstract class included all mandatory parts of cells
    
    properties (Abstract)
        %Id is an unique identifier to specify the cells in Configuration file
        Id
    end
    
    methods (Abstract)
        %evaluateCell is an abstract method to evaluate the cell
        %
        %   Input Arguments:
        %       - block: The block to evaluate.
        %       - inliningDef: The inlining definitions.
        %       - parents: The parents of the block.
        %       - inliningResults: The inlining results.
        outputBool = evaluateCell(obj, block, inliningDef, parents, inliningResults)
    end
end