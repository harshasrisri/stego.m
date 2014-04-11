stage1 = transImage (imread('test.jpg'), 'haar');
stage2 = transImage (stage1.HH, 'haar');
% stage2 = embedMsg (stage2, 'M');
% stage2 = finalize(stage2);
% stage1.HH = stage2.aft;
stage1 = finalize(stage1, 'after.jpg');

stage3 = transImage (imread('after.jpg'), 'haar');
stage4 = transImage (stage3.HH, 'haar');

[psnr, mse, me, l2r] = measerr (stage1.bef, stage3.bef);