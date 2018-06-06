function k_nn_cross_validation (Train_array, Train_array_pos, Train_array_response, k)

    % Cross validation arrays
    Cross_array_1 = [];
    Cross_array_1_pos = [];
    Cross_array_1_response = [];
    Cross_array_2 = [];
    Cross_array_2_pos = [];
    Cross_array_2_response = [];
    Cross_array_3 = [];
    Cross_array_3_pos = [];
    Cross_array_3_response = [];
    Cross_array_4 = [];
    Cross_array_4_pos = [];
    Cross_array_4_response = [];
    Cross_array_5 = [];
    Cross_array_5_pos = [];
    Cross_array_5_response = [];
    
    [Cross_array_1, Cross_array_1_pos, Cross_array_1_response, Cross_array_2, Cross_array_2_pos, Cross_array_2_response, Cross_array_3, Cross_array_3_pos, Cross_array_3_response, Cross_array_4, Cross_array_4_pos, Cross_array_4_response, Cross_array_5, Cross_array_5_pos, Cross_array_5_response] = split_dataset(Train_array, Train_array_pos, Train_array_response);
   
    Train_array_1 = [Cross_array_2 Cross_array_3 Cross_array_4 Cross_array_5];
    Train_array_1_response = [Cross_array_2_response Cross_array_3_response Cross_array_4_response Cross_array_5_response];
    Train_array_2 = [Cross_array_1 Cross_array_3 Cross_array_4 Cross_array_5];
    Train_array_2_response = [Cross_array_1_response Cross_array_3_response Cross_array_4_response Cross_array_5_response];
    Train_array_3 = [Cross_array_1 Cross_array_2 Cross_array_4 Cross_array_5];
    Train_array_3_response = [Cross_array_1_response Cross_array_2_response Cross_array_4_response Cross_array_5_response];
    Train_array_4 = [Cross_array_1 Cross_array_2 Cross_array_3 Cross_array_5];
    Train_array_4_response = [Cross_array_1_response Cross_array_2_response Cross_array_3_response Cross_array_5_response];
    Train_array_5 = [Cross_array_1 Cross_array_2 Cross_array_3 Cross_array_4];
    Train_array_5_response = [Cross_array_1_response Cross_array_2_response Cross_array_3_response Cross_array_4_response];
    
    k_nn_algorithm(Train_array_1, Train_array_1_response, Cross_array_1, Cross_array_1_pos, Cross_array_1_response, k, "Fold 1");
    k_nn_algorithm(Train_array_2, Train_array_2_response, Cross_array_2, Cross_array_2_pos, Cross_array_2_response, k, "Fold 2");
    k_nn_algorithm(Train_array_3, Train_array_3_response, Cross_array_3, Cross_array_3_pos, Cross_array_3_response, k, "Fold 3");
    k_nn_algorithm(Train_array_4, Train_array_4_response, Cross_array_4, Cross_array_4_pos, Cross_array_4_response, k, "Fold 4");
    k_nn_algorithm(Train_array_5, Train_array_5_response, Cross_array_5, Cross_array_5_pos, Cross_array_5_response, k, "Fold 5");
        
end