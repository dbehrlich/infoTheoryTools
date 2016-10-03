function h_xy = calcCondEntropy(x,y)
    %% function h_xy = calcCondEntropy(x,y)
    % Calculates the conditional entropy of discrete vector x given y
    % Input:    x, (1xlength vector)
    %           y, (1xlength vector)
    % Output:   h_xy (scalar)
    %
    % Written by Daniel Ehrlich (daniel.ehrlich@yale.edu)

    mi = calcMI(x,y);
    h = calcEntropy(y);
    
    h_xy = -(mi-h);
    
end