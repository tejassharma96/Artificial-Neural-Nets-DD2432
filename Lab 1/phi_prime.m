function retval = phi_prime(x)
    retval = ((1 + phi(x)).*(1 - phi(x))) ./ 2
endfunction