% K Nearest Neighbors Implementation

function k_nn(Train_array, Train_array_pos, Train_array_response, Test_array, Test_array_pos, Test_array_response, Operational_array, Operational_array_pos, Operational_array_response)

    % Plot datasets
    plot_dataset(Train_array_pos, Train_array_response, 'Train Dataset');
    plot_dataset(Test_array_pos, Test_array_response, 'Test Dataset');
    plot_dataset(Operational_array_pos, Operational_array_response, 'Operational Dataset');
    
    k = '';
   
    % Command prompts to initialize k with users desired value
    cont1 = true;
    while(cont1)
        
        cont2 = true;
        while (cont2)
            prompt = 'Enter number of k neighbors (integers 1-17 are allowed)\n';
            k = input(prompt);
            if(k > 1 && k < 17)
                cont2 = false;
            end
        end
        
        % Make a 5-fold cross validation
        k_nn_5_fold_cross_validation (Train_array, Train_array_pos, Train_array_response, k);
        
        cont3 = true;
        while(cont3)
            prompt = 'Do you wish to continue classification with this value of k? (y/n)\n';
            answer = input(prompt,'s');
            if (isequal(answer, 'y') || isequal(answer, 'Y'))
                cont1 = false;
                cont3 = false;
            elseif (isequal(answer, 'n') || isequal(answer, 'N'))
                cont1 = true;
                cont3 = false;
            else
                cont3 = true;
            end
        end
    end
    
    fprintf('##########################\n');
    fprintf('        TEST SET\n')
    fprintf('##########################\n');
    k_nn_algorithm(Train_array, Train_array_response, Test_array, Test_array_pos, Test_array_response, k, "Test");
    
    fprintf('\n##########################\n');
    fprintf('      OPERATIONAL SET\n')
    fprintf('##########################\n');
    k_nn_algorithm(Train_array, Train_array_response, Operational_array, Operational_array_pos, Operational_array_response, k, "Operational");
    
    
end