function H = calcEntropy(x)
    %% function H = calcEntropy(x,y)
    % Calculates the entropy of a discrete vector x
    % Input:    x, (1xlength vector)
    % Output:   H (scalar)
    %
    % Written by Daniel Ehrlich (daniel.ehrlich@yale.edu)

    u = unique(x);
    h = zeros(length(u),1);
    
    for ii = 1:length(u)
        
        h(ii) = - sum(x==u(ii))/length(x) * log2(sum(x==u(ii))/length(x));
        
    end
    
    H = sum(h);
    
end