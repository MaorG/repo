function [count] = getTotalCount (data)
    world = data.world;
    count = sum(sum(world ~= 0));

end