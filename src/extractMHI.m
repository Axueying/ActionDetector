function MHI = extractMHI( frames )
% Extracts motion history images using frames of a video.

% frames:   Height-by-Width-by-nFrames 3D matrix (double) holding the
%           frames of the cropped video involving only the actor.
%
% MHI:      Extracted features as a 3D matrix (double)

framesNew=zeros(size(frames));
framesNew(:,:,1) = [];

f1 = frames(:,:,1);
for f = 2:size(frames,3)
    f2 = frames(:,:,f);
    framesNew(:,:,f-1) = double(abs(f1-f2)>10);
    f1 = f2;
end
frames = framesNew;
clear framesNew

% Initialize the output, MHI a.k.a. H(x,y,t,T)
MHI = frames;
MHI(:,:,size(frames,3)) = [];

% Define MHI parameter T
T = 5; % # of frames being considered; maximal value of MHI.

% Load the first frame
frame1 = frames(:,:,1);

% Get dimensions of the frames
[y_max, x_max] = size(frame1);

% Compute H(x,y,1,T) (the first MHI)
MHI(:,:,1) = frames(:,:,1) .* T;

%Start global loop for each frame
for frameIndex = 2:size(frames,3)
    
    %Load current frame from image cell
    frame = frames(:,:,frameIndex);
    
    %Begin looping through each point
    for y = 1:y_max
        for x = 1:x_max
            if (frame(y,x) == 1)
                MHI(y,x,frameIndex) = T;
            else
                if (MHI(y,x,frameIndex-1) > 1)
                    MHI(y,x,frameIndex) = MHI(y,x,frameIndex-1) - 1;
                else
                    MHI(y,x,frameIndex) = 0;
                end
            end
        end
    end
end


