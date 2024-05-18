classdef JsonUseCasesOutputPrinterTest < matlab.unittest.TestCase
    
    methods (Test)
        
        function testPrintToFile(testCase)
            % Test printing to file
            
            % Create sample use cases results
            useCasesResults = struct();
            useCasesResults.useCase1 = struct('result', 'success');
            useCasesResults.useCase2 = struct('result', 'failure');
            
            
            % Define expected file path and content
            expectedFilePath = 'output.json';
            expectedContent = '{"useCase1":{"result":"success"},"useCase2":{"result":"failure"}}';
            
            % Call the printToFile method
            JsonUseCasesOutputPrinter.printToFile(useCasesResults,expectedFilePath);
            
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
            
            
            % Capture the output of the printToConsole method
            consoleOutput = evalc('JsonUseCasesOutputPrinter.printToConsole(useCasesResults)');
            
            % Define the expected console output
            expectedOutput = '{"useCase1":{"result":"success"},"useCase2":{"result":"failure"}}';
            expectedOutput = [expectedOutput, newline];
            
            % Verify that the console output matches the expected output
            testCase.verifyEqual(consoleOutput, expectedOutput);
        end
        
    end
    
end