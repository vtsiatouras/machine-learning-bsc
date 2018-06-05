% This is a supporting MATLAB file for the project

clear
format compact
close all

load Salinas_hyperspectral %Load the Salinas hypercube called "Salinas_Image"
[p, n, l] = size(Salinas_Image) % p,n define the spatial resolution of the image, while l is the number of bands (number of features for each pixel)

load classification_labels
% This file contains three arrays of dimension 22500x1 each, called
% "Training_Set", "Test_Set" and "Operational_Set". In order to bring them
% in an 150x150 image format we use the command "reshape" as follows:
Training_Set_Image = reshape(Training_Set, p, n); % In our case p=n=150 (spatial dimensions of the Salinas image).
Test_Set_Image = reshape(Test_Set, p, n);
Operational_Set_Image = reshape(Operational_Set, p, n);

%Depicting the various bands of the Salinas image
for i = 1:l
    figure(1), imagesc(Salinas_Image(:, :, i))
    pause(0.05) % This command freezes figure(1) for 0.05sec.
end

% Depicting the training, test and operational sets of pixels (for the
% pixels depicted with a dark blue color, the class label is not known.
% Each one of the other colors in the following figures indicate a class).
figure(2), imagesc(Training_Set_Image)
figure(3), imagesc(Test_Set_Image)
figure(4), imagesc(Operational_Set_Image)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRAIN SET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constructing the 204xN array whose columns are the vectors corresponding to the
% N vectors (pixels) of the training set (similar codes cane be used for
% the test and the operational sets).
Train = zeros(p, n, l); % This is a 3-dim array, which will contain nonzero values only for the training pixels
for i = 1:l
    %Multiply elementwise each band of the Salinas_Image with the mask
    % "Training_Set_Image>0", which identifies only the training vectors.
    Train(:, :, i) = Salinas_Image(:, :, i) .* (Training_Set_Image > 0);
    figure(5), imagesc(Train(:, :, i)) % Depict the training set per band
    pause(0.05)
end

Train_array = []; %This is the wanted 204xN array
Train_array_response = []; % This vector keeps the label of each of the training pixels
Train_array_pos = []; % This array keeps (in its rows) the position of the training pixels in the image.
for i = 1:p
    for j = 1:n
        if (Training_Set_Image(i, j) > 0) %Check if the (i,j) pixel is a training pixel
            Train_array = [Train_array squeeze(Train(i, j, :))];
            Train_array_response = [Train_array_response Training_Set_Image(i, j)];
            Train_array_pos = [Train_array_pos; i j];
        end
    end
end

%disp(Train_array);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TEST SET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constructing the 204xN array whose columns are the vectors corresponding to the
% N vectors (pixels) of the test set (similar codes cane be used for
% the test and the operational sets).
% Test=zeros(p,n,l); % This is a 3-dim array, which will contain nonzero values only for the training pixels
% for i=1:l
%      %Multiply elementwise each band of the Salinas_Image with the mask
%      % "Training_Set_Image>0", which identifies only the training vectors.
%     Test(:,:,i)=Salinas_Image(:,:,i).*(Test_Set_Image>0);
%     figure(5), imagesc(Test(:,:,i)) % Depict the training set per band
%     pause(0.05)
% end
%
% Test_array=[]; %This is the wanted 204xN array
% Test_array_response=[]; % This vector keeps the label of each of the training pixels
% Test_array_pos=[]; % This array keeps (in its rows) the position of the training pixels in the image.
% for i=1:p
%     for j=1:n
%         Test_array=[Test_array squeeze(Test(i,j,:))];
%         Test_array_response=[Test_array_response Training_Set_Image(i,j)];
%         Test_array_pos=[Test_array_pos; i j];
%     end
% end

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

Train_array_category_1 = Train_array_category_1';
Train_array_category_2 = Train_array_category_2';
Train_array_category_3 = Train_array_category_3';
Train_array_category_4 = Train_array_category_4';
Train_array_category_5 = Train_array_category_5';

% figure(6), plotmatrix(Train_array_category_1, '*r');
% figure(7), plotmatrix(Train_array_category_2, '.b');
% figure(8), plotmatrix(Train_array_category_3, 'Og');
% figure(9), plotmatrix(Train_array_category_4, '+b');
% figure(10), plotmatrix(Train_array_category_5, '-r');

% Number of elements per category
N1 = length(Train_array_category_1);
N2 = length(Train_array_category_2);
N3 = length(Train_array_category_3);
N4 = length(Train_array_category_4);
N5 = length(Train_array_category_5);

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

% Vector containing the class labels of
output = [];

for i = 1 :N
    point = Train_array(:, i)';

%     p1 = (1 / (sqrt(2 * pi) * s1)) * exp((-point - m1_ML)^2 / (2 * s1));
%     p2 = (1 / (sqrt(2 * pi) * s2)) * exp((-point - m2_ML)^2 / (2 * s2));
%     p3 = (1 / (sqrt(2 * pi) * s3)) * exp((-point - m3_ML)^2 / (2 * s3));
%     p4 = (1 / (sqrt(2 * pi) * s4)) * exp((-point - m4_ML)^2 / (2 * s4));
%     p5 = (1 / (sqrt(2 * pi) * s5)) * exp((-point - m5_ML)^2 / (2 * s5));

    p1 = normcdf(point, m1_ML, s1);
    p2 = normcdf(point, m2_ML, s2);
    p3 = normcdf(point, m3_ML, s3);
    p4 = normcdf(point, m4_ML, s4);
    p5 = normcdf(point, m5_ML, s5);
    
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
    
    bayes_rule = [bayes_rule_1 bayes_rule_2 bayes_rule_3 bayes_rule_4 bayes_rule_5];
  
    max_probability = max(bayes_rule);
    
    if (max_probability == bayes_rule_1)
        output = [output 1];
    elseif (max_probability == bayes_rule_2)
        output = [output 2];
    elseif (max_probability == bayes_rule_3)
        output = [output 3];
    elseif (max_probability == bayes_rule_4)
        output = [output 4];
    elseif (max_probability == bayes_rule_5)
        output = [output 5];
    end
end

% disp(output);

errors = 0;
for i = 1 :N
    if(output(i) ~= Train_array_response(i))
        errors = errors + 1;
    end
end
correct = N - errors;
accuracy = (correct/N) * 100;
fprintf('Accuracy: %.2f%%\n', accuracy);
