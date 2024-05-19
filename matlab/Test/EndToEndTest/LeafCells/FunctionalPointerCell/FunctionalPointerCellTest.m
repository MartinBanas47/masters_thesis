classdef FunctionalPointerCellTest < matlab.unittest.TestCase
    
    methods (Test)
        function testAttributeTypeCell(testCase)
            model = load_system('TestModel');
            filePath = mfilename('fullpath');
            folderPath = fileparts(filePath) + "\configs";
            parser = JsonConfigurationFileParser(folderPath);
            [useCases, inlining, maxParentDepth] = parser.parseConfigs();
            config = ConfigFileRun(useCases, inlining, model, maxParentDepth);
            config.evalUseCasesOnModel();
            testCase.verifyTrue(length(config.Output) >= 1);
            testCase.assertEqual(config.Output{1}.UseCaseId, 'functional_pointer_cell_test');
        end
    end
    
end
