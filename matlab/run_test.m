function config = run_test()

addpath(genpath('Classes'));
addpath(genpath('configs'));
addpath(genpath('Functions'));
addpath(genpath('Test'));

model = load_system('TestModel');
folderPath = "configs";
t1 = datetime;
parser = JsonConfigurationFileParser(folderPath);
[useCases, inlining, maxParentDepth] = parser.parseConfigs();
config = ConfigFileRun(useCases, inlining, model, maxParentDepth);
config.evalUseCasesOnModel();
JsonUseCasesOutputPrinter.printToFile(config.Output, "test.json");
t2 = datetime;
dif = milliseconds(t2-t1);
fprintf('Time: %0.6e', dif);
end