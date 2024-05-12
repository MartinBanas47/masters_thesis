function config = run_test()

addpath(genpath('Classes'));
addpath(genpath('configs'));
addpath(genpath('Functions'));
addpath(genpath('Test'));

%evalin('base', 'global memHitCnt;');
%memHitCnt = 0;

%evalin('base', 'global memMaxVal;');
%memMaxVal = 0;


global memHitCnt;
memHitCnt = 0;

global memMaxVal;
memMaxVal = 0;

[~, memAtStart] = tryMemoryScan(0, 0);

%model = load_system('model1');
model = load_system('ParentTest');
folderPath = "configs";
parser = JsonUseCasesParser(folderPath);
[useCases, inlining, maxParentDepth] = parser.ParseConfigs();
config = ConfigFileRun(useCases, inlining, model, maxParentDepth);
config.evalUseCasesOnModel();
JsonUseCasesOutputPrinter.printToFile(config.Output, "test.json");

fprintf("number of evaluated cells: %d\nmemory at start: %d\nmaximum memory allocation: %d\n" + ...
  "calculated memory: %d\n", memHitCnt, memAtStart, memMaxVal, (memMaxVal - memAtStart));
end