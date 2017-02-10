function frames = getFrames( filename )
% Extracts the frames in a video

% filename: path of the video file with the extension
%
% frames:   Height-by-Width-by-nFrames 3D matrix of gray level pixels (uint8).

v = VideoReader(filename);
numFrames = uint64(v.Duration * v.FrameRate);

frames = zeros(v.Height, v.Width, numFrames, 'uint8');

for i=1:numFrames
    frames(:,:,i) = rgb2gray(v.readFrame());
end

