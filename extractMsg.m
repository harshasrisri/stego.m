function message = extractMsg (obj)
message = '';
for ii = 1:size(obj,1)*size(obj,2)
    msgbits = '';
    if obj(ii) > 0
        msgbits = strcat (msgbits, '1');
    elseif obj(ii) < 0
        msgbits = strcat (msgbits, '0');
    else
        return;
    end
    if mod(ii,8) == 1
        message = strcat (message, char (bin2dec(msgbits)));
    end
end
end