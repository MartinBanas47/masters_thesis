classdef NumericArrayComparerTest < matlab.unittest.TestCase
    
    methods (Test)
        
        function testCompare_Value(testCase)
            comparer = NumericArrayComparer('in', [1, 2, 3, 4]);

            result = comparer.compare(1);
            testCase.verifyTrue(result);

            result = comparer.compare(3);
            testCase.verifyTrue(result);

            result = comparer.compare(4);
            testCase.verifyTrue(result);
        end

         function testCompare_DifferentValue(testCase)
            comparer = NumericArrayComparer('in', [1, 2, 3, 4]);
            result = comparer.compare(7);
            testCase.verifyFalse(result);

            result = comparer.compare(10);
            testCase.verifyFalse(result);
        end

    end
    
end