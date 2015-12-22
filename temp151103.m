FigHandle = figure(4);
set(FigHandle, 'Position', [100, 100, 750, 250]);

pp = [
    0, 0;
    1, 1; 
    1, 0; 
    1, -1;
    -1, 0;
    -1, -1]; 

for i = 1:size(pp,1)
    
    pA = pp(i,1);
    pB = pp(i,2);
    
    g = getDataByParams(allData, pA, pB);

    
    
    subplot(2,size(pp,1),i+size(pp,1))
    cfs = getMixScale(g(1), true);
    legend('hide')
    title (sprintf('y=%.2f exp(x * %.2f) ', cfs(1), cfs(2)));
    
        
    subplot(2,size(pp,1),i)
    title(sprintf( '%d, %d',pA , pB));
    print_world(g(1).world);

end