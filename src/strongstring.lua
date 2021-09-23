
local utf = require('lua-utf8')

local strongstring = {}
local EMPTY = ''
local SPACE = ' '

local function _isNot(argument, argument_type)
    return type(argument) ~= argument_type
end

local function _isNotString(argument)
    return _isNot(argument, 'string')
end

local function _isNotNumber(argument)
    return _isNot(argument, 'number')
end

local function _isNotTable(argument)
    return _isNot(argument, 'table')
end

local function _isNumber(argument)
    return not _isNot(argument, 'number')
end

local function _pad(str, pad_str, length)
    if _isNotString(str) then return nil end
    if _isNotString(pad_str) then
        if _isNumber(pad_str) and length == nil then
            length = pad_str
            pad_str = EMPTY
        else
            return nil
        end
    end
    if _isNotNumber(length) then return nil end

    if pad_str == EMPTY then pad_str = SPACE end
    local final_pad_str = EMPTY

    local i = 0
    while utf.len(final_pad_str) + utf.len(str) < length  do
        i = i + 1
        if i > utf.len(pad_str) then i = 1 end
        final_pad_str = final_pad_str .. utf.sub(pad_str, i, i)
    end

    return final_pad_str
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
    if _isNotTable(t) then return nil end
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

function strongstring.lpad(str, pad_str, length)
    local final_pad_string = _pad(str, pad_str, length)
    if final_pad_string == nil then return nil end
    return final_pad_string .. str
end

function strongstring.rpad(str, pad_str, length)
    local final_pad_string = _pad(str, pad_str, length)
    if final_pad_string == nil then return nil end
    return str .. final_pad_string
end

return strongstring