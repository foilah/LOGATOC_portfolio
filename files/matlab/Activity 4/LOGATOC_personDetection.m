clc;
clear;

cam = webcam;

personDetector = peopleDetectorACF();

while true
    img = snapshot(cam);

    [boxes, scores] = detect(personDetector, img);

    selectedBox = scores > 20;
    validBoxes = boxes(selectedBox, :);

    if ~isempty(validBoxes)
        detectedPerson = insertObjectAnnotation(img, 'rectangle', validBoxes, 'Person');
    else
        detectedPerson = img;
    end

    imshow(detectedPerson);
    drawnow;
end