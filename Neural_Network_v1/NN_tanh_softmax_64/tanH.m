function g = tanH(z, grad)

h = tanh(z);

if grad == false
    g = h;
else
    g = 1 - h .^ 2;
end

end

