function g = sigmoid(z, grad)

h = 1 ./ (1 + exp(-z));

if grad == false
    g = h;
else
    g = h .* (1 - h);
end

end
