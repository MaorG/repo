function [ ] = displayResultGraphs( resultTable, scale )
    
    numOfGraphs = size(resultTable.valsA,2);
    
    for ii = 1:size(resultTable.valsA,2)
        
        subplot(numOfGraphs, 1, ii);
        plot(resultTable.valsB, resultTable.T(ii,:));
        
    end

%     set(gca,'YTick', 1:size(resultTable.valsA,2));
%     set(gca,'XTick', 1:size(resultTable.valsB,2));
%     set(gca,'YTickLabel',resultTable.valsA);
%     set(gca,'XTickLabel',resultTable.valsB);
%     axis xy
%     colorbar();
%     if (scaled)
%         caxis([0,1])
%     end

end

