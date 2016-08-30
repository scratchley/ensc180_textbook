function res = rats_8_7(t, y)  
    a = 0.01;
    omega = 2 * pi / 365;
    r = a * y * (1 + sin(omega * t)); %WRONG    
end
