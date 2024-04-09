classdef FunctionalPointerCellTests < matlab.unittest.TestCase
    
    methods (Test)
        
        function testEvaluateCellWithArguments(testCase)
            % Test evaluating the cell with arguments
            cell = FunctionalPointerCell(2, 'power', 2, 3);
            expectedOutput = power(2, 3);
            
            output = cell.evaluateCell([], [], [], []);
            
            testCase.verifyEqual(output, expectedOutput);
        end
        
    end
    
end