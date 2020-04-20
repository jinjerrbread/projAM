function [plainmessage] = rot13_decode(ciphermessage)
for i=1:length(ciphermessage)
    if(ciphermessage(i) >= 97 && ciphermessage(i) <= 122)
        if(ciphermessage(i) >96 && ciphermessage(i) < 110)
        plainmessage(i)=ciphermessage(i) + 13;
    else
        plainmessage(i)=ciphermessage(i) - 13;
        
        end
    else
        if(ciphermessage(i) >= 65 && ciphermessage(i) <= 90)
            if(ciphermessage(i) > 64 && ciphermessage(i) < 78)
                plainmessage(i)=ciphermessage(i) + 13;
            else
                plainmessage(i)=ciphermessage(i) - 13;
            end
        end
    
        
    end
    if ((ciphermessage(i) > 31 && ciphermessage(i) < 65) || (ciphermessage(i) > 90 && ciphermessage(i) < 97) )
        
    plainmessage(i)=ciphermessage(i);
    end
end
plainmessage=char(plainmessage)    
end
