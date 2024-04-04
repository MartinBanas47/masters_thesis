classdef TestParentClass
    %TESTPARENTCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Child,
        Array
    end
    
    methods
        function obj = TestParentClass(array)
            %TESTPARENTCLASS Construct an instance of this class
            %   Detailed explanation goes here
            obj.Child = TestChildClass(array);
            obj.Array = array;
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

