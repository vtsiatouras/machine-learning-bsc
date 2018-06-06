% Naive Bayes Implementation

function naive_bayes(Train_array, Train_array_pos, Train_array_response, Test_array, Test_array_pos, Test_array_response, Operational_array, Operational_array_pos, Operational_array_response)
    
    % Plot datasets
    plot_dataset(Train_array_pos, Train_array_response, 'Train Dataset');
    plot_dataset(Test_array_pos, Test_array_response, 'Test Dataset');
    plot_dataset(Operational_array_pos, Operational_array_response, 'Operational Dataset');
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
    
    % Number of elements per category
    N1 = size(Train_array_category_1, 1);
    N2 = size(Train_array_category_2, 1);
    N3 = size(Train_array_category_3, 1);
    N4 = size(Train_array_category_4, 1);
    N5 = size(Train_array_category_5, 1);

    % Sigma of the categories
    s1 = std(Train_array_category_1);
    s2 = std(Train_array_category_2);
    s3 = std(Train_array_category_3);
    s4 = std(Train_array_category_4);
    s5 = std(Train_array_category_5);

    % Maximum likelihood estimates of the means
    m1_ML = mean(Train_array_category_1);
    m2_ML = mean(Train_array_category_2);
    m3_ML = mean(Train_array_category_3);
    m4_ML = mean(Train_array_category_4);
    m5_ML = mean(Train_array_category_5);

    % Estimation of the a priori probabilities
    P1 = N1/(N);
    P2 = N2/(N);
    P3 = N3/(N);
    P4 = N4/(N);
    P5 = N5/(N);
    
    fprintf('##########################\n');
    fprintf('        TEST SET\n')
    fprintf('##########################\n');
    % Vector containing the class labels of
    output = [];

    N_Test = length(Test_array_pos);
    for i = 1:N_Test
        point = Test_array(:, i)';

        % Calculate normal distribution probabilities
        p1 = normcdf(point, m1_ML, s1);
        p2 = normcdf(point, m2_ML, s2);
        p3 = normcdf(point, m3_ML, s3);
        p4 = normcdf(point, m4_ML, s4);
        p5 = normcdf(point, m5_ML, s5);

        % Calculate the product of p1, p2, ..., p204
        p1_prod = prod(p1);
        p2_prod = prod(p2);
        p3_prod = prod(p3);
        p4_prod = prod(p4);
        p5_prod = prod(p5);

        % Application of the Bayes rule
        bayes_rule_1 = P1*p1_prod;
        bayes_rule_2 = P2*p2_prod; 
        bayes_rule_3 = P3*p3_prod;
        bayes_rule_4 = P4*p4_prod;
        bayes_rule_5 = P5*p5_prod;

        % Find the maximum probability
        bayes_rule = [bayes_rule_1 bayes_rule_2 bayes_rule_3 bayes_rule_4 bayes_rule_5];
        max_probability = max(bayes_rule);
        if (isequal(max_probability, bayes_rule_1))
            output = [output 1];
        elseif (isequal(max_probability, bayes_rule_2))
            output = [output 2];
        elseif (isequal(max_probability, bayes_rule_3))
            output = [output 3];
        elseif (isequal(max_probability, bayes_rule_4))
            output = [output 4];
        elseif (isequal(max_probability, bayes_rule_5))
            output = [output 5];
        end
    end
    
    classifier_stats(output, Test_array_response, Test_array_pos, 'Test Dataset', 'Naive Bayes');
   
    
    fprintf('\n##########################\n');
    fprintf('      OPERATIONAL SET\n')
    fprintf('##########################\n');
    % Vector containing the class labels of
    output = [];
    N_Operational = length(Operational_array_pos);
    for i = 1:N_Operational
        point = Operational_array(:, i)';

        % Calculate normal distribution probabilities
        p1 = normcdf(point, m1_ML, s1);
        p2 = normcdf(point, m2_ML, s2);
        p3 = normcdf(point, m3_ML, s3);
        p4 = normcdf(point, m4_ML, s4);
        p5 = normcdf(point, m5_ML, s5);

        % Calculate the product of p1, p2, ..., p204
        p1_prod = prod(p1);
        p2_prod = prod(p2);
        p3_prod = prod(p3);
        p4_prod = prod(p4);
        p5_prod = prod(p5);

        % Application of the Bayes rule
        bayes_rule_1 = P1*p1_prod;
        bayes_rule_2 = P2*p2_prod; 
        bayes_rule_3 = P3*p3_prod;
        bayes_rule_4 = P4*p4_prod;
        bayes_rule_5 = P5*p5_prod;

        % Find the maximum probability
        bayes_rule = [bayes_rule_1 bayes_rule_2 bayes_rule_3 bayes_rule_4 bayes_rule_5];
        max_probability = max(bayes_rule);
        if (isequal(max_probability, bayes_rule_1))
            output = [output 1];
        elseif (isequal(max_probability, bayes_rule_2))
            output = [output 2];
        elseif (isequal(max_probability, bayes_rule_3))
            output = [output 3];
        elseif (isequal(max_probability, bayes_rule_4))
            output = [output 4];
        elseif (isequal(max_probability, bayes_rule_5))
            output = [output 5];
        end
    end
    
    classifier_stats(output, Operational_array_response, Operational_array_pos, 'Operational Dataset', 'Naive Bayes');
    
end
