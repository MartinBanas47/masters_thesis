classdef StringComparerTest < matlab.unittest.TestCase
    
    methods (Test)
        
        function testEqualityComparison(testCase)
            helper = StringComparer("==", "hello");
            
            result = helper.compare("hello");
            
            testCase.verifyTrue(result);
        end
        
        function testInequalityComparison(testCase)
            helper = StringComparer("~=", "world");
            
            result = helper.compare("hello");
            
            testCase.verifyTrue(result);
        end
        
        function testEndOfStringComparison(testCase)
            helper = StringComparer("end", "world");
            
            result = helper.compare("hello world");
            
            testCase.verifyTrue(result);
        end
        
        function testSubstringContainmentComparison(testCase)
            helper = StringComparer("in", "world");
            
            result = helper.compare("hello world");
            
            testCase.verifyTrue(result);
        end
        
    end
    
end