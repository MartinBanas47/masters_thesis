classdef StringCompareHelper
    %STRINGCOMPAREHELPER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        Operation
    end

    properties
        ExpectedValue
    end
    
    methods
        function obj = StringCompareHelper(operation, expectedValue)
            %STRINGCOMPAREHELPER Construct an instance of this class
            %   Detailed explanation goes here
            obj.ExpectedValue = expectedValue;
            obj.Operation = obj.getStringOperation(operation);
        end

        function result = compare(obj, value)
            result = obj.Operation(value);
        end
        
        function result = typeCompare(obj, value, operation)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            result = false;
            if (length(value)~=length(obj.ExpectedValue))
                return;
            end
            result = operation(obj.ExpectedValue, value);
        end
    end

    methods (Access = private)
        function result = getStringOperation(obj, operation)
            switch(operation)
                case("==")
                    result = @(value) obj.typeCompare(value, @strcmp);
                case("~=")
                    result = @(value)  ~obj.typeCompare(value, @strcmp);
            end
        end
    end
end