%Read the image
img = imread('course1image.jpg');
[h, w] = size(img);
oneThird = floor(h/3);
B=img(1:oneThird, :);
G=img((oneThird + 1):(2 * oneThird), :);
R=img((2 * oneThird + 1):(3 * oneThird), :);
c_x = 341/2-25;
c_y = 400/2-25;
ref_img_region = double(G(c_x:c_x+50, c_y:c_y+50));
ref_img_region_R = double(R(c_x: c_x + 50, c_y: c_y + 50));
ref_img_region_B = double(B(c_x: c_x + 50, c_y: c_y + 50));
offsetR = offset(ref_img_region_R, ref_img_region);
shiftr=circshift(R,offsetR);
offsetB = offset(ref_img_region_B, ref_img_region);
shiftb=circshift(B,offsetB);

ColorImg_aligned = cat(3,shiftr,G,shiftb);
imshow(ColorImg_aligned); 

%Offset function 
function [output] = offset(img1, img2)
    MIN = inf;
    for x = -10:10
        for y = -10:10
            temp = circshift(img1, [x, y]);
            ssd = sum((img2 - temp).^2, 'all');
            if ssd < MIN
                MIN = ssd;
                output = [x, y];
            end
        end
    end
end