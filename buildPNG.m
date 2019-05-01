folder = 'D:\CIS520\Project\originalImage4';

for i=1:10000
    disp(i);
    filename = strcat(num2str(i), ".png");
    imageMat = imageVec2Mat(data(i,:));
    imwrite(imageMat, fullfile(folder,filename));
end