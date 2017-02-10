function cropped_frames = cropFrames( frames, mask )
% Takes the frames of a video and applies the mask to find where the actor
% is. Then, it crops the frames such that the only thing in the video is
% the movements of the actor.

% frames:         Height-by-Width-by-nFrames 3D matrix of gray level pixels
%                 (uint8)
%
% mask:           Height-by-Width-by-nFrames 3D matrix of logical
%
% cropped_frames: 90 x 50 x nFrames 3D matrix (double) representing the
%                 cropped video involving only the actor.

    cropped_frames = zeros(90,50,size(frames,3));
    maskedImgs = zeros(size(frames));
    for i=1:size(frames,3)
        maskedImg = double(frames(:,:,i)) .* (mask(:,:,i));
        maskedImgs(:,:,i) = maskedImg;
        border = DefineBorder(maskedImg);
        cropped_frames(:,:,i) = imresize(maskedImg(border(1,1):border(1,3), border(1,2):border(1,4)), [90 50]);
    end
end

function border = DefineBorder(frame)
    s = size(frame); 
    ar = [];
    matrix=[];
    for i=1 : s(1)
        for t = 1 : s(2)
            if( frame(i,t)~=0 )
                 ar=[ar t];
            end
        end
        
        if ( size(ar) > 0)      
            matrix = [matrix ; [i min(ar) max(ar)]];
        end
        ar = [];
    end
    x1 = min(matrix(:,1));
    x2 = max(matrix(:,1));
    y1 = min(matrix(:,2));
    y2 = max(matrix(:,3));
    border = [x1,y1,x2,y2];
end
 