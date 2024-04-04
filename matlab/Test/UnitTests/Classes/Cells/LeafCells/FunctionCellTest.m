classdef FunctionCellTest < matlab.unittest.TestCase
    
    methods(Test)
        % Test methods
        
        function testIdStaysSame(testCase)
            cell = FunctionCell("test", "1==1");
            testCase.assertEqual(cell.Id, "test")
        end

        function testTrueValues(testCase)
            testScripts = ['true', '1==1', "2==2", "strcmp('test1', 'test1')"];
            for i = 1 : length(testScripts)
                cell = FunctionCell('test', testScripts(i));
                result = cell.evaluateCell([],[],[],[]);
                testCase.assertTrue(result);
            end
        end

        function testFalseValues(testCase)
            testScripts = ['false', '1~=1', "3==2", "strcmp('test1', 'test2')"];
            for i = 1 : length(testScripts)
                cell = FunctionCell('test', testScripts(i));
                result = cell.evaluateCell([],[],[],[]);
                testCase.assertFalse(result);
            end
        end
    end
    
end