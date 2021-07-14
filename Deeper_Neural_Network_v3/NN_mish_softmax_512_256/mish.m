function g = mish(z, grad)

if grad == false
    g = z .* tanh(log(1 + exp(z)));
else
    eZ = exp(z);
    e2Z = eZ .* eZ;
    e3Z = e2Z .* eZ;
    omega = 4*(z+1) + 4*e2Z + e3Z + eZ .* (4*z+6);
    delta = 2*eZ + e2Z + 2;
    g = (eZ .* omega) ./ (delta .^ 2);
end

