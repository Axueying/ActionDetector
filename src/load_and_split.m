function [train, train_count, train_label, test, test_count, test_label] = load_and_split()

mask_file = load('./data/classification_masks.mat');
masks = mask_file.original_masks;

% batch*: (nFrames - 1) x 90 x 50 (double)
batch_run1 = getFrames('./data/run/daria_run.avi');
batch_run1 = cropFrames(batch_run1, masks.daria_run);
batch_run1 = extractMHI(batch_run1);
batch_run2 = getFrames('./data/run/denis_run.avi');
batch_run2 = cropFrames(batch_run2, masks.denis_run);
batch_run2 = extractMHI(batch_run2);
batch_run3 = getFrames('./data/run/eli_run.avi');
batch_run3 = cropFrames(batch_run3, masks.eli_run);
batch_run3 = extractMHI(batch_run3);
batch_run4 = getFrames('./data/run/ido_run.avi');
batch_run4 = cropFrames(batch_run4, masks.ido_run);
batch_run4 = extractMHI(batch_run4);
batch_run5 = getFrames('./data/run/ira_run.avi');
batch_run5 = cropFrames(batch_run5, masks.ira_run);
batch_run5 = extractMHI(batch_run5);
batch_run6 = getFrames('./data/run/lena_run1.avi');
batch_run6 = cropFrames(batch_run6, masks.lena_run1);
batch_run6 = extractMHI(batch_run6);
batch_run7 = getFrames('./data/run/lena_run2.avi');
batch_run7 = cropFrames(batch_run7, masks.lena_run2);
batch_run7 = extractMHI(batch_run7);
batch_run8 = getFrames('./data/run/lyova_run.avi');
batch_run8 = cropFrames(batch_run8, masks.lyova_run);
batch_run8 = extractMHI(batch_run8);
batch_run9 = getFrames('./data/run/moshe_run.avi');
batch_run9 = cropFrames(batch_run9, masks.moshe_run);
batch_run9 = extractMHI(batch_run9);
batch_run10 = getFrames('./data/run/shahar_run.avi');
batch_run10 = cropFrames(batch_run10, masks.shahar_run);
batch_run10 = extractMHI(batch_run10);
batch_walk1 = getFrames('./data/walk/daria_walk.avi');
batch_walk1 = cropFrames(batch_walk1, masks.daria_walk);
batch_walk1 = extractMHI(batch_walk1);
batch_walk2 = getFrames('./data/walk/denis_walk.avi');
batch_walk2 = cropFrames(batch_walk2, masks.denis_walk);
batch_walk2 = extractMHI(batch_walk2);
batch_walk3 = getFrames('./data/walk/eli_walk.avi');
batch_walk3 = cropFrames(batch_walk3, masks.eli_walk);
batch_walk3 = extractMHI(batch_walk3);
batch_walk4 = getFrames('./data/walk/ido_walk.avi');
batch_walk4 = cropFrames(batch_walk4, masks.ido_walk);
batch_walk4 = extractMHI(batch_walk4);
batch_walk5 = getFrames('./data/walk/ira_walk.avi');
batch_walk5 = cropFrames(batch_walk5, masks.ira_walk);
batch_walk5 = extractMHI(batch_walk5);
batch_walk6 = getFrames('./data/walk/lena_walk1.avi');
batch_walk6 = cropFrames(batch_walk6, masks.lena_walk1);
batch_walk6 = extractMHI(batch_walk6);
batch_walk7 = getFrames('./data/walk/lena_walk2.avi');
batch_walk7 = cropFrames(batch_walk7, masks.lena_walk2);
batch_walk7 = extractMHI(batch_walk7);
batch_walk8 = getFrames('./data/walk/lyova_walk.avi');
batch_walk8 = cropFrames(batch_walk8, masks.lyova_walk);
batch_walk8 = extractMHI(batch_walk8);
batch_walk9 = getFrames('./data/walk/moshe_walk.avi');
batch_walk9 = cropFrames(batch_walk9, masks.moshe_walk);
batch_walk9 = extractMHI(batch_walk9);
batch_walk10 = getFrames('./data/walk/shahar_walk.avi');
batch_walk10 = cropFrames(batch_walk10, masks.shahar_walk);
batch_walk10 = extractMHI(batch_walk10);
batch_bend1 = getFrames('./data/bend/daria_bend.avi');
batch_bend1 = cropFrames(batch_bend1, masks.daria_bend);
batch_bend1 = extractMHI(batch_bend1);
batch_bend2 = getFrames('./data/bend/denis_bend.avi');
batch_bend2 = cropFrames(batch_bend2, masks.denis_bend);
batch_bend2 = extractMHI(batch_bend2);
batch_bend3 = getFrames('./data/bend/eli_bend.avi');
batch_bend3 = cropFrames(batch_bend3, masks.eli_bend);
batch_bend3 = extractMHI(batch_bend3);
batch_bend4 = getFrames('./data/bend/ido_bend.avi');
batch_bend4 = cropFrames(batch_bend4, masks.ido_bend);
batch_bend4 = extractMHI(batch_bend4);
batch_bend5 = getFrames('./data/bend/ira_bend.avi');
batch_bend5 = cropFrames(batch_bend5, masks.ira_bend);
batch_bend5 = extractMHI(batch_bend5);
batch_bend6 = getFrames('./data/bend/lena_bend.avi');
batch_bend6 = cropFrames(batch_bend6, masks.lena_bend);
batch_bend6 = extractMHI(batch_bend6);
batch_bend7 = getFrames('./data/bend/lyova_bend.avi');
batch_bend7 = cropFrames(batch_bend7, masks.lyova_bend);
batch_bend7 = extractMHI(batch_bend7);
batch_bend8 = getFrames('./data/bend/moshe_bend.avi');
batch_bend8 = cropFrames(batch_bend8, masks.moshe_bend);
batch_bend8 = extractMHI(batch_bend8);
batch_bend9 = getFrames('./data/bend/shahar_bend.avi');
batch_bend9 = cropFrames(batch_bend9, masks.shahar_bend);
batch_bend9 = extractMHI(batch_bend9);
batch_wave11 = getFrames('./data/wave1/daria_wave1.avi');
batch_wave11 = cropFrames(batch_wave11, masks.daria_wave1);
batch_wave11 = extractMHI(batch_wave11);
batch_wave12 = getFrames('./data/wave1/denis_wave1.avi');
batch_wave12 = cropFrames(batch_wave12, masks.denis_wave1);
batch_wave12 = extractMHI(batch_wave12);
batch_wave13 = getFrames('./data/wave1/eli_wave1.avi');
batch_wave13 = cropFrames(batch_wave13, masks.eli_wave1);
batch_wave13 = extractMHI(batch_wave13);
batch_wave14 = getFrames('./data/wave1/ido_wave1.avi');
batch_wave14 = cropFrames(batch_wave14, masks.ido_wave1);
batch_wave14 = extractMHI(batch_wave14);
batch_wave15 = getFrames('./data/wave1/ira_wave1.avi');
batch_wave15 = cropFrames(batch_wave15, masks.ira_wave1);
batch_wave15 = extractMHI(batch_wave15);
batch_wave16 = getFrames('./data/wave1/lena_wave1.avi');
batch_wave16 = cropFrames(batch_wave16, masks.lena_wave1);
batch_wave16 = extractMHI(batch_wave16);
batch_wave17 = getFrames('./data/wave1/lyova_wave1.avi');
batch_wave17 = cropFrames(batch_wave17, masks.lyova_wave1);
batch_wave17 = extractMHI(batch_wave17);
batch_wave18 = getFrames('./data/wave1/moshe_wave1.avi');
batch_wave18 = cropFrames(batch_wave18, masks.moshe_wave1);
batch_wave18 = extractMHI(batch_wave18);
batch_wave19 = getFrames('./data/wave1/shahar_wave1.avi');
batch_wave19 = cropFrames(batch_wave19, masks.shahar_wave1);
batch_wave19 = extractMHI(batch_wave19);
batch_wave21 = getFrames('./data/wave2/daria_wave2.avi');
batch_wave21 = cropFrames(batch_wave21, masks.daria_wave2);
batch_wave21 = extractMHI(batch_wave21);
batch_wave22 = getFrames('./data/wave2/denis_wave2.avi');
batch_wave22 = cropFrames(batch_wave22, masks.denis_wave2);
batch_wave22 = extractMHI(batch_wave22);
batch_wave23 = getFrames('./data/wave2/eli_wave2.avi');
batch_wave23 = cropFrames(batch_wave23, masks.eli_wave2);
batch_wave23 = extractMHI(batch_wave23);
batch_wave24 = getFrames('./data/wave2/ido_wave2.avi');
batch_wave24 = cropFrames(batch_wave24, masks.ido_wave2);
batch_wave24 = extractMHI(batch_wave24);
batch_wave25 = getFrames('./data/wave2/ira_wave2.avi');
batch_wave25 = cropFrames(batch_wave25, masks.ira_wave2);
batch_wave25 = extractMHI(batch_wave25);
batch_wave26 = getFrames('./data/wave2/lena_wave2.avi');
batch_wave26 = cropFrames(batch_wave26, masks.lena_wave2);
batch_wave26 = extractMHI(batch_wave26);
batch_wave27 = getFrames('./data/wave2/lyova_wave2.avi');
batch_wave27 = cropFrames(batch_wave27, masks.lyova_wave2);
batch_wave27 = extractMHI(batch_wave27);
batch_wave28 = getFrames('./data/wave2/moshe_wave2.avi');
batch_wave28 = cropFrames(batch_wave28, masks.moshe_wave2);
batch_wave28 = extractMHI(batch_wave28);
batch_wave29 = getFrames('./data/wave2/shahar_wave2.avi');
batch_wave29 = cropFrames(batch_wave29, masks.shahar_wave2);
batch_wave29 = extractMHI(batch_wave29);

