function config = run_test()

addpath(genpath('Classes'));
addpath(genpath('configs'));
addpath(genpath('Functions'));
addpath(genpath('Test'));

model = load_system('ParentTest');
t1 = datetime;
folderPath = "configs";
parser = JsonUseCasesParser(folderPath);
[useCases, inlining, maxParentDepth] = parser.ParseConfigs();
config = ConfigFileRun(useCases, inlining, model, maxParentDepth);
config.evalUseCasesOnModel();
JsonUseCasesOutputPrinter.printToFile(config.Output, "test.json");
t2 = datetime;
dif = milliseconds(t2-t1);
fprintf('Time: %0.6e', dif);
end