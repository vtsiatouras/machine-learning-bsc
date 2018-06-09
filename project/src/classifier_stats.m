function accuracy = classifier_stats(Results, Dataset_array_response, Dataset_array_pos, Dataset_name, Classifier_name)
    
    N = length(Dataset_array_pos);
    errors = 0;
    figure('Name', strcat(Dataset_name," ", Classifier_name), 'NumberTitle','off'), axis equal
    hold on
    
    for i = 1:N
        
        if(Results(i) ~= Dataset_array_response(i))
            errors = errors + 1;
        end
        
        if(isequal(Results(i),1))
            plot(Dataset_array_pos(i,1), Dataset_array_pos(i,2), 'b*');
        elseif(isequal(Results(i),2))
            plot(Dataset_array_pos(i,1), Dataset_array_pos(i,2), 'r*');
        elseif(isequal(Results(i),3))
            plot(Dataset_array_pos(i,1), Dataset_array_pos(i,2), 'g*');
        elseif(isequal(Results(i),4))
            plot(Dataset_array_pos(i,1), Dataset_array_pos(i,2), 'y*');
        elseif(isequal(Results(i),5))
            plot(Dataset_array_pos(i,1), Dataset_array_pos(i,2), 'm*'); 
        end
        
    end    
    
    hold off
    drawnow('update');
        
    correct = N - errors;
    accuracy = (correct/N) * 100;
    fprintf('Accuracy: %.2f%%\nErrors: %d\n', accuracy, errors);
    
    C = confusionmat(Dataset_array_response, Results);
    disp(C);
    
end