% split data into train and test
% run: 1, walk: 2, bend: 3, wave1: 4, wave2: 5
train_label = [ones(6, 1) .* 1; ones(6, 1) .* 2; ones(6, 1) .* 3; ones(6, 1) .* 4; ones(6, 1) .* 5];
test_label = [ones(4, 1) .* 1; ones(4, 1) .* 2; ones(3, 1) .* 3; ones(3, 1) .* 4; ones(3, 1) .* 5];

train_count = [size(batch_run1, 3), size(batch_run2, 3), size(batch_run3, 3), size(batch_run4, 3), size(batch_run5, 3), size(batch_run6, 3), ...
                size(batch_walk1, 3), size(batch_walk2, 3), size(batch_walk3, 3), size(batch_walk4, 3), size(batch_walk5, 3), size(batch_walk6, 3), ...
                size(batch_bend1, 3), size(batch_bend2, 3), size(batch_bend3, 3), size(batch_bend4, 3), size(batch_bend5, 3), size(batch_bend6, 3), ...
                size(batch_wave11, 3), size(batch_wave12, 3), size(batch_wave13, 3), size(batch_wave14, 3), size(batch_wave15, 3), size(batch_wave16, 3), ...
                size(batch_wave21, 3), size(batch_wave22, 3), size(batch_wave23, 3), size(batch_wave24, 3), size(batch_wave25, 3), size(batch_wave26, 3)];
