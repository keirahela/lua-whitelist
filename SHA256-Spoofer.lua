-- SHA512 Hashing Fucker

local H = getgenv()[string.reverse("noitcnufkooh")]
local SHA512;
SHA512 = H(table.concat, newcclosure(function(...)
    if checkcaller() then
        local T = {...}
        if type(T[1]) == "table" and #tostring(T[1][1]) == 16 then
            local toSpoofTo, outTable = "GetSpoofed", {} -- Strings are usually 8 letters in length, suggest to use 8 to prevent anti-spoofing
            for i=1, 8 do table.insert(outTable, toSpoofTo) end
            T[1] = outTable
            return SHA512(unpack(T))
        end
    end
    return SHA512(...)
end))