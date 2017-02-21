function [ E ] = energy( w, x )
    E = -sum(sum(w*(x'*x)));
end

