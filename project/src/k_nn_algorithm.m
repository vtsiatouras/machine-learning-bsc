function k_nn_algorithm(Train_array, Train_array_response, Validation_array, Validation_array_pos, Validation_array_response, k, Mode)
    % Vector containing the class labels of
    output = [];
    
    % K-NN algorithm
    for i=1:size(Validation_array, 2)
        validation_point = Validation_array(:, i)';
        distances = [];
        for j=1:size(Train_array, 2)
            train_point = Train_array(:, j)';
            distance = pdist2(validation_point, train_point, 'euclidean');
            distances = [distances; distance, Train_array_response(j)];
        end
        % Sort k_nearest with min distances
        sorted_distances = sortrows(distances);
        top_k = sorted_distances(1:k,:);
        neighbors_category_1 = sum(top_k(:,2) == 1);
        neighbors_category_2 = sum(top_k(:,2) == 2);
        neighbors_category_3 = sum(top_k(:,2) == 3);
        neighbors_category_4 = sum(top_k(:,2) == 4);
        neighbors_category_5 = sum(top_k(:,2) == 5);
        
        % Find the maximum probability
        neighbors = [neighbors_category_1 neighbors_category_2 neighbors_category_3 neighbors_category_4 neighbors_category_5];
        max_neighbors = max(neighbors);
        if (isequal(max_neighbors, neighbors_category_1))
            output = [output 1];
        elseif (isequal(max_neighbors, neighbors_category_2))
            output = [output 2];
        elseif (isequal(max_neighbors, neighbors_category_3))
            output = [output 3];
        elseif (isequal(max_neighbors, neighbors_category_4))
            output = [output 4];
        elseif (isequal(max_neighbors, neighbors_category_5))
            output = [output 5];
        end
               
    end
    
    classifier_stats(output, Validation_array_response, Validation_array_pos, Mode, 'k-NN');
end