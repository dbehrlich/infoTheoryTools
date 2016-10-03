function MI = calcMI(x,y)
    %% function MI = calcMI(x,y)
    % Calculates the mutual information between discrete vectors x and y
    % Input:    x, (1xlength vector)
    %           y, (1xlength vector)
    % Output:   MI (scalar)
    %
    % Written by Daniel Ehrlich (daniel.ehrlich@yale.edu)

    assert(length(x)==length(y),'x and y need to be the same length')

    ux = unique(x);
    uy = unique(y);
    
    numX = length(ux);
    numY = length(uy);
    
    mi = zeros(numX,numY);
    
    for ii = 1:numX
        px(ii) = sum(x==ux(ii))/length(x);
    end
    
    for jj = 1:numY
        py(jj) = sum(y==uy(jj))/length(y);
    end
    
    for kk = 1:numX
        for hh = 1:numY
            pxy(kk,hh) = sum(x==ux(kk) & y==uy(hh))/length(x);
        end
    end
    
    for ff = 1:numX
        for gg = 1:numY
            
            mi(ff,gg) = pxy(ff,gg)*log2(pxy(ff,gg)/(px(ff)*py(gg)));
            
        end
    end
    
    MI = nansum(mi(:));
    
end