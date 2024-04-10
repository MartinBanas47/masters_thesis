classdef StringCompareHelperTest < matlab.unittest.TestCase
    
    methods (Test)
        
        function testEqualityComparison(testCase)
            helper = StringCompareHelper("==", "hello");
            
            result = helper.compare("hello");
            
            testCase.verifyTrue(result);
        end
        
        function testInequalityComparison(testCase)
            helper = StringCompareHelper("~=", "world");
            
            result = helper.compare("hello");
            
            testCase.verifyTrue(result);
        end
        
        function testEndOfStringComparison(testCase)
            helper = StringCompareHelper("end", "world");
            
            result = helper.compare("hello world");
            
            testCase.verifyTrue(result);
        end
        
        function testSubstringContainmentComparison(testCase)
            helper = StringCompareHelper("in", "world");
            
            result = helper.compare("hello world");
            
            testCase.verifyTrue(result);
        end
        
    end
    
end