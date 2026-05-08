clc; 
clear all;

cam = webcam;
img = snapshot(cam);

faceDetector = vision.CascadeObjectDetector();

imshow(img);

while true
    img = snapshot(cam);
    grayImg = rgb2gray(img);

    bbox = step(faceDetector, grayImg);

    detectedFace = insertObjectAnnotation(img, 'rectangle', bbox, 'Face');

    imshow(detectedFace);
end