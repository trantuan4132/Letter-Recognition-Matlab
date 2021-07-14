function g = relu(z, grad)

if grad == false
    g = max(z, 0);
else
    g = z > 0;
end

end