before = imread('test.jpg');
sz1 = size(before);
[LL,LH,HL,HHb] = dwt2(before, 'haar');

sz2 = size(HHb);
[HH1, HH2, HH3, HH4b] = dwt2 (uint8(HHb * 2), 'haar');

HH4a = uint8(HH4b * 2);

msg = 'M';
msgBinary = dec2bin(msg,8)';
msgBinary = msgBinary(:)'-'0';

for i=1:8
%     if msgBinary(i) == 1
%         HH4a(1,i) = bitset(HH4a(1,i),1);
%     else if bitget(HH4a(1,i),1) == 1
%             HH4a(1,i) = bitand(HH4a(1,i),msgBinary(i));
%         end
%     end
HH4a(1,i) = msgBinary(i);
end

HH4a = double(HH4a);
HH4a = HH4a / 2;

diff_HH4 = max(max(abs(HH4a - HH4b)));

HHa = idwt2(HH1, HH2, HH3, HH4a, 'haar', sz2);
HHa = HHa / 2;

diff_HH = max(max(abs(HHa - HHb)));

after = uint8(idwt2(LL, LH, HL, HHa, 'haar', sz1));

diff_img = max(max(abs(before-after)));

imwrite (before, 'before.jpg');
imwrite (after, 'after.jpg');
extract = imread ('after.jpg');

[LLe, LHe, HLe, HHe] = dwt2 (extract, 'haar');
[HH1e, HH2e, HH3e, HH4e] = dwt2 (uint8(HHe * 2), 'haar');
HH4e = uint8(HH4e * 2);

diff_HHe = max(max(abs