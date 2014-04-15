function obj = embedMsg (obj, message)
if size(message,2) > size(obj,1) * size(obj,2)
    error ('message too big to embed');
end

bit_count = 0;
steg_coeffs = [10, 20, 30, 40];
    
for jj=1:size(message,2)
    charbits = dec2bin(message(jj),8)';
    charbits = charbits(:)'-'0';
    
    for ii=1:8
        bit_count = bit_count + 1;
        
        if charbits(ii) == 1
            if obj(bit_count) <= 0
                obj(bit_count) = steg_coeffs(randi(numel(steg_coeffs)));
            end
        else
            if obj(bit_count) >= 0
                obj(bit_count) = -1 * steg_coeffs(randi(numel(steg_coeffs)));
            end
        end
    end
end
end