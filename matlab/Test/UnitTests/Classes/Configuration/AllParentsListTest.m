classdef AllParentsListTest < matlab.unittest.TestCase
    methods (Test)
        function testAddParent(testCase)
            % Test adding a parent to the list
            list = AllParentsList();
            parent = 1;
            list.addParent(parent);
            testCase.verifyEqual(list.size(), 1);
        end
        
        function testNextParentAvailable(testCase)
            % Test checking if there is a next parent available
            list = AllParentsList();
            parent = 1;
            list.addParent(parent);
            testCase.verifyTrue(list.nextParentAvailable());
        end
        
        function testGetNextParent(testCase)
            % Test getting the next parent from the list
            list = AllParentsList();
            parent = 1;
            list.addParent(parent);
            retrievedParent = list.getNextParent();
            testCase.verifyEqual(retrievedParent, parent);
        end
        
        function testReturnParent(testCase)
            % Test returning a parent back to the list
            list = AllParentsList();
            parent = 1;
            list.addParent(parent);
            list.getNextParent();
            list.returnParent();
            testCase.verifyEqual(list.size(), 1);
        end
        
        function testSizeEmpty(testCase)
            % Test getting the size of an empty list
            list = AllParentsList();
            testCase.verifyEqual(list.size(), 0);
        end
        
        function testSizeNonEmpty(testCase)
            % Test getting the size of a non-empty list
            list = AllParentsList();
            parent1 = 1;
            parent2 = 2;
            list.addParent(parent1);
            list.addParent(parent2);
            testCase.verifyEqual(list.size(), 2);
        end
    end
end