embed1 = transImage (imread('test.jpg'), 'haar');
embed2 = transImage (embed1.HH, 'haar');
embed3 = transImage (embed2.HH, 'haar');

embed3.HH = embedMsg (embed3.HH, 'Project Steganography by Team DesiDroid');

embed3 = finalize (embed3);

embed2.HH = embed3.aft;
embed2 = finalize (embed2);

embed1.HH = embed2.aft;
embed1 = finalize (embed1, 'after.png');

extract1 = transImage (imread('after.png'), 'haar');
extract2 = transImage (extract1.HH, 'haar');
extract3 = transImage (extract2.HH, 'haar');

% [psnr, mse, me, l2r] = measerr (embed1.aft, extract1.bef);
% [psnr, mse, me, l2r] = measerr (embed2.aft, extract2.bef);
% [psnr, mse, me, l2r] = measerr (embed3.aft, extract3.bef);

extractMsg (extract3.HH)