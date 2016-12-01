distance = zeros(30,1);
for i = 1:30
    distance(i) = baseball1(i, pi/4);    
end
bar(distance);
