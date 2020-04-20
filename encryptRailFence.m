function [cipher,RailFence] = encryptRailFence(text,key,replace_space)
    
    %simple to use function
    %[cipher,RailFence] = encryptRailFence('how areU',4,'*')
    %cipher = 'he*orU*wa****' % more detail in RailFence variable
    
    text = strrep(text,' ',replace_space);
    Railkey = key+1;
    nexttext = 1;
    textlength = length(text);
    
    for i=1:textlength/key
        if mod(Railkey,key) == 1
            
            for Railkey = 1:key
                if nexttext <= textlength
                    RailFence{Railkey,nexttext} = text(nexttext); %#ok<AGROW>
                else
                    RailFence{Railkey,nexttext} = replace_space; %#ok<AGROW>
                end
                nexttext = nexttext+1;
            end
        end
        if mod(Railkey,key) == 0
            for Railkey = key-1:-1:2
                if nexttext <= textlength
                    RailFence{Railkey,nexttext} = text(nexttext);
                else
                    RailFence{Railkey,nexttext} = replace_space;
                end
                Railkey = Railkey-1; %#ok<FXSET>
                nexttext = nexttext+1;
            end
        end
    end
    RailFence{1,size(RailFence,2)+1} = replace_space; 
    cipher = '';
    xsize1 = size(RailFence,1);
    xsize2 = size(RailFence,2);
    for j=1:xsize1
        for i=1:xsize2
           if ~isempty(RailFence{j,i})
               cipher = [cipher RailFence{j,i}]; %#ok<AGROW>
           end
        end
    end
end