classdef NumericComparer < BaseComparer
    % NumericComparer - A class for comparing numeric values using different operations.
    
    properties (Access = private)
        Operation,
        ExpectedValue
    end
    
    methods
        function obj = NumericComparer(operation, expectedValue)
            % NumericComparer - Constructor method for NumericComparer class.
            %   obj = NumericComparer(operation, expectedValue) creates an instance of NumericComparer class.
            %   operation - The operation to be used for comparison.
            obj.Operation = obj.getNumericOperation(operation);
            obj.ExpectedValue = expectedValue;
        end
        
        function result = compare(obj,value)
            result = obj.Operation(value, obj.ExpectedValue);
        end
    end
    
    methods (Access = private)
        function result = getNumericOperation(obj, operation)
            switch(operation)
                case("==")
                    result = @(value, expectedValue) isequal(value, expectedValue);
                case(">")
                    result = @(value, expectedValue) isnumeric(value) && value > expectedValue;
                case("<")
                    result = @(value, expectedValue) isnumeric(value) && value < expectedValue;
                case(">=")
                    result = @(value, expectedValue) isnumeric(value) && value >= expectedValue;
                case("<=")
                    result = @(value, expectedValue) isnumeric(value) && value <= expectedValue;
                case("~=")
                    result = @(value, expectedValue) ~isequal(value, expectedValue);
            end
        end
    end
end

