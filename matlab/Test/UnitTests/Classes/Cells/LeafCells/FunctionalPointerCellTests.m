classdef FunctionalPointerCellTests < matlab.unittest.TestCase
    
    methods (Test)
        
        function testEvaluateCellWithArguments(testCase)
            % Test evaluating the cell with arguments
            cell = FunctionalPointerCell('Id', 'power', jsondecode("[2, 3]"));
            expectedOutput = power(2, 3);
            
            output = cell.evaluateCell([], [], [], []);
            
            testCase.verifyEqual(output, expectedOutput);
        end
        
        function testEvaluateCellWithStrings(testCase)
            % Test evaluating the cell with string arguments
            cell = FunctionalPointerCell("Id", 'strcat', jsondecode('["Hello"," World!"]'));
            expectedOutput = strcat('Hello', ' World!');
            
            output = cell.evaluateCell([], [], [], []);
            
            testCase.verifyEqual(output, expectedOutput);
        end
        
        function testEvaluateCellWithNumbersAndStrings(testCase)
            % Test evaluating the cell with a combination of numbers and strings
            cell = FunctionalPointerCell('Id', 'plus', jsondecode('[5, "2"]'));
            expectedOutput = plus(5, '2');
            
            output = cell.evaluateCell([], [], [], []);
            
            testCase.verifyEqual(output, expectedOutput);
        end
        
        
    end
    
end