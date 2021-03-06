function [] = temp3_print_worlds (cruns, time, paramC)

% cr = cell([1,1]);
% cr{1} = cruns{3,3};
%  cr{2} = cruns{3,5};
% 
cr = cruns;
[cols, rows] = size(cr);

figure;
 %title('homogeneous');
for row = 1:rows
    for col = 1:cols
        
%        h = subplot(rows,cols,((col - 1) * cols) + (rows + 1 - row));
        h = subplot(rows,cols,rows * (row - 1) + col);
        ax=get(h,'Position');
%         ax(4)=ax(4)*1.25; 
%         ax(3)=ax(4); 
        set(h,'Position',ax);
        hold on;
        
        if row == rows
           %text(ax(1) - 1, ax(2), ['d = ', num2str(cr{col, row}{1}(1).paramA)]); 
        end
        if col == 1
           %text(ax(1), ax(2) + 1, ['g = ', num2str(cr{col, row}{1}(1).paramB)]); 
        end
        
       for run = cr{col, row}
            
            if (run{1}(1).paramC == paramC)
                for frame = run{1}'
                    if frame.time == time;
                        
                       
                        print_world(frame.world);
                                            CMap = [
                        0, 0, 0;
                        1, 0, 0;
                        0, 0, 1];
                        colorMat  = ind2rgb(frame.world + 1, CMap);
                    
                        imshow(colorMat);
                       imagesc([0,2], [0,2], flipud(colorMat));
                    
                    end
                end
            end
        end
        
        hold on;

       %imagesc(C);
       title([cruns{col, row}{1}(1).nameA, ': ', num2str(cruns{col, row}{1}(1).paramA), ' ', cruns{col, row}{1}(1).nameB  ,': ', num2str(cruns{col, row}{1}(1).paramB)]);%, num2str(floor(nanmean(coeff)))]);

       % title(['d: ', num2str(cr{col, row}{1}(1).paramA), ' g: ', num2str(cr{col, row}{1}(1).paramB)]);
    end
end


end
