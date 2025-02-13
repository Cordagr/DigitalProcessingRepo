function [] = execHistogramMatch(inputImage1,inputImage2,outputImageFile)

A = imread(inputImage1);
B = imread(inputImage2);

%histogramRep1 = histogram(A)
%histogramRep2 = histogram(B)
% image 1 size: 291x436
[height, width, dim] = size(A);
disp(['Image size: ', num2str(height), 'x', num2str(width), ', Channels: ', num2str(dim)]);

[height2,width2,dim2] = size(B);

if num2str(dim) == 3
    % if initially colored
    sourceGray = rgb2gray(A);
else
    sourceGray = A;
end

if num2str(dim2) == 3
    referenceGray = rgb2gray(B);
else
    referenceGray = B;
end

matched_image = histeq(sourceGray,imhist(referenceGray));

% convert back to color if needed

% if 3 color channels exist set them to original image thhat we use as the
% source (denoted by 'A')
if dim == 3
   matched_image = A;
   matched_image(:,:,1) = histeq(A(:,:,1), imhist(referenceGray));
   matched_image(:,:,2) = histeq(A(:,:,2), imhist(referenceGray));
   mactched_image(:,:,3) = histeq(A(:,:,3), imhist(referenceGray));
else
   matched_image = matched_image_gray; 
end 

% Saving image
imwrite(matched_image,outputImageFile)

end
