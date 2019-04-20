function [] = dispImage(imageVec)
    imageMat = imageVec2Mat(imageVec);
    image(imageMat);
end

