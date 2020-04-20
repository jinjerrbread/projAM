function[intermed,interm_key,cipher]=xorr1(input,key)


    intermed=dec2bin(double(input));
    interm_key=dec2bin(double(key));
    if(length(input)>length(key))
        x=length(input)-length(key);
        interm_key=repmat(interm_key,x,1);
        interm_key=interm_key(1:length(input),:)
    end
    [m,n]=size(intermed);
    for i=1:m
        for j=1:7
        if(intermed(i,j) ~= interm_key(i,j))
            cipher(i,j)=0;
        else
            cipher(i,j)=1;
        end
            
        end
    end
    
    for i=1:length(input)
    interm_cipher(i)=bin2dec(num2str(cipher(i,:)));
    end
    ex=char(interm_cipher)
    
  
end
