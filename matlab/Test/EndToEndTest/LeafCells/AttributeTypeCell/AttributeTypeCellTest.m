classdef AttributeTypeCellTest < matlab.unittest.TestCase
    
    methods (Test)
        function testAttributeTypeCell(testCase)
            model = load_system('ParentTest');
            filePath = mfilename('fullpath');
            folderPath = fileparts(filePath) + "\configs";
            parser = JsonConfigurationFileParser(folderPath);
            [useCases, inlining, maxParentDepth] = parser.parseConfigs();
            config = ConfigFileRun(useCases, inlining, model, maxParentDepth);
            config.evalUseCasesOnModel();
            testCase.verifyEqual(length(config.Output), 1);
            testCase.assertEqual(config.Output{1}.UseCaseId, 'AttributeTypeAndCellTestTrue');
        end
    end
    
end
