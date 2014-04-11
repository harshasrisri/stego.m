before = imread('test.jpg');
sz1 = size(before);
before = int16(before);
before = before * 4;
[LL,LH,HL,HHb] = dwt2(before, 'haar');

sz2 = size(HHb);
[HH1, HH2, HH3, HH4b] = dwt2 (HHb, 'haar');

HH4a = int16(HH4b);

msg = 'M';
msgBinary = dec2bin(msg,8)';
msgBinary = msgBinary(:)'-'0';

for i=1:8
    HH4a(1,i) = msgBinary(i);
end

HH4a = double(HH4a);
HHa = idwt2(HH1, HH2, HH3, HH4a, 'haar', sz2);
after = uint8(idwt2(LL, LH, HL, HHa, 'haar', sz1) / 4);

[psnr_HH4, mse_HH4, maxerr_HH4, l2rat_HH4] = measerr(HH4a, HH4b);
[psnr_HH, mse_HH, maxerr_HH, l2rat_HH] = measerr(HHa, HHb);
[psnr_img, mse_img, maxerr_img, l2rat_img] = measerr(after, before);

imwrite (after, 'after.jpg');

after = imread('after.jpg');
after = int16(after);
after = after * 4;

[LL,LH,HL,HHe] = dwt2 (after, 'haar');
[HH1,HH2,HH3,HH4e] = dwt2 (HHe, 'haar');
HH4e = int16(HH4e);