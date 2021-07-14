function g = leakyrelu(z, alpha, grad)

if grad == false
    g = max(z, z*alpha);
else
    g = max(z > 0, alpha);
end

end

