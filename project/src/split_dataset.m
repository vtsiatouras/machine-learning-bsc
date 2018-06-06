function [Array_1, Array_1_pos, Array_1_response, Array_2, Array_2_pos, Array_2_response, Array_3, Array_3_pos, Array_3_response, Array_4, Array_4_pos, Array_4_response, Array_5, Array_5_pos, Array_5_response] = split_dataset(Train_array, Train_array_pos, Train_array_response)

    N = length(Train_array_pos);
    Train_array_category_1 = [];
    Train_array_category_1_pos = [];
    Train_array_category_2 = [];
    Train_array_category_2_pos = [];
    Train_array_category_3 = [];
    Train_array_category_3_pos = [];
    Train_array_category_4 = [];
    Train_array_category_4_pos = [];
    Train_array_category_5 = [];
    Train_array_category_5_pos = [];
    
    % Split train dataset to 5 arrays that contain elements from same
    % category
    for i = 1:N
        if (Train_array_response(i) == 1)
            Train_array_category_1 = [Train_array_category_1 Train_array(:,i)];
            Train_array_category_1_pos = [Train_array_category_1_pos; Train_array_pos(i, 1), Train_array_pos(i, 2)];
        elseif (Train_array_response(i) == 2)
            Train_array_category_2 = [Train_array_category_2 Train_array(:,i)];
            Train_array_category_2_pos = [Train_array_category_2_pos; Train_array_pos(i, 1), Train_array_pos(i, 2)];
        elseif (Train_array_response(i) == 3)
            Train_array_category_3 = [Train_array_category_3 Train_array(:,i)];
            Train_array_category_3_pos = [Train_array_category_3_pos; Train_array_pos(i, 1), Train_array_pos(i, 2)];
        elseif (Train_array_response(i) == 4)
            Train_array_category_4 = [Train_array_category_4 Train_array(:,i)];
            Train_array_category_4_pos = [Train_array_category_4_pos; Train_array_pos(i, 1), Train_array_pos(i, 2)];
        elseif (Train_array_response(i) == 5)
            Train_array_category_5 = [Train_array_category_5 Train_array(:,i)];
            Train_array_category_5_pos = [Train_array_category_5_pos; Train_array_pos(i, 1), Train_array_pos(i, 2)];
        end
    end
    
    % Number of elements per category
    N1 = size(Train_array_category_1, 2);
    N2 = size(Train_array_category_2, 2);
    N3 = size(Train_array_category_3, 2);
    N4 = size(Train_array_category_4, 2);
    N5 = size(Train_array_category_5, 2);

    
    % Split train dataset equal and random at each cross array
    index_1 = randperm(N1, N1);
    index_2 = randperm(N2, N2);
    index_3 = randperm(N3, N3);
    index_4 = randperm(N4, N4);
    index_5 = randperm(N5, N5);
    
    Array_1 = [];
    Array_1_pos = [];
    Array_1_response = [];
    Array_2 = [];
    Array_2_pos = [];
    Array_2_response = [];
    Array_3 = [];
    Array_3_pos = [];
    Array_3_response = [];
    Array_4 = [];
    Array_4_pos = [];
    Array_4_response = [];
    Array_5 = [];
    Array_5_pos = [];
    Array_5_response = [];
    
    % Split category 1
    i = 1;
    while (i < N1)
        Array_1 = [Array_1 Train_array_category_1(:, index_1(i))];
        Array_1_pos = [Array_1_pos; Train_array_category_1_pos(i, 1), Train_array_category_1_pos(i, 2)];
        Array_1_response = [Array_1_response, 1];
        i = i + 1;
        if (i > N1)
            break;
        end
        Array_2 = [Array_2 Train_array_category_1(:, index_1(i))];
        Array_2_pos = [Array_2_pos; Train_array_category_1_pos(i, 1), Train_array_category_1_pos(i, 2)];
        Array_2_response = [Array_2_response, 1];
        i = i + 1;
        if (i > N1)
            break;
        end
        Array_3 = [Array_3 Train_array_category_1(:, index_1(i))];
        Array_3_pos = [Array_3_pos; Train_array_category_1_pos(i, 1), Train_array_category_1_pos(i, 2)];
        Array_3_response = [Array_3_response, 1];
        i = i + 1;
        if (i > N1)
            break;
        end
        Array_4 = [Array_4 Train_array_category_1(:, index_1(i))];
        Array_4_pos = [Array_4_pos; Train_array_category_1_pos(i, 1), Train_array_category_1_pos(i, 2)];
        Array_4_response = [Array_4_response, 1];
        i = i + 1;
        if (i > N1)
            break;
        end
        Array_5 = [Array_5 Train_array_category_1(:, index_1(i))];
        Array_5_pos = [Array_5_pos; Train_array_category_1_pos(i, 1), Train_array_category_1_pos(i, 2)];
        Array_5_response = [Array_5_response, 1];
        i = i + 1;
        if (i > N1)
            break;
        end
    end
    
    % Split category 2
    i = 1;
    while (i < N2)
        Array_1 = [Array_1 Train_array_category_2(:, index_2(i))];
        Array_1_pos = [Array_1_pos; Train_array_category_2_pos(i, 1), Train_array_category_2_pos(i, 2)];
        Array_1_response = [Array_1_response, 2];
        i = i + 1;
        if (i > N2)
            break;
        end
        Array_2 = [Array_2 Train_array_category_2(:, index_2(i))];
        Array_2_pos = [Array_2_pos; Train_array_category_2_pos(i, 1), Train_array_category_2_pos(i, 2)];
        Array_2_response = [Array_2_response, 2];
        i = i + 1;
        if (i > N2)
            break;
        end
        Array_3 = [Array_3 Train_array_category_2(:, index_2(i))];
        Array_3_pos = [Array_3_pos; Train_array_category_2_pos(i, 1), Train_array_category_2_pos(i, 2)];
        Array_3_response = [Array_3_response, 2];
        i = i + 1;
        if (i > N2)
            break;
        end
        Array_4 = [Array_4 Train_array_category_2(:, index_2(i))];
        Array_4_pos = [Array_4_pos; Train_array_category_2_pos(i, 1), Train_array_category_2_pos(i, 2)];
        Array_4_response = [Array_4_response, 2];
        i = i + 1;
        if (i > N2)
            break;
        end
        Array_5 = [Array_5 Train_array_category_2(:, index_2(i))];
        Array_5_pos = [Array_5_pos; Train_array_category_2_pos(i, 1), Train_array_category_2_pos(i, 2)];
        Array_5_response = [Array_5_response, 2];
        i = i + 1;
        if (i > N2)
            break;
        end
    end

    % Split category 3
    i = 1;
    while (i < N3)
        Array_1 = [Array_1 Train_array_category_3(:, index_3(i))];
        Array_1_pos = [Array_1_pos; Train_array_category_3_pos(i, 1), Train_array_category_3_pos(i, 2)];
        Array_1_response = [Array_1_response, 3];
        i = i + 1;
        if (i > N3)
            break;
        end
        Array_2 = [Array_2 Train_array_category_3(:, index_3(i))];
        Array_2_pos = [Array_2_pos; Train_array_category_3_pos(i, 1), Train_array_category_3_pos(i, 2)];
        Array_2_response = [Array_2_response, 3];
        i = i + 1;
        if (i > N3)
            break;
        end
        Array_3 = [Array_3 Train_array_category_3(:, index_3(i))];
        Array_3_pos = [Array_3_pos; Train_array_category_3_pos(i, 1), Train_array_category_3_pos(i, 2)];
        Array_3_response = [Array_3_response, 3];
        i = i + 1;
        if (i > N3)
            break;
        end
        Array_4 = [Array_4 Train_array_category_3(:, index_3(i))];
        Array_4_pos = [Array_4_pos; Train_array_category_3_pos(i, 1), Train_array_category_3_pos(i, 2)];
        Array_4_response = [Array_4_response, 3];
        i = i + 1;
        if (i > N3)
            break;
        end
        Array_5 = [Array_5 Train_array_category_3(:, index_3(i))];
        Array_5_pos = [Array_5_pos; Train_array_category_3_pos(i, 1), Train_array_category_3_pos(i, 2)];
        Array_5_response = [Array_5_response, 3];
        i = i + 1;
        if (i > N3)
            break;
        end
    end
    
    % Split category 4
    i = 1;
    while (i < N4)
        Array_1 = [Array_1 Train_array_category_4(:, index_4(i))];
        Array_1_pos = [Array_1_pos; Train_array_category_4_pos(i, 1), Train_array_category_4_pos(i, 2)];
        Array_1_response = [Array_1_response, 4];
        i = i + 1;
        if (i > N4)
            break;
        end
        Array_2 = [Array_2 Train_array_category_4(:, index_4(i))];
        Array_2_pos = [Array_2_pos; Train_array_category_4_pos(i, 1), Train_array_category_4_pos(i, 2)];
        Array_2_response = [Array_2_response, 4];
        i = i + 1;
        if (i > N4)
            break;
        end
        Array_3 = [Array_3 Train_array_category_4(:, index_4(i))];
        Array_3_pos = [Array_3_pos; Train_array_category_4_pos(i, 1), Train_array_category_4_pos(i, 2)];
        Array_3_response = [Array_3_response, 4];
        i = i + 1;
        if (i > N4)
            break;
        end
        Array_4 = [Array_4 Train_array_category_4(:, index_4(i))];
        Array_4_pos = [Array_4_pos; Train_array_category_4_pos(i, 1), Train_array_category_4_pos(i, 2)];
        Array_4_response = [Array_4_response, 4];
        i = i + 1;
        if (i > N4)
            break;
        end
        Array_5 = [Array_5 Train_array_category_4(:, index_4(i))];
        Array_5_pos = [Array_5_pos; Train_array_category_4_pos(i, 1), Train_array_category_4_pos(i, 2)];
        Array_5_response = [Array_5_response, 4];
        i = i + 1;
        if (i > N4)
            break;
        end
    end
    
    % Split category 5
    i = 1;
    while (i < N5)
        Array_1 = [Array_1 Train_array_category_5(:, index_5(i))];
        Array_1_pos = [Array_1_pos; Train_array_category_5_pos(i, 1), Train_array_category_5_pos(i, 2)];
        Array_1_response = [Array_1_response, 5];
        i = i + 1;
        if (i > N5)
            break;
        end
        Array_2 = [Array_2 Train_array_category_5(:, index_5(i))];
        Array_2_pos = [Array_2_pos; Train_array_category_5_pos(i, 1), Train_array_category_5_pos(i, 2)];
        Array_2_response = [Array_2_response, 5];
        i = i + 1;
        if (i > N5)
            break;
        end
        Array_3 = [Array_3 Train_array_category_5(:, index_5(i))];
        Array_3_pos = [Array_3_pos; Train_array_category_5_pos(i, 1), Train_array_category_5_pos(i, 2)];
        Array_3_response = [Array_3_response, 5];
        i = i + 1;
        if (i > N5)
            break;
        end
        Array_4 = [Array_4 Train_array_category_5(:, index_5(i))];
        Array_4_pos = [Array_4_pos; Train_array_category_5_pos(i, 1), Train_array_category_5_pos(i, 2)];
        Array_4_response = [Array_4_response, 5];
        i = i + 1;
        if (i > N5)
            break;
        end
        Array_5 = [Array_5 Train_array_category_5(:, index_5(i))];
        Array_5_pos = [Array_5_pos; Train_array_category_5_pos(i, 1), Train_array_category_5_pos(i, 2)];
        Array_5_response = [Array_5_response, 5];
        i = i + 1;
        if (i > N5)
            break;
        end
    end

end
