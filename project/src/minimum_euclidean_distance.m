% Minimum Euclidean Distance Implementation

function minimum_euclidean_distance(Train_array, Train_array_pos, Train_array_response, Test_array, Test_array_pos, Test_array_response, Operational_array, Operational_array_pos, Operational_array_response)
    % Plot datasets
    plot_dataset(Train_array_pos, Train_array_response, 'Train Dataset');
    plot_dataset(Test_array_pos, Test_array_response, 'Test Dataset');
    plot_dataset(Operational_array_pos, Operational_array_response, 'Operational Dataset');
    
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
    % Vector containing the class labels of
    output = [];

    N_Test = length(Test_array_pos);
    for i = 1:N_Test
        point = Test_array(:, i)';
        distance_1 = pdist2(point, m1, 'euclidean');
        distance_2 = pdist2(point, m2, 'euclidean');
        distance_3 = pdist2(point, m3, 'euclidean');
        distance_4 = pdist2(point, m4, 'euclidean');
        distance_5 = pdist2(point, m5, 'euclidean');
        
        % Find the minimum distance
        distances = [distance_1 distance_2 distance_3 distance_4 distance_5];
        min_distance= min(distances);
        if (isequal(min_distance, distance_1))
            output = [output 1];
        elseif (isequal(min_distance, distance_2))
            output = [output 2];
        elseif (isequal(min_distance, distance_3))
            output = [output 3];
        elseif (isequal(min_distance, distance_4))
            output = [output 4];
        elseif (isequal(min_distance, distance_5))
            output = [output 5];
        end
       
    end
    
    classifier_stats(output, Test_array_response, Test_array_pos, 'Test Dataset', 'Minimum Euclidean Distance');
    
    fprintf('\n##########################\n');
    fprintf('      OPERATIONAL SET\n')
    fprintf('##########################\n');
    % Vector containing the class labels of
    output = [];

    N_Operational = length(Operational_array_pos);
    for i = 1:N_Operational
        point = Operational_array(:, i)';
        distance_1 = pdist2(point, m1, 'euclidean');
        distance_2 = pdist2(point, m2, 'euclidean');
        distance_3 = pdist2(point, m3, 'euclidean');
        distance_4 = pdist2(point, m4, 'euclidean');
        distance_5 = pdist2(point, m5, 'euclidean');
        
        % Find the minimum distance
        distances = [distance_1 distance_2 distance_3 distance_4 distance_5];
        min_distance= min(distances);
        if (isequal(min_distance, distance_1))
            output = [output 1];
        elseif (isequal(min_distance, distance_2))
            output = [output 2];
        elseif (isequal(min_distance, distance_3))
            output = [output 3];
        elseif (isequal(min_distance, distance_4))
            output = [output 4];
        elseif (isequal(min_distance, distance_5))
            output = [output 5];
        end
       
    end
    
    classifier_stats(output, Operational_array_response, Operational_array_pos, 'Operational Dataset', 'Minimum Euclidean Distance');
    
end