function [ x,vectHist ] = getHist(pixelMatrix,bitDepth)
    %GETHIST This function returns a histogram of an input matrix.
    %Has the option of avoiding zeros.
    pixelVector = zeros(1,numel(pixelMatrix));
    for pixel = 1:numel(pixelMatrix)
        level = pixelMatrix(pixel);
        pixelVector(pixel) = level;
    end
    x = 0:1:2^bitDepth-1;
    vectHist =  x * 0;
    for pixel = 1:numel(pixelVector)
        vectHist(pixelVector(pixel)+1)=1+vectHist(pixelVector(pixel));
    end

end
