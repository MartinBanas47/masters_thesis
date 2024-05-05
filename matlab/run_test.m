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


printer = JsonUseCasesOutputPrinter(config.Output);
printer.printToConsole();
printer.printToFile("test.json");
end






%TEST: 2x same class if it makes problem
%case: config2 = ConfigFileRun(jsondecode(json), model);