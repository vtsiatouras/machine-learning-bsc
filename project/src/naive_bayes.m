% Naive Bayes Implementation

function naive_bayes(Train_array, Train_array_pos, Train_array_response, Test_array, Test_array_pos, Test_array_response, Operational_array, Operational_array_pos, Operational_array_response)
    
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
    % Vector containing the class labels of test set
    test_set_estimations = [];
    N_Test = length(Test_array_pos);
    for i = 1:N_Test
        point = Test_array(:, i)';

        % Calculate normal distribution probabilities
        p1 = normpdf(point, m1_ML, s1);
        p2 = normpdf(point, m2_ML, s2);
        p3 = normpdf(point, m3_ML, s3);
        p4 = normpdf(point, m4_ML, s4);
        p5 = normpdf(point, m5_ML, s5);
        
        % Calulate Sum(log(p(Xi|Ck)
        p1_sum = sum(log(p1));
        p2_sum = sum(log(p2));
        p3_sum = sum(log(p3));
        p4_sum = sum(log(p4));
        p5_sum = sum(log(p5));
        
        % Apply Bayes with logarithm
        % argmax(k) (log(P(Ck) + Sum(log(p(Xi|Ck))
        bayes_rule_1 = [log(P1)+p1_sum 1];
        bayes_rule_2 = [log(P2)+p2_sum 2]; 
        bayes_rule_3 = [log(P3)+p3_sum 3];
        bayes_rule_4 = [log(P4)+p4_sum 4];
        bayes_rule_5 = [log(P5)+p5_sum 5];

        % Find the maximum probability
        bayes_rule = [bayes_rule_1; bayes_rule_2; bayes_rule_3; bayes_rule_4; bayes_rule_5];
        [max_probability, index_max] = max(bayes_rule(:,1));
        test_set_estimations = [test_set_estimations bayes_rule(index_max, 2)];

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

       % Calculate normal distribution probabilities
        p1 = normpdf(point, m1_ML, s1);
        p2 = normpdf(point, m2_ML, s2);
        p3 = normpdf(point, m3_ML, s3);
        p4 = normpdf(point, m4_ML, s4);
        p5 = normpdf(point, m5_ML, s5);
        
        % Calulate Sum(log(p(Xi|Ck)
        p1_sum = sum(log(p1));
        p2_sum = sum(log(p2));
        p3_sum = sum(log(p3));
        p4_sum = sum(log(p4));
        p5_sum = sum(log(p5));
        
        % Apply Bayes log formula
        % argmax(k) (log(P(Ck) + Sum(log(p(Xi|Ck))
        bayes_rule_1 = [log(P1)+p1_sum 1];
        bayes_rule_2 = [log(P2)+p2_sum 2]; 
        bayes_rule_3 = [log(P3)+p3_sum 3];
        bayes_rule_4 = [log(P4)+p4_sum 4];
        bayes_rule_5 = [log(P5)+p5_sum 5];

        % Find the maximum probability
        bayes_rule = [bayes_rule_1; bayes_rule_2; bayes_rule_3; bayes_rule_4; bayes_rule_5];
        [max_probability, index_max] = max(bayes_rule(:,1));
        operational_set_estimations = [operational_set_estimations bayes_rule(index_max, 2)];
    end
       
    classifier_stats(operational_set_estimations, Operational_array_response);
    
    result_array_response = [Train_array_response test_set_estimations operational_set_estimations];
    result_array_pos = [Train_array_pos; Test_array_pos; Operational_array_pos];
    plot_dataset(result_array_pos, result_array_response, 'Naive Bayes Result');
    
end
