classdef JsonUseCasesOutputPrinterTest < matlab.unittest.TestCase
    
    methods (Test)
        
        function testPrintToFile(testCase)
            % Test printing to file
            
            % Create sample use cases results
            useCasesResults = struct();
            useCasesResults.useCase1 = struct('result', 'success');
            useCasesResults.useCase2 = struct('result', 'failure');
            
            % Create JsonUseCasesOutputPrinter object
            printer = JsonUseCasesOutputPrinter(useCasesResults);
            
            % Define expected file path and content
            expectedFilePath = 'output.json';
            expectedContent = '{"useCase1":{"result":"success"},"useCase2":{"result":"failure"}}';
            
            % Call the printToFile method
            printer.printToFile(expectedFilePath);
            
            % Verify that the file was created and contains the expected content
            actualContent = fileread(expectedFilePath);
            testCase.verifyEqual(actualContent, expectedContent);
            
            % Clean up the created file
            delete(expectedFilePath);
        end
        
        function testPrintToConsole(testCase)
            % Test printing to console
            
            % Create sample use cases results
            useCasesResults = struct();
            useCasesResults.useCase1 = struct('result', 'success');
            useCasesResults.useCase2 = struct('result', 'failure');
            
            % Create JsonUseCasesOutputPrinter object
            printer = JsonUseCasesOutputPrinter(useCasesResults);
            
            % Capture the output of the printToConsole method
            consoleOutput = evalc('printer.printToConsole()');
            
            % Define the expected console output
            expectedOutput = '{"useCase1":{"result":"success"},"useCase2":{"result":"failure"}}';
            expectedOutput = [expectedOutput, newline];
            
            % Verify that the console output matches the expected output
            testCase.verifyEqual(consoleOutput, expectedOutput);
        end
        
    end
    
end