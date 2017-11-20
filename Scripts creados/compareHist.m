function [ coef ] = compareHist(pixelMatrix1,pixelMatrix2,bitDepth1,bitDepth2,simiCoef)
    %COMPAREHIST This function returns the match coef depending on the histograms of two images.
    %simiCoef variable is used for defining a coefficient [0,1] of similarity.

    [x,hist1] = getHist(pixelMatrix1,bitDepth1);
    [~,hist2] = getHist(pixelMatrix2,bitDepth2);
    comp = hist1 * 0;
    for i = 1 : numel(hist1)
      if hist1(i)*simiCoef<=hist2(i)
        comp(i)=1;
      end
    end
    coef = sum(comp)/numel(comp);
end
