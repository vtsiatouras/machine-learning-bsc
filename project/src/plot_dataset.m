function plot_dataset(Dataset_array_pos, Dataset_array_response, Dataset_name)

    N = length(Dataset_array_pos);
    Dataset_array_category_1_pos = [];
    Dataset_array_category_2_pos = [];
    Dataset_array_category_3_pos = [];
    Dataset_array_category_4_pos = [];
    Dataset_array_category_5_pos = [];
    
    % Split train dataset to 5 arrays that contain elements from same
    % category
    for i = 1:N
        
        if (Dataset_array_response(i) == 1)
            Dataset_array_category_1_pos = [Dataset_array_category_1_pos; Dataset_array_pos(i, 1), Dataset_array_pos(i, 2)];
        elseif (Dataset_array_response(i) == 2)
            Dataset_array_category_2_pos = [Dataset_array_category_2_pos; Dataset_array_pos(i, 1), Dataset_array_pos(i, 2)];
        elseif (Dataset_array_response(i) == 3)
            Dataset_array_category_3_pos = [Dataset_array_category_3_pos; Dataset_array_pos(i, 1), Dataset_array_pos(i, 2)];
        elseif (Dataset_array_response(i) == 4)
            Dataset_array_category_4_pos = [Dataset_array_category_4_pos; Dataset_array_pos(i, 1), Dataset_array_pos(i, 2)];
        elseif (Dataset_array_response(i) == 5)
            Dataset_array_category_5_pos = [Dataset_array_category_5_pos; Dataset_array_pos(i, 1), Dataset_array_pos(i, 2)];
        end
        
    end
    
    % Plot dataset
    figure('Name', Dataset_name,'NumberTitle','off'), axis equal
    hold on
    plot(Dataset_array_category_1_pos(:,1), Dataset_array_category_1_pos(:,2), 'b*');
    plot(Dataset_array_category_2_pos(:,1), Dataset_array_category_2_pos(:,2), 'r*');
    plot(Dataset_array_category_3_pos(:,1), Dataset_array_category_3_pos(:,2), 'g*');
    plot(Dataset_array_category_4_pos(:,1), Dataset_array_category_4_pos(:,2), 'y*');
    plot(Dataset_array_category_5_pos(:,1), Dataset_array_category_5_pos(:,2), 'm*');
    hold off;
        
end