classdef StringComparer < BaseComparer
    % StringComparer - A class for comparing string values using different operations.
    
    properties (Access = private)
        Operation
    end
    
    properties
        ExpectedValue
    end
    
    methods
        function obj = StringComparer(operation, expectedValue)
            %StringComparer - Construct an instance of the StringComparer class
            %   obj = StringComparer(operation, expectedValue) creates a new
            %   instance of the StringComparer class with the specified
            %   operation and expected value.
            
            obj.ExpectedValue = expectedValue;
            obj.Operation = obj.getStringOperation(operation);
        end
        
        function result = compare(obj, value)
            result = obj.Operation(value);
        end
    end
    
    methods (Access = private)
        function result = typeCompare(obj, value, operation)
            result = false;
            if (length(value)~=length(obj.ExpectedValue))
                return;
            end
            result = operation(value, obj.ExpectedValue);
        end
        
        function result = getStringOperation(obj, operation)
            switch(operation)
                case("==")
                    result = @(value) obj.typeCompare(value, @strcmp);
                case("~=")
                    result = @(value) ~obj.typeCompare(value, @strcmp);
                case("end")
                    result = @(value) endOfStringCompare(value, obj.ExpectedValue);
                case("in")
                    result = @(value) obj.typeCompare(value, @contains);
            end
        end
    end
end

function result = endOfStringCompare(value, expectedValue)
charExpected = char(expectedValue);
charValue = char(value);
if(length(charValue)< length(charExpected))
    result = false;
    return;
end
result = strcmp(charExpected, charValue(end-length(charExpected)+1:end));
end