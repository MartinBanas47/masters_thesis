classdef NumericArrayComparer < BaseComparer
    % NumericArrayComparer - A class for comparing numeric arrays using different operations.
    
    properties (Access = private)
        Operation,
        ExpectedValue
    end
    
    methods
        function obj = NumericArrayComparer(operation, expectedValue)
            % NumericArrayComparer - Constructor method for NumericArrayComparer class.
            %   obj = NumericArrayComparer(operation, expectedValue) creates an instance of NumericArrayComparer class.
            %   operation - The operation to be used for comparison.
            %   expectedValue - The expected value for comparison.
            
            obj.Operation = obj.getArrayOperation(operation);
            obj.ExpectedValue = expectedValue;
        end
        
        function result = compare(obj,value)
            % compare - Compares the given value with the expected value using the specified operation.
            %   result = compare(obj,value) compares the given value with the expected value using the specified operation.
            %   value - The numeric value to be compared.
            %   result - The result of the comparison.
            
            result = obj.Operation(value, obj.ExpectedValue);
        end
    end
    
    methods (Access = private)
        function result = getArrayOperation(obj, operation)
            % getArrayOperation - Returns the array operation based on the specified operation string.
            %   result = getArrayOperation(obj, operation) returns the array operation based on the specified operation string.
            %   operation - The operation string.
            %   result - The array operation.
            
            switch(operation)
                case("in")
                    result = @(value, expectedValue) ismember(value, expectedValue);
            end
        end
    end
end
