classdef (Abstract) BaseCell
    %BASECELL Abstract class included all mandatory parts of cells

    properties (Abstract)
        %Id is an unique identifier to specify the cells in Configuration file
        Id
    end

    methods (Abstract)
        %EVALUATECELL Method used to evaluate value of given block
        %   BLOCK Simulink block on which use case will be evaluated
        %   INLININGDEF ConfigFileRun object of given run
        %   PARENTS ParentsList object which provides information about parents of the Simulink block
        %   INLININGRESULT Collection of inlining results for inlining evaluation optimization
        outputBool = evaluateCell(obj, block, inliningDef, parents, inliningResults)
    end
end