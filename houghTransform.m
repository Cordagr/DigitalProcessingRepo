image = imread('onion.png')
image = rgb2gray(image)
function [lineImage,circleImage] = houghTransform(image)
% Line detecntion %
edges = edge(image,"canny")
[H,thetha, rho] = hough(edges)
peaks = houghpeaks(H,5,'Threshold', ceil(.2 * max(H(:))))
lines = houghlines(edges,thetha,rho,peaks)
lineImage = repmat(image, 1, 1, 3)
% iterate through all pixels with hough lines and draw them into lineImage
for k = 1:length(lines)
xy = [lines(k).point1; lines(k).point2]
lineImage = insertShape(lineImage,'line',[xy(1,1), xy(1,2),xy(2,1),
xy(2,2)], ...
'LineWidth', 2, 'Color','White')
end
% Hough transform for circle %
[center,radius] = imfindcircles(image,[10,100])
% creating circle image %
circleImage = repmat(image,1,1,3)
for i = 1:length(radius)
circleImage = insertShape(circleImage, 'Circle', [center(i,:), radius(i)], ...
'LineWidth', 2, 'Color', 'blue')
end
end
[lineImage,circleImage] = houghTransform(image)
figure
imshow(lineImage), title('Line Image')
figure
imshow(circleImage),title('Circle Image')
% to run simply click on run button under editor section
