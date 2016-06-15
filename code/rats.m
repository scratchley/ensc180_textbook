function res = rats(t, y)
    plot(t,y,'bo');
    a = 0.01;
    omega = 2 * pi / 365;
    res = a * y * (1 + sin(omega * t)); 
    %res = a * y * (0.5 + sin(omega * t)); zgx: original
end
