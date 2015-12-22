function [ratio] = getARatio (data)
    world = data.world;
    countA = sum(sum(world == 1));
    countAll = sum(sum(world ~= 0));
    ratio = countA/countAll;

end