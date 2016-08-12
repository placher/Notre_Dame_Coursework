%plotPiecewise.m

%This program plots a piecewise function defined in problem 12 on page 91
%of 'Learning to Program With MATLAB' over the range[-2,2].

%   Author: J. Patrick Lacher

clear
clc

%% Define Plottable Arrays

domain = linspace(-2,2,81);

tvar = 1;

for x=-2:.05:2
    if x < -1.5
        graph(tvar) = 0;
    else
        if ismember(x,linspace(-1.5,-1,100))
            graph(tvar) = (2*x)+3;
        else
            if ismember(x,linspace(-.999,.999,100))
                graph(tvar) = -sin(pi*x/2);
            else
                if ismember(x,linspace(1,1.5,100))
                    graph(tvar) = (2*x)-3;
                else
                    if x > 1.5
                        graph(tvar) = 0;
                    end
                end
            end
        end
    end
    tvar = tvar + 1;
end

%% Plot Graph

plot(domain,graph)