test_count = [size(batch_run7, 3), size(batch_run8, 3), size(batch_run9, 3), size(batch_run10, 3), ...
                size(batch_walk7, 3), size(batch_walk8, 3), size(batch_walk9, 3), size(batch_walk10, 3), ...
                size(batch_bend7, 3), size(batch_bend8, 3), size(batch_bend9, 3), ...
                size(batch_wave17, 3), size(batch_wave18, 3), size(batch_wave19, 3), ...
                size(batch_wave27, 3), size(batch_wave28, 3), size(batch_wave29, 3)];
train_count = train_count.';
test_count = test_count.';
train = cat(3, batch_run1, batch_run2, batch_run3, batch_run4, batch_run5, batch_run6, ...
        batch_walk1, batch_walk2, batch_walk3, batch_walk4, batch_walk5, batch_walk6, ...
        batch_bend1, batch_bend2, batch_bend3, batch_bend4, batch_bend5, batch_bend6, ...
        batch_wave11, batch_wave12, batch_wave13, batch_wave14, batch_wave15, batch_wave16, ...
        batch_wave21, batch_wave22, batch_wave23, batch_wave24, batch_wave25, batch_wave26);
test = cat(3, batch_run7, batch_run8, batch_run9, batch_run10, ...
        batch_walk7, batch_walk8, batch_walk9, batch_walk10, ...
        batch_bend7, batch_bend8, batch_bend9, ...
        batch_wave17, batch_wave18, batch_wave19, ...
        batch_wave27, batch_wave28, batch_wave29);
    
save('zdata.mat', 'train', 'train_count', 'train_label', 'test', 'test_count', 'test_label');
    
end