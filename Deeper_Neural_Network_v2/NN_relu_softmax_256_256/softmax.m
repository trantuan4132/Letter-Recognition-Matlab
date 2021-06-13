function g = softmax(z)

g = exp(z);
g = bsxfun(@rdivide, g, sum(g, 2));

end