function message = extractMsg (obj)
message = '';
msgbits = '';
for ii = 1:size(obj,1)*size(obj,2)
    if obj(ii) > 0
        msgbits = strcat (msgbits, '1');
    elseif obj(ii) < 0
        msgbits = strcat (msgbits, '0');
    else
        return;
    end
    
    if mod(ii,8) == 0
        msgChar = bin2dec(msgbits);
        msgChar = char (msgChar);
        message = strcat (message, msgChar);
        msgbits = '';
    end
end
end