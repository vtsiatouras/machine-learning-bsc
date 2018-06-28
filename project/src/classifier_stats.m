function accuracy = classifier_stats(Results, Dataset_array_response)
    
    N = size(Results, 2);
    errors = 0;
   
    for i = 1:N
        
        if(Results(i) ~= Dataset_array_response(i))
            errors = errors + 1;
        end
           
    end    
    
    correct = N - errors;
    accuracy = (correct/N) * 100;
    fprintf('Accuracy: %.2f%%\nErrors: %d\n', accuracy, errors);
    
    C = confusionmat(Dataset_array_response, Results);
    disp(C);
    
end
