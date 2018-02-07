%% Scripts convert an input squarematrix to Tuple for mat
len = length(cont);
c= [];
for row = 1:len
    for col = row+1:len
        IF = cont(row,col);       
        c = [c ; row col IF];
    end
end

cont  = c;
clear c;