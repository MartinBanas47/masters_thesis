classdef LimitedParentsListTest < matlab.unittest.TestCase
    methods (Test)
        function testAddParent(testCase)
            % Test adding a parent to an empty list
            parentsList = LimitedParentsList(5);
            parentsList.addParent(1);
            testCase.verifyEqual(parentsList.List, [1 0 0 0 0]);
            
            % Test adding a parent to a non-empty list
            parentsList.addParent(2);
            testCase.verifyEqual(parentsList.List, [1 2 0 0 0]);
        end
        
        function testNextParentAvailable(testCase)
            % Test when there is a next parent available
            parentsList = LimitedParentsList(5);
            parentsList.addParent(1);
            testCase.verifyTrue(parentsList.nextParentAvailable());
            
            % Test when there is no next parent available
            parentsList.getNextParent();
            testCase.verifyFalse(parentsList.nextParentAvailable());
        end
        
        function testGetNextParent(testCase)
            % Test getting the next parent from the list
            parentsList = LimitedParentsList(5);
            parentsList.addParent(1);
            parentsList.addParent(2);
            parentsList.addParent(3);
            testCase.verifyEqual(parentsList.getNextParent(), 3);
            parentsList.returnParent();
            parentsList.addParent(4);
            parentsList.addParent(5);
            parentsList.addParent(6);
            testCase.verifyEqual(parentsList.getNextParent(), 6);
            parentsList.returnParent();
            parentsList.addParent(7);
            parentsList.addParent(8);
            testCase.verifyEqual(parentsList.getNextParent(), 8);
        end
        
        function testReturnParent(testCase)
            % Test returning the last taken parent back to the list
            parentsList = LimitedParentsList(5);
            parentsList.addParent(1);
            parentsList.addParent(2);
            parentsList.getNextParent();
            parentsList.returnParent();
            testCase.verifyEqual(parentsList.List, [1 2 0 0 0]);
            
            % Test returning multiple parents back to the list
            parentsList.getNextParent();
            parentsList.returnParent();
            parentsList.returnParent();
            testCase.verifyEqual(parentsList.List, [1 2 0 0 0]);
        end
        
        function testSize(testCase)
            % Test the size of an empty list
            parentsList = LimitedParentsList(5);
            testCase.verifyEqual(parentsList.size(), 0);
            
            % Test the size of a non-empty list
            parentsList.addParent(1);
            parentsList.addParent(2);
            testCase.verifyEqual(parentsList.size(), 5);
        end
    end
end