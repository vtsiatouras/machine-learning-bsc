% Minimum Euclidean Distance Implementation
function minimum_euclidean_distance(Train_array, Train_array_pos, Train_array_response, Test_array, Test_array_pos, Test_array_response, Operational_array, Operational_array_pos, Operational_array_response)
    
    tic;
    
    % Plot datasets   
    complete_dataset_array_response = [Train_array_response Test_array_response Operational_array_response];
    complete_dataset_array_pos = [Train_array_pos; Test_array_pos; Operational_array_pos];
    plot_dataset(complete_dataset_array_pos, complete_dataset_array_response, 'Complete Dataset');
    drawnow('update');
    
    N = length(Train_array_pos);
    Train_array_category_1 = [];
    Train_array_category_2 = [];
    Train_array_category_3 = [];
    Train_array_category_4 = [];
    Train_array_category_5 = [];

    % Split train dataset to 5 arrays that contain elements from same
    % category
    for i = 1:N
        if (Train_array_response(i) == 1)
            Train_array_category_1 = [Train_array_category_1 Train_array(:,i)]; 
        elseif (Train_array_response(i) == 2)
            Train_array_category_2 = [Train_array_category_2 Train_array(:,i)];
        elseif (Train_array_response(i) == 3)
            Train_array_category_3 = [Train_array_category_3 Train_array(:,i)];
        elseif (Train_array_response(i) == 4)
            Train_array_category_4 = [Train_array_category_4 Train_array(:,i)];
        elseif (Train_array_response(i) == 5)
            Train_array_category_5 = [Train_array_category_5 Train_array(:,i)];
        end
    end
    
    % Invert train category arrays for easiest manipulation
    Train_array_category_1 = Train_array_category_1';
    Train_array_category_2 = Train_array_category_2';
    Train_array_category_3 = Train_array_category_3';
    Train_array_category_4 = Train_array_category_4';
    Train_array_category_5 = Train_array_category_5';

    % Means
    m1 = mean(Train_array_category_1);
    m2 = mean(Train_array_category_2);
    m3 = mean(Train_array_category_3);
    m4 = mean(Train_array_category_4);
    m5 = mean(Train_array_category_5);
    
    fprintf('##########################\n');
    fprintf('        TEST SET\n')
    fprintf('##########################\n');
    % Vector containing the class labels of test set
    test_set_estimations = [];

    N_Test = length(Test_array_pos);
    for i = 1:N_Test
        point = Test_array(:, i)';
        distance_1 = [pdist2(point, m1, 'euclidean') 1];
        distance_2 = [pdist2(point, m2, 'euclidean') 2];
        distance_3 = [pdist2(point, m3, 'euclidean') 3];
        distance_4 = [pdist2(point, m4, 'euclidean') 4];
        distance_5 = [pdist2(point, m5, 'euclidean') 5];
        
        % Find the minimum distance
        distances = [distance_1; distance_2; distance_3; distance_4; distance_5];
        [min_distance, index_min] = min(distances(:,1));
        test_set_estimations = [test_set_estimations distances(index_min, 2)];       
    end
    
    classifier_stats(test_set_estimations, Test_array_response);
   
    fprintf('\n##########################\n');
    fprintf('      OPERATIONAL SET\n')
    fprintf('##########################\n');
    % Vector containing the class labels of operational set
    operational_set_estimations = [];

    N_Operational = length(Operational_array_pos);
    for i = 1:N_Operational
        point = Operational_array(:, i)';
        distance_1 = [pdist2(point, m1, 'euclidean') 1];
        distance_2 = [pdist2(point, m2, 'euclidean') 2];
        distance_3 = [pdist2(point, m3, 'euclidean') 3];
        distance_4 = [pdist2(point, m4, 'euclidean') 4];
        distance_5 = [pdist2(point, m5, 'euclidean') 5];
        
        % Find the minimum distance
        distances = [distance_1; distance_2; distance_3; distance_4; distance_5];
        [min_distance, index_min] = min(distances(:,1));
        operational_set_estimations = [operational_set_estimations distances(index_min, 2)];       
    end
        
    classifier_stats(operational_set_estimations, Operational_array_response);
    
    result_array_response = [Train_array_response test_set_estimations operational_set_estimations];
    result_array_pos = [Train_array_pos; Test_array_pos; Operational_array_pos];
    plot_dataset(result_array_pos, result_array_response, 'Minimum Euclidean Distance Result');
    
    time = toc;
    fprintf('\nClassification Execution Time: %f seconds\n', time);
    
end