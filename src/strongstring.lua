
local utf = require('lua-utf8')

local strongstring = {}
local EMPTY = ''

local function _isNotString(argument)
    return type(argument) ~= 'string'
end

function strongstring.split(str, sep)
    local token_table = {}

    if _isNotString(sep) then return {str} end
    if _isNotString(str) then return nil end

    if not str then return nil end
    if not sep or sep == EMPTY then return {str} end
    if str == EMPTY then return {str} end
    if utf.len(sep) > 1 then return nil end

    for token in string.gmatch(str, "[^" .. sep .. "]+") do
        table.insert(token_table, token)
    end

    return token_table
end

function strongstring.concat(...)
    local arg = {...}
    local final_string = EMPTY
    for _, str in ipairs(arg) do
        if _isNotString(str) then return nil end
        final_string = final_string .. str
    end

    return final_string
end

function strongstring.sepconcat(...)
    local arg = {...}
    local final_string = EMPTY
    local sep = arg[#arg]

    if #arg == 1 then return arg[1] end
    if _isNotString(sep) then return nil end

    for i = 1, #arg - 1, 1 do
        if _isNotString(arg[i]) then return nil end
        final_string = final_string .. arg[i] .. sep
    end

    if sep == EMPTY then return final_string end
    return utf.sub(final_string, 0, (utf.len(sep) * -1) - 1)
end

function strongstring.tableconcat(t)
    if type(t) ~= 'table' then return nil end
    return strongstring.concat(table.unpack(t))
end

function strongstring.septableconcat(t, sep)
    if sep == nil then sep = EMPTY end
    if #t == 0 then return nil end

    table.insert(t, sep)
    return strongstring.sepconcat(table.unpack(t))
end

function strongstring.fupper(str)
    if _isNotString(str) then return nil end
    return utf.upper(utf.sub(str, 0, 1)) .. utf.sub(str, 2, utf.len(str))
end

function strongstring.flower(str)
    if _isNotString(str) then return nil end
    return utf.lower(utf.sub(str, 0, 1)) .. utf.sub(str, 2, utf.len(str))
end

function strongstring.ltrim(str)
    if _isNotString(str) then return nil end
    return utf.gsub(str, '^%s+', EMPTY)
end

function strongstring.rtrim(str)
    if _isNotString(str) then return nil end
    return utf.gsub(str, '%s+$', EMPTY)
end

function strongstring.trim(str)
    if _isNotString(str) then return nil end
    
    local final_str = strongstring.ltrim(str)
    return strongstring.rtrim(final_str)
end

return strongstring