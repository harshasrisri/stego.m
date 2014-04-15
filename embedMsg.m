function obj = embedMsg (obj, message)
msgBinary = dec2bin(message,8)';
msgBinary = msgBinary(:)'-'0';

steg_coeffs = [-0.125, 0.125];

for ii=1:8
    if msgBinary(ii) == 1
        if abs(obj(1,ii)) < 0.125
            obj(1,ii) = steg_coeffs(randi(numel(steg_coeffs)));
        end
    else
        obj(1,ii) = 0.0;
    end
end
end