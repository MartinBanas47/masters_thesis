classdef NegationCellTest < matlab.unittest.TestCase
    
    methods (Test)
        function testAttibuteCell(testCase)
            model = load_system('ParentTest');
            filePath = mfilename('fullpath');
            folderPath = fileparts(filePath) + "\configs";
            parser = JsonUseCasesParser(folderPath);
            [useCases, inlining, maxParentDepth] = parser.ParseConfigs();
            config = ConfigFileRun(useCases, inlining, model, maxParentDepth);
            config.evalUseCasesOnModel();
            testCase.verifyEqual(length(config.Output), 1);
            testCase.assertEqual(config.Output{1}.UseCaseId, 'NegationCellTestTrue');
        end
    end
    
end
