function res = rats3(t, y)
    a = 0.005;
    omega = 2 * pi / 365;
    res = a * y * (1 + 2*sin(omega * t));
end