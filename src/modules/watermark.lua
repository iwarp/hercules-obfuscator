-- modules/watermark.lua
local Watermark = {}

local function compressLuaCode(code)
    local compressedCode = code:gsub("%-%-[^\n]*", "")
    compressedCode = compressedCode:gsub("%-%-%[(.-)%]%]", "")
    compressedCode = compressedCode:gsub("%s+", " ")
    compressedCode = compressedCode:gsub("([%S])\n([%S])", "%1 %2")
    return compressedCode:match("^%s*(.-)%s*$")
end

function Watermark.process(code)
    local compressedCode = compressLuaCode(code)
    return "--[Obfuscated by Hercules V1]\n" .. compressedCode
end

return Watermark
