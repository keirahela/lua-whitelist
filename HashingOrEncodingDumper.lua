local validTypes = {['a'] = true,['A'] = true,['b'] = true,['B'] = true,['c'] = true,['C'] = true,['d'] = true,['D'] = true,['e'] = true,['E'] = true,['f'] = true,['F'] = true,['g'] = true,['G'] = true,['h'] = true,['H'] = true,['i'] = true,['I'] = true,['j'] = true,['J'] = true,['k'] = true,['K'] = true,['l'] = true,['L'] = true,['m'] = true,['M'] = true,['n'] = true,['N'] = true,['o'] = true,['O'] = true,['p'] = true,['P'] = true,['q'] = true,['Q'] = true,['r'] = true,['R'] = true,['s'] = true,['S'] = true,['t'] = true,['T'] = true,['u'] = true,['U'] = true,['v'] = true,['V'] = true,['w'] = true,['W'] = true,['x'] = true,['X'] = true,['y'] = true,['Y'] = true,['z'] = true,['Z'] = true,['1'] = true,['2'] = true,['3'] = true,['4'] = true,['5'] = true,['6'] = true,['7'] = true,['8'] = true,['9'] = true,['0'] = true,['~'] = true,['`'] = true,['!'] = true,['@'] = true,['#'] = true,['$'] = true,['%'] = true,['^'] = true,['&'] = true,['*'] = true,['('] = true,[')'] = true,['_'] = true,['-'] = true,['+'] = true,['='] = true,['['] = true,['{'] = true,[']'] = true,['}'] = true,['|'] = true,[''] = true,['"'] = true,[';'] = true,[':'] = true,['?'] = true,['.'] = true,['>'] = true,['<'] = true,[' '] = true,}

local i = 0;
local isVM = true;
local ByteHook;
local AlreadyExist = {}
ByteHook = hookfunction(string.byte, function(...)
    if isVM then
            if (({...})[1]) then
                if validTypes[string.sub(({...})[1], 1, 1)] then
                    local Guess = ({...})[1]
                    if not AlreadyExist[Guess] and #Guess > 1 and string.sub(Guess, 1 ,3) ~= "PSU" and #Guess < 500 then
                        print("SHA DETECTED: "..Guess)
                        appendfile("out.txt", "SHA: "..Guess.."\n")
                        AlreadyExist[Guess] = true
                    end
                end
            end
        end
    return ByteHook(...)
end)