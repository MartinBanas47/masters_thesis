classdef FunctionalPointerCellTests < matlab.unittest.TestCase
    
    methods (Test)
        
        function testEvaluateCellWithNumbes(testCase)
            % Test evaluating the cell with numbers
            cell = FunctionalPointerCell('Id', 'isequal', jsondecode("[2, 3]"));
            expectedOutput = false;
            
            output = cell.evaluateCell([], [], [], []);
            
            testCase.verifyEqual(output, expectedOutput);
            
            cell = FunctionalPointerCell('Id', 'isequal', jsondecode("[2, 2]"));
            expectedOutput = true;
            
            output = cell.evaluateCell([], [], [], []);
            
            testCase.verifyEqual(output, expectedOutput);
        end
        
        function testEvaluateCellWithStrings(testCase)
            % Test evaluating the cell with string arguments
            cell = FunctionalPointerCell("Id", 'isequal', jsondecode('["Hello", " World!"]'));
            expectedOutput = false;
            
            output = cell.evaluateCell([], [], [], []);
            
            testCase.verifyEqual(output, expectedOutput);
            
            cell = FunctionalPointerCell("Id", 'isequal', jsondecode('["Hello","Hello"]'));
            expectedOutput = true;
            
            output = cell.evaluateCell([], [], [], []);
            
            testCase.verifyEqual(output, expectedOutput);
        end
        
        function testEvaluateCellWithNumbersAndStrings(testCase)
            % Test evaluating the cell with a combination of numbers and strings
            cell = FunctionalPointerCell('Id', 'isequal', jsondecode('[5, "5"]'));
            expectedOutput = false;
            
            output = cell.evaluateCell([], [], [], []);
            
            testCase.verifyEqual(output, expectedOutput);
        end
        
        
    end
    
end