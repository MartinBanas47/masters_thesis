classdef NumericCompareHelper
    %NUMBERCOMPAREHELPER Summary of this class goes here
    %   Detailed explanation goes here

    properties
        Operation,
        ExpectedValue
    end

    methods
        function obj = NumericCompareHelper(operation, expectedValue)
            %NUMBERCOMPAREHELPER Construct an instance of this class
            %   Detailed explanation goes here
            obj.Operation = obj.getNumericOperation(operation);
            obj.ExpectedValue = expectedValue;
        end

        function result = compare(obj,value)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            result = false;
            if (~isnumeric(value))
                try
                    result = obj.Operation(value, eval(value));
                catch Ex
                    rethrow(Ex);
                end
            else
                result = obj.Operation(value, obj.ExpectedValue);
            end          
        end
    end

    methods (Access = private)
        function result = getNumericOperation(obj, operation)
            switch(operation)
                case("==")
                    result = @(value, expectedValue) value == expectedValue;
                case(">")
                    result = @(value, expectedValue) value > expectedValue;
                case("<")
                    result = @(value, expectedValue) value < expectedValue;
                case(">=")
                    result = @(value, expectedValue) value >= expectedValue;
                case("<=")
                    result = @(value, expectedValue) value <= expectedValue;
                case("~=")
                    result = @(value, expectedValue) value ~= expectedValue;
            end
        end
    end
end

