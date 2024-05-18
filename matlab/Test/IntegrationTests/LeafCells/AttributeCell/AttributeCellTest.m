classdef AttributeCellTest < matlab.unittest.TestCase
    
    methods (Test)
        function testAttributeCell(testCase)
            model = load_system('ParentTest');
            filePath = mfilename('fullpath');
            folderPath = fileparts(filePath) + "\configs";
            parser = JsonConfigurationFileParser(folderPath);
            [useCases, inlining, maxParentDepth] = parser.parseConfigs();
            config = ConfigFileRun(useCases, inlining, model, maxParentDepth);
            config.evalUseCasesOnModel();
            testCase.verifyEqual(length(config.Output), 1);
            testCase.assertEqual(config.Output{1}.UseCaseId, 'AttributeCellTestTrue');
        end
    end
    
end
