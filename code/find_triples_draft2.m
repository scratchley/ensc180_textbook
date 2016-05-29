function res = find_triples_draft2 (n)
    for a=1:n-1
        for b=a:n
            c = hypotenuse(a, b);
            flag = isintegral(c);
            if flag
                [a, b, c]
            end
        end
    end
end

