function tickerText(s,iwidth,dt)
%This function cycles through string s displaying only iwidth characters on
%the line at a time.
%Author: J. Patrick Lacher

ticker = blanks(iwidth-1);
for x = 1:(length(s)+2*(iwidth-1))
    if x <= length(s)
        ticker = [ticker,s(x)];
    else
        ticker = [ticker,' '];
    end
    if x == 1
        disp(ticker((length(ticker)-(iwidth-1)):length(ticker)));
        pause(dt)
    elseif x > iwidth
        disp(ticker((x-iwidth+1):x));
        pause(dt)
    end
end