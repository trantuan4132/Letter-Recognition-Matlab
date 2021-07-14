function g = swish(z, grad)

sig = 1 ./ (1 + exp(-z));
h = z .* sig;

if grad == false
    g = h;
else
    g = h + sig .* (1 - h);
end

end

