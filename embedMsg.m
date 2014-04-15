function obj = embedMsg (obj, message)
msgBinary = dec2bin(message,8)';
msgBinary = msgBinary(:)'-'0';

steg_coeffs = [10, 20, 30, 40];

for ii=1:8
    if msgBinary(ii) == 1
        if obj(1,ii) <= 0
            obj(1,ii) = steg_coeffs(randi(numel(steg_coeffs)));
        end
    else
        if obj(1,ii) >= 0
            obj(1,ii) = -1 * steg_coeffs(randi(numel(steg_coeffs)));
        end
    end
end
end