before = imread('test.jpg');
sz1 = size(before);
[LL,LH,HL,HHb] = dwt2(before, 'haar');
sz2 = size(HHb);
[HH1, HH2, HH3, HH4b] = dwt2 (HHb, 'haar');

msg = 'A';
msgBinary = dec2bin(msg,8)';
msgBinary = msgBinary(:)'-'0';
steg_coeffs = [-1.0, -0.75, -0.5, -0.25, 0.25, 0.5, 0.75, 1.0];

HH4a = HH4b;

for i=1:8
    if msgBinary(i) == 1
        HH4a(1,i) = steg_coeffs(randi(numel(steg_coeffs)));
    else
        HH4a(1,i) = 0.0;
    end
end

HHa = idwt2(HH1, HH2, HH3, HH4a, 'haar', sz2);
after = uint8(idwt2(LL, LH, HL, HHa, 'haar', sz1));
imwrite (after, 'after.jpg');

[HH4_psnr, HH4_mse, HH4_maxerr, HH4_l2rat] = measerr(HH4a, HH4b);
[HH_psnr, HH_mse, HH_maxerr, HH_l2rat] = measerr(HHa, HHb);
[img_psnr, img_mse, img_maxerr, img_l2rat] = measerr(after, before);

extr = imread('after.jpg');
[LL,LH,HL,HHe] = dwt2 (extr, 'haar');
[HH1,HH2,HH3,HH4e] = dwt2 (HHe, 'haar');

extract = '';
for i=1:8
    if HH4e(1,i) < 0.25
        extract = strcat(extract,'0');
    else
        extract = strcat(extract,'1');
    end
end

extractMsg = bin2dec(extract);