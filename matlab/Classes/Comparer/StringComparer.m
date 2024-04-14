classdef StringComparer < BaseComparer
    %STRINGCOMPARER Helper class for string comparison operations
    %   This class provides methods for comparing strings based on different
    %   operations such as equality, inequality, end-of-string comparison,
    %   and substring containment.
    
    properties (Access = private)
        Operation
    end
    
    properties
        ExpectedValue
    end
    
    methods
        function obj = StringComparer(operation, expectedValue)
            %STRINGCOMPARER Construct an instance of the StringComparer class
            %   obj = StringComparer(operation, expectedValue) creates a new
            %   instance of the StringComparer class with the specified
            %   operation and expected value.
            
            obj.ExpectedValue = expectedValue;
            obj.Operation = obj.getStringOperation(operation);
        end
        
        function result = compare(obj, value)
            %COMPARE Compare the specified value with the expected value
            %   result = compare(value) compares the specified value with the
            %   expected value using the operation defined for this instance of
            %   StringComparer.
            
            result = obj.Operation(value);
        end
        
        function result = typeCompare(obj, value, operation)
            %TYPECOMPARE Compare the specified value with the expected value using the specified operation
            %   result = typeCompare(value, operation) compares the specified
            %   value with the expected value using the specified operation. The
            %   result is true if the comparison is successful, false otherwise.
            
            result = false;
            if (length(value)~=length(obj.ExpectedValue))
                return;
            end
            result = operation(value, obj.ExpectedValue);
        end
    end
    
    methods (Access = private)
        function result = getStringOperation(obj, operation)
            %GETSTRINGOPERATION Get the function handle for the specified operation
            %   result = getStringOperation(operation) returns the function handle
            %   for the specified operation. The function handle can be used to
            %   perform the comparison operation on a given value.
            
            switch(operation)
                case("==")
                    result = @(value) obj.typeCompare(value, @strcmp);
                case("~=")
                    result = @(value) ~obj.typeCompare(value, @strcmp);
                case("end")
                    result = @(value) obj.typeCompare(value, @endOfStringCompare);
                case("in")
                    result = @(value) obj.typeCompare(value, @contains);
            end
        end
    end
end

function result = endOfStringCompare(value, expectedValue)
%ENDOFSTRINGCOMPARE Compare the end of the specified value with the expected value
%   result = endOfStringCompare(value, expectedValue) compares the end of the
%   specified value with the expected value. The result is true if the end of
%   the value matches the expected value, false otherwise.

charExpected = char(expectedValue);
charValue = char(value);
if(length(charValue)< length(charExpected))
    result = false;
    return;
end
result = strcmp(charExpected, charValue(end-length(charExpected)+1:end));
end