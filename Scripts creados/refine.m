function [x,y,phi] = refine(iter_outer,dim,num_cont,iter_refine, phi, g, lambda, mu, alfa, epsilon, timestep, iter_inner, potentialFunction)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
phi = drlse_edge(phi, g, lambda, mu, alfa, epsilon, timestep, iter_inner, potentialFunction);

pause(0.000001)

[C] = contourc(phi, [0,0]);

[x,y] = plotcontour(C,num_cont,dim);
str=['Refined!, ', num2str(iter_outer*iter_inner+iter_refine), ' iterations'];
        title(str);
end

