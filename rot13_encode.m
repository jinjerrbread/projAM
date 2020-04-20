function [ciphermessage] = rot13_encode(plainmessage)

for i=1:length(plainmessage)
    if(plainmessage(i) >= 97 && plainmessage(i) <= 122)
        if(plainmessage(i) > 96 && plainmessage(i) < 110)
            ciphermessage(i)=plainmessage(i) + 13;
        else
            ciphermessage(i)=plainmessage(i) - 13;
        end
    else
        if(plainmessage(i) >= 65 && plainmessage(i) <= 90)
            if(plainmessage(i) > 64 && plainmessage(i) < 78)
                ciphermessage(i)=plainmessage(i) + 13;
            else
                ciphermessage(i)=plainmessage(i) - 13;
            end
        end
      
       
    end
    if ((plainmessage(i) > 31 && plainmessage(i) < 65) || (plainmessage(i) > 90 && plainmessage(i) < 97) )
        
    ciphermessage(i)=plainmessage(i);
    end
end
ciphermessage=char(ciphermessage);
end

