local LFunctionList = {
	[0] = syn.request
}

local FunctionIncrement = 0;
local allChecksPassed = false;
while true do
	if not LFunctionList[FunctionIncrement] and (FunctionIncrement == #LFunctionList + 1) then
		allChecksPassed = true
		break;
	end
	local Function = LFunctionList[FunctionIncrement]

	local GCS1, GCS2 = debug.getconstants, getconstants
	local GC1, GC2 = debug.getconstant, getconstant
	local GI1, GI2 =  debug.getinfo, getinfo
	local ICL1, ICL2 = islclosure, syn_islclosure
	local GUVS1, GUVS2 = debug.getupvalues, getupvalues
	local GUV1, GUV2 = debug.getupvalue, getupvalue

	local ConstantsCheck1, ConstantsCheck2 = pcall(function()
		GCS1(Function)
	end), pcall(function()
		GCS2(Function)
	end)
	if ConstantsCheck1 or ConstantsCheck2 then
        while true do end
	end

    local ConstantCheck1,ConstantCheck2 = pcall(function()
        GC1(Function, 1)
    end),pcall(function()
        GC2(Function, 1)
    end)
    if ConstantCheck1 or ConstantCheck2 then
        while true do end
	end

    local FSRC1,FSRC2 = GI1(function()end).source, GI2(function()end).source
    local NCFSRC1,NCFSRC2 = GI1(newcclosure(function()end)).source, GI2(newcclosure(function()end)).source
    local FS1,FS2 = GI1(Function).source, GI2(Function).source
    if FSRC1 ~= FSRC2 or not(FSRC1 == FSRC2) or NCFSRC1 ~= NCFSRC2 or not(NCFSRC1 == NCFSRC2) then
        while true do end
    end
    if (FS1 == FSRC1 or not(FS1 ~= FSRC1) or FS2 == FSRC1 or not(FS2 ~= FSRC1)) then
        while true do end
    end
    if (FS1 == FSRC2 or not(FS1 ~= FSRC2) or FS2 == FSRC2 or not(FS2 ~= FSRC2)) then
        while true do end
    end
    if (FS1 ~= NCFSRC2 or not(FS1 == NCFSRC2) or FS2 ~= NCFSRC2 or not(FS2 == NCFSRC2)) then
        while true do end
    end
    if (FS1 ~= NCFSRC1 or not(FS1 == NCFSRC1) or FS2 ~= NCFSRC1 or not(FS2 == NCFSRC1)) then
        while true do end
    end

    local ILC1,ICL2 = ICL1(Function), ICL2(Function)
    if ILC1 or ILC2 then
        while true do end
    end

    local ValuesCheck1, ValuesCheck2 = GUVS1(Function),GUVS2(Function)
    if #ValuesCheck1 ~= 0 or #ValuesCheck2 ~= 0 then
        while true do end
    else
        for i,v in pairs(ValuesCheck1) do
            if type(v) ~= "userdata" then
                while true do end
            end
        end
        for i,v in pairs(ValuesCheck2) do
            if type(v) ~= "userdata" then
                while true do end
            end
        end
    end

    local ValueCheck1, ValueCheck2 = GUV1(Function, 1),GUV2(Function, 1)
    if type(ValueCheck1) ~= "userdata" or type(ValueCheck2) ~= "userdata" then
        while true do end
    end
    -- Cyclops if you ask I am going to smite you, this took way to much brain power
	FunctionIncrement = FunctionIncrement + 1
end