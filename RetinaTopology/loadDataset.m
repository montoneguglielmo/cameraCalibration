function grayScaleImg = loadDataset(datasetImg)


file_to_load = dir(datasetImg);
pathstr = fileparts(datasetImg);

for ind = 1:length(file_to_load)
    dataset{ind} = load([pathstr '/' file_to_load(ind).name]);   
end

count = 0;
if length(dataset) > 1
    for ind = 1:length(dataset)
       grayTemp = dataset{ind}.grayScaleImg;
       
       for ind2 = 1:length(grayTemp)
           if(~isempty(grayTemp{ind2}))
               count = count+1;
               grayScaleImg{count} = grayTemp{ind2};
               
           end
       end
       
        
    end
    
else
    grayScaleImg =dataset{1}.grayScaleImg;
end