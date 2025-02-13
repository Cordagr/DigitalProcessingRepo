img1 = imread("onion.png")
img1 = rgb2gray(img1)

function result = myConv(image,kernel,padding_method)
image = double(image)
kernel = double(kernel)
% Checking argument passed to check for padding method if given
if nargin < 3
    padding_method = 'zero'
end

% if color image change to grayscale
if size(image,3) == 3
   image = rgb2gray(image)
end
% Choosing padding method
switch padding_method
    case 'circular'
        paddedImage = padarray(image,floor(size(kernel)/2), "circular")
    case 'replicate'
        paddedImage = padarray(image,floor(size(kernel)/2),"replicate")
    case 'symmetric'
        paddedImage = padaaray(imagefloor(size(kernel)/2),"symmetric")
    otherwise
        paddedImage = padarray(image,floor(size(kernel)/2),0)
end

result = conv2(paddedImage, kernel, 'same');
result = uint8(result);
end


img2 = img1
img2 = imnoise(img2,'salt & pepper', .075)

% remove the salt and pepper
img2 = medfilt2(img1,[3 3])

subplot(1,3,1), imshow(img1), title('Original Grayscale Image')
subplot(1,3,2), imshow(img2), title('Denoised image')

img3 = img1
img3 = imnoise(img3,'gaussian',0,.04)
img4 = imgaussfilt(img3,1)

averageFilter = ones(3,3) / 9
img5 = myConv(img3,averageFilter,'zero')

% Plotting images after reducing noise from salt and pepper
figure
subplot(1,3,1), imshow(img4), title('Image 4')
subplot(1,3,2), imshow(img5), title('Image 5')



% Extracting Edges from img2 and img5 using canny edges
edges_img2 = edge(img2,'canny')
edges_img5 = edge(img5,'canny')
figure
subplot(1,3,1), imshow(edges_img2), title('Image 4 Edges')
subplot(1,3,2), imshow(edges_img5), title('Image 5 Edges')

% to run simply click run button in the editor section
