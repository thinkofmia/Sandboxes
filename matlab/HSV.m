RGB = imread('image1.jpg');
%To HSV
HSV = rgb2hsv(RGB);
R = HSV(:,:,1);
G = HSV(:,:,2);
B = HSV(:,:,3);
%1st Picture
imshow(R);
%2nd Picture
imshow(G);
%3rd Picture
imshow(B);
%4th Picture
imshow(HSV);