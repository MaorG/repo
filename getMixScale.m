function [result] = getMixScale (input, varargin)

    world = input.world;
    w = size(world, 1);
    h = size(world, 2);
    tiled = repmat(world,2);
    
    max_scale = min([w,h]) / 2;
    scale = 2;
    ratioAtScale = [];
%     while (scale <= max_scale) 
%         ratioAtScale = [ ratioAtScale ; [double(scale), (double(calcMixAtScale(tiled, w, h, scale)))]];
%         scale = 2 * scale;
%     end
    nVarargs = length(varargin{1});
    for arg = 1:nVarargs
        ratioAtScale = [ ratioAtScale ; [varargin{1}{arg}, (double(calcMixAtScale(tiled, w, h, varargin{1}{arg})))]];
%    ratioAtScale = [ ratioAtScale ; [double(16), (double(calcMixAtScale(tiled, w, h, 16)))]];
    end
    
    result = ratioAtScale;
%     while (size(ratioAtScale,1) > 1 && ratioAtScale(end,2)==0 && ratioAtScale(end-1,2)==0) 
%         ratioAtScale(end,:) = []; 
%     end
%     
%     try
%         fitResult = fit(ratioAtScale(:,1),ratioAtScale(:,2),'exp1');
%         plot(fitResult,ratioAtScale(:,1),(ratioAtScale(:,2)));
%         result = coeffvalues(fitResult);
%     catch
%         result = [NaN, NaN]; 
%     end
%     

end

function [ratio] = calcMixAtScale (tiledworld, w, h, scale)

    count = 0;
    countMix = 0;
    for i = 1:w
        for j = 1:h
           croppedWorld = tiledworld(i:(i+scale), j:(j+scale));
           if (any(1==croppedWorld(:)) || any(2==croppedWorld(:)))
               count = count + 1;
           end
           if (any(1==croppedWorld(:)) && any(2==croppedWorld(:)))
               countMix = countMix + 1;
           end
        end
    end
    
    ratio = ( double(countMix) / double(count) );
end