classdef OrCellTest < matlab.unittest.TestCase
    
    methods (Test)
        function testOrCell(testCase)
            model = load_system('ParentTest');
            filePath = mfilename('fullpath');
            folderPath = fileparts(filePath) + "\configs";
            parser = JsonUseCasesParser(folderPath);
            [useCases, inlining, maxParentDepth] = parser.ParseConfigs();
            config = ConfigFileRun(useCases, inlining, model, maxParentDepth);
            config.evalUseCasesOnModel();
            testCase.verifyEqual(length(config.Output), 1);
            testCase.assertEqual(config.Output{1}.UseCaseId, 'OrCellTestTrue');
        end
    end
    
end
