filteredData = allData;%([allData.time] >= 2000);






classifiedData = classify2mat2D(filteredData, 'paramA', 'paramB');

scaleColor = true;


cruns = cell(size(classifiedData.T));

%use arrayfunc
for ii = 1:numel(classifiedData.T)

    data = classifiedData.T(ii);
   ids = extractfield(data{1}, 'id');
   ids = unique(ids);
   runs = cell(size(ids(ids~=0)));
   jj = 0;
    for id = ids
        if (id ~= 0) % ???
            jj = jj + 1;
            run = data{1}([data{1}.id] == id);
            times = extractfield(run, 'time');
            [t,order] = sort(times);
            run = run(order);
            runs(jj)= {run};
        end
    end
    
    cruns(ii) = {runs};
end


figure(411);
suptitle('mix mean')

[cols, rows] = size(cruns);

for i = 1:numel(cruns)
    subplot(rows,cols,i);
    
    
    
    
    for run = cruns{i}
        rtMix = createResultTable(run{1}, 'paramA', 'time', 'mean', 'mix', 1, 2);
        rtRatio = createResultTable(run{1}, 'paramA', 'time', 'mean', 'count');
        y = rtMix.T;
        x = rtMix.valsB;
        z = zeros(size(rtMix.T));
        c = rtRatio.T;
        surface([x;x],[y;y],[z;z],[c;c],...
            'facecol','no',...
            'edgecol','interp',...
            'linew',1);
        
        %plot(rtMix.T);
        
        caxis([0,5000]);
        hold on;
    end
    
        title(['d: ', num2str(cruns{i}{1}(1).paramA), ' g: ', num2str(cruns{i}{1}(1).paramB)]);

    axis([-inf,inf,0,1])
end

