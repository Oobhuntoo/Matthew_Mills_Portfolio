% split up training images into 4 parts
files = dir("C:\Users\Matthew\Desktop\YNET2\UPDATE\training_base\*.png");
angle = [0, 90, 180, 270];
for file = files'
    file_path = strcat("C:\Users\Matthew\Desktop\YNET2\UPDATE\training_base\",file.name);
    im_file =  imread(file_path);
    gray_ = rgb2gray(im_file);
    bin_im = imbinarize(gray_);
    
    q1_orig = imresize(bin_im(1:end/2, 1 : end/2), [128,128]);
    q2_orig = imresize(bin_im(1:end/2, end/2+1 : end ), [128,128]);
    q3_orig = imresize(bin_im(end/2+1 : end, 1 : end/2), [128,128]);
    q4_orig = imresize(bin_im(end/2+1 : end, end/2+1 : end), [128,128]);
    
    q1 = bitor(imrotate(q1_orig, angle(randsample(4,1))), q1_orig);
    q2 = bitor(imrotate(q2_orig, angle(randsample(4,1))), q2_orig);
    q3 = bitor(imrotate(q3_orig, angle(randsample(4,1))), q3_orig);
    q4 = bitor(imrotate(q4_orig, angle(randsample(4,1))), q4_orig);
    
    q1_path = strcat("C:\Users\Matthew\Desktop\YNET2\UPDATE\training\",erase(file.name,".png"),"_1",".png");
    imwrite(q1, q1_path);
    q2_path = strcat("C:\Users\Matthew\Desktop\YNET2\UPDATE\training\",erase(file.name,".png"),"_2",".png");
    imwrite(q2, q2_path);
    q3_path = strcat("C:\Users\Matthew\Desktop\YNET2\UPDATE\training\",erase(file.name,".png"),"_3",".png");
    imwrite(q3, q3_path);
    q4_path = strcat("C:\Users\Matthew\Desktop\YNET2\UPDATE\training\",erase(file.name,".png"),"_4",".png");
    imwrite(q4, q4_path);
end 

% split up test images into 4 parts
files = dir("C:\Users\Matthew\Desktop\YNET2\UPDATE\test_base\*.png");
for file = files'

    file_path = strcat("C:\Users\Matthew\Desktop\YNET2\UPDATE\test_base\",file.name);
    im_file =  imread(file_path);
    gray_ = rgb2gray(im_file);
    bin_im = imbinarize(gray_);
    
    q1_orig = imresize(bin_im(1:end/2, 1 : end/2), [128,128]);
    q2_orig = imresize(bin_im(1:end/2, end/2+1 : end ), [128,128]);
    q3_orig = imresize(bin_im(end/2+1 : end, 1 : end/2), [128,128]);
    q4_orig = imresize(bin_im(end/2+1 : end, end/2+1 : end), [128,128]);
    
    q1 = bitor(imrotate(q1_orig, angle(randsample(4,1))), q1_orig);
    q2 = bitor(imrotate(q2_orig, angle(randsample(4,1))), q2_orig);
    q3 = bitor(imrotate(q3_orig, angle(randsample(4,1))), q3_orig);
    q4 = bitor(imrotate(q4_orig, angle(randsample(4,1))), q4_orig);
    
    q1_path = strcat("C:\Users\Matthew\Desktop\YNET2\UPDATE\test\",erase(file.name,".png"),"_1",".png");
    imwrite(q1, q1_path);
    q2_path = strcat("C:\Users\Matthew\Desktop\YNET2\UPDATE\test\",erase(file.name,".png"),"_2",".png");
    imwrite(q2, q2_path);
    q3_path = strcat("C:\Users\Matthew\Desktop\YNET2\UPDATE\test\",erase(file.name,".png"),"_3",".png");
    imwrite(q3, q3_path);
    q4_path = strcat("C:\Users\Matthew\Desktop\YNET2\UPDATE\test\",erase(file.name,".png"),"_4",".png");
    imwrite(q4, q4_path);
end 