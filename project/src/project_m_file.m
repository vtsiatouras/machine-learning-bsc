% This is a supporting MATLAB file for the project

clear
format compact
close all

cont = true;
classifier = '';
while(cont)
    prompt = 'Choose one classifier\n(1) Naive Bayes Classifier\n(2) Minimum Euclidean Distance Classifier\n(3) K-NN\n';
    classifier = input(prompt,'s');
    if(isequal(classifier, '1') || isequal(classifier, '2') || isequal(classifier, '3'))
        cont = false;
    end
end

cont = true;
dataset = '';
while(cont)
    prompt = 'Dataset for operation\n(1) Test Dataset\n(2) Operational Dataset\n';
    dataset = input(prompt,'s');
    if(isequal(dataset, '1') || isequal(dataset, '2'))
        cont = false;
    end
end

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

Operational=zeros(p,n,l); % This is a 3-dim array, which will contain nonzero values only for the training pixels
Operational_array=[]; %This is the wanted 204xN array
Operational_array_response=[]; % This vector keeps the label of each of the training pixels
Operational_array_pos=[]; % This array keeps (in its rows) the position of the training pixels in the image.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TEST SET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constructing the 204xN array whose columns are the vectors corresponding to the
% N vectors (pixels) of the test set.
if (isequal(dataset, '1'))
    for i=1:l
         %Multiply elementwise each band of the Salinas_Image with the mask
         % "Training_Set_Image>0", which identifies only the training vectors.
        Operational(:,:,i)=Salinas_Image(:,:,i).*(Test_Set_Image>0);
        figure(6), imagesc(Operational(:,:,i)) % Depict the training set per band
        pause(0.05)
    end  
    for i=1:p
        for j=1:n
            if (Test_Set_Image(i, j) > 0)
                Operational_array=[Operational_array squeeze(Operational(i,j,:))];
                Operational_array_response=[Operational_array_response Test_Set_Image(i,j)];
                Operational_array_pos=[Operational_array_pos; i j];
            end
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OPERATIONAL SET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constructing the 204xN array whose columns are the vectors corresponding to the
% N vectors (pixels) of the operation set.
if (isequal(dataset, '2'))
    for i=1:l
         %Multiply elementwise each band of the Salinas_Image with the mask
         % "Training_Set_Image>0", which identifies only the training vectors.
        Operational(:,:,i)=Salinas_Image(:,:,i).*(Operational_Set_Image>0);
        figure(7), imagesc(Operational(:,:,i)) % Depict the training set per band
        pause(0.05)
    end
    for i=1:p
        for j=1:n
            if (Operational_Set_Image(i,j) > 0)
                Operational_array=[Operational_array squeeze(Operational(i,j,:))];
                Operational_array_response=[Operational_array_response Operational_Set_Image(i,j)];
                Operational_array_pos=[Operational_array_pos; i j];
            end
        end
    end
end

if (isequal(classifier, '1'))
    naive_bayes(Train_array, Train_array_pos, Train_array_response, Operational_array, Operational_array_pos, Operational_array_response);
elseif (isequal(classifier, '2'))
    disp('WIP');
elseif (isequal(classifier, '3'))
    disp('WIP');    
end
