function config = run_test()

addpath(genpath('Classes'));
addpath(genpath('configs'));
addpath(genpath('Functions'));
addpath(genpath('Test'));

model = load_system('ParentTest');
folderPath = "configs";
parser = JsonUseCasesParser(folderPath);
[useCases, inlining, maxParentDepth] = parser.ParseConfigs();
config = ConfigFileRun(useCases, inlining, model, maxParentDepth);
config.evalUseCasesOnModel();
JsonUseCasesOutputPrinter.printToFile(config.Output, "test.json");
end