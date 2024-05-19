
classdef NumericComparerTest < matlab.unittest.TestCase
    
    methods (Test)
        
        function testEqualComparison(testCase)
            comparer = NumericComparer("==", 5);
            result = comparer.compare(5);
            testCase.verifyTrue(result);

            comparer = NumericComparer("==", 10);
            result = comparer.compare("test");
            testCase.verifyFalse(result);
        end
        
        function testGreaterComparison(testCase)
            comparer = NumericComparer(">", 10);
            result = comparer.compare(15);
            testCase.verifyTrue(result);

            comparer = NumericComparer(">", 10);
            result = comparer.compare("test");
            testCase.verifyFalse(result);
        end
        
        function testLessComparison(testCase)
            comparer = NumericComparer("<", 7);
            result = comparer.compare(3);
            testCase.verifyTrue(result);

            comparer = NumericComparer("<", 10);
            result = comparer.compare("test");
            testCase.verifyFalse(result);
        end
        
        function testGreaterOrEqualComparison(testCase)
            comparer = NumericComparer(">=", 5);
            result = comparer.compare(5);
            testCase.verifyTrue(result);

            comparer = NumericComparer(">=", 10);
            result = comparer.compare("test");
            testCase.verifyFalse(result);
        end
        
        function testLessOrEqualComparison(testCase)
            comparer = NumericComparer("<=", 10);
            result = comparer.compare(10);
            testCase.verifyTrue(result);

            comparer = NumericComparer("<=", 10);
            result = comparer.compare("test");
            testCase.verifyFalse(result);
        end
        
        function testNotEqualComparison(testCase)
            comparer = NumericComparer("~=", 8);
            result = comparer.compare(5);
            testCase.verifyTrue(result);

            comparer = NumericComparer("~=", 10);
            result = comparer.compare("test");
            testCase.verifyTrue(result);
        end
        
    end
    
end