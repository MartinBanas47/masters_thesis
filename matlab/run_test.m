function config = run_test()


%model = load_system('const_in_subsystem');
model = load_system('ParentTest');
folderPath = "configs";
parser = JsonUseCasesParser(folderPath);
[useCases, inlining, maxParentDepth] = parser.ParseConfigs();
config = ConfigFileRun(useCases, inlining, model, maxParentDepth);

disp("Eval:")
config.evalUseCasesOnModel();


printer = UseCasesOutputPrinter(config.Output);
printer.PrintJsonToConsole();
printer.PrintJsonToFile("test.json");
end






%TEST: 2x same class if it makes problem
%case: config2 = ConfigFileRun(jsondecode(json), model);