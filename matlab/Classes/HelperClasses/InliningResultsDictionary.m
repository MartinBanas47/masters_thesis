classdef InliningResultsDictionary < handle
    %inliningResultsDictionary - A class to represent a dictionary of inlining results on a block.
    properties
        Dictionary
    end
    
    methods
        function obj = InliningResultsDictionary()
            obj.Dictionary = dictionary;
        end
        
        function outputArg = Add(obj,key, value)
            outputArg = true;
            if (~isConfigured(obj.Dictionary))
                obj.Dictionary(key) = value;
            elseif (isKey(obj.Dictionary, key))
                outputArg = false;
            else
                obj.Dictionary(key)= value;
            end
        end
        
        function outputArg = IsKey(obj, key)
            outputArg = false;
            if (isConfigured(obj.Dictionary))
                outputArg = isKey(obj.Dictionary, key);
            end
        end
        
        function outputaArg = Get(obj,key)
            outputaArg = obj.Dictionary(key);
        end
    end
end

