classdef StringArrayComparerTest < matlab.unittest.TestCase
    
    methods (Test)
        
        function testCompare_WithInOperation_ShouldReturnTrueIfValueIsInExpectedValue(testCase)
            comparer = StringArrayComparer("in", ["apple", "banana", "cherry"]);
            result = comparer.compare("banana");
            testCase.verifyTrue(result);
        end
        
        function testCompare_WithInOperation_ShouldReturnFalseIfValueIsNotInExpectedValue(testCase)
            comparer = StringArrayComparer("in", ["apple", "banana", "cherry"]);
            result = comparer.compare("orange");
            testCase.verifyFalse(result);
        end

    end
    
end