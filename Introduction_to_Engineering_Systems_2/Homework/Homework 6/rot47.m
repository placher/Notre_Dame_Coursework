function so = rot47(si)
%This function uses ASCII codes to encrypt and decrypt strings using a
%rotational cypher.
%Author: J. Patrick Lacher

code = double(si);
for x = 1:length(si)
    if code(x) + 47  <= 125
        so(x) = code(x) + 46;
    elseif code(x) + 47 > 125
        so(x) = code(x) + 47 - 93;
    end
end
so = char(so);