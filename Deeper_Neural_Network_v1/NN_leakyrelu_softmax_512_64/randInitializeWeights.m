function W = randInitializeWeights(L_in, L_out)

epsilon_init = sqrt(6 / (L_in + L_out));
W = rand(L_out, 1 + L_in) * 2 * epsilon_init - epsilon_init;

end
