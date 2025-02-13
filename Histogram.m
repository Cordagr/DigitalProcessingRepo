% Display the image
% imshow(originalPic);


function stretchedImage = stretchImage()
    % Read the input image
    inputtedImage = imread('onion.png');
    
    % Preallocate the output image with the same size as input
    stretchedImage = zeros(size(inputtedImage), 'like', inputtedImage);
    
    % Process each color channel
    for channel = 1:size(inputtedImage, 3)
        % Extract the current channel
        currentChannel = inputtedImage(:, :, channel);

        % Find the min and max intensities in the current channel
        minIntensity = double(min(currentChannel(:)));
        maxIntensity = double(max(currentChannel(:)));

        % Perform histogram stretching for the current channel
        stretchedImage(:, :, channel) = uint8(255 * (double(currentChannel) - minIntensity) / (maxIntensity - minIntensity));
    end
end
% Read the input image
inputImage = imread('onion.png');

% Convert the image to grayscale
grayImage = rgb2gray(inputImage);

% Equalize the histogram
equalizedImage = histeq(grayImage);

stretchedImage = stretchImage()

figure;




% displaying the input image
subplot(2, 2, 1);
imshow(inputImage);
title('Inputted Image');

% displaying the stretched image
subplot(2, 2, 2);
imshow(equalizedImage)
title('Equalized Image');

% displaying the histogram of the stretched image
subplot(2, 2, [3, 4]);
imshow(stretchedImage);
title('Histogram Stretched Image')


inputImage = imread('onion.png');
[height,width,dim] = size(inputImage);

image = imread('onion.png')

redChannel = image(:,:,1);
greenChannel = image(:,:,2);
blueChannel = image(:,:,3);

figure;


% displaying color channels 
subplot(2,2,2)
imshow(redChannel)
title('Displaying red channel')

subplot(2,2,3)
imshow(greenChannel)
title('Displaying green channel')

subplot(2,2,4)
imshow(blueChannel)
title('Displaying blue channel')


% converting color image 'onion.png'
HSVImage = rgb2hsv(image)

redChannel = HSVImage(:,:,1);
greenChannel = HSVImage(:,:,2);
blueChannel = HSVImage(:,:,3);


figure;
% displaying color channels 
subplot(2,2,2)
imshow(redChannel)
title('Displaying red channel')

subplot(2,2,3)
imshow(greenChannel)
title('Displaying green channel')

subplot(2,2,4)
imshow(blueChannel)
title('Displaying blue channel')

% converting color image 'onion.png' from RGB to YIQ
YIQImage = rgb2ntsc(image)

redChannel = YIQImage(:,:,1);
greenChannel = YIQImage(:,:,2);
blueChannel = YIQImage(:,:,3);


figure;
% displaying color channels 
subplot(2,2,2)
imshow(redChannel)
title('Displaying red channel')

subplot(2,2,3)
imshow(greenChannel)
title('Displaying green channel')

subplot(2,2,4)
imshow(blueChannel)
title('Displaying blue channel')

function changeRedChannel()
inputImage = imread('onion.png')

% Extract the red, green, and blue channels
R = inputImage(:, :, 1); % red channel
G = inputImage(:, :, 2); % green channel
B = inputImage(:, :, 3); % blue channel

% Define a threshold to detect red (adjust as needed based on your image)
redThreshold = 50;    % Red must be greater than this value
greenThreshold = 50;  % Green must be lower than this value
blueThreshold = 50;   % Blue must be lower than this value

% creating a mask for "red" pixels
redMask = (R > redThreshold) & (G < greenThreshold) & (B < blueThreshold);

% applying the mask: keep red areas, set non-red areas to black
outputImage = inputImage;  % copying original image
outputImage(repmat(~redMask, [1 1 3])) = 0; % setting non-red pixels to black

figure

imshow(outputImage)
end

changeRedChannel()

% to compile simply click on run button
