function obj = embedMsg (obj, message)
msgBinary = dec2bin(message,8)';
msgBinary = msgBinary(:)'-'0';
steg_coeffs = [-0.25, 0.25];

for i=1:8
    if msgBinary(i) == 1
        if abs(obj.HH(1,i)) < 0.25
            obj.HH(1,i) = steg_coeffs(randi(numel(steg_coeffs)));
        end
    else
        obj.HH(1,i) = rand / 400;
    end
end
end