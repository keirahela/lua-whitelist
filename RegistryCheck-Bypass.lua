local H = getgenv()[string.reverse("noitcnufkooh")];
local registryBackup = {};
for i,v in pairs(getreg()) do
    registryBackup[i] = v;
end

-- All modifications here

local regHook;
regHook = hookfunction(getreg, newcclosure(function()
    return registryBackup;
end))
local getreg = regHook