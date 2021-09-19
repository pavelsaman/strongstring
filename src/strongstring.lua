
local strongstring = {}

function strongstring.split(str, sep)
    local token_table = {}

    if type(sep) ~= 'string' then return {str} end
    if type(str) ~= 'string' then return nil end

    if not str then return nil end
    if not sep or sep == '' then return {str} end
    if str == '' then return {str} end
    if string.len(sep) > 1 then return nil end

    for token in string.gmatch(str, "[^" .. sep .. "]+") do
        table.insert(token_table, token)
    end

    return token_table
end

function strongstring.concat(...)
    local arg = {...}
    local final_string = ''
    for _, str in ipairs(arg) do
        if type(str) ~= 'string' then return nil end
        final_string = final_string .. str
    end

    return final_string
end

function strongstring.sepconcat(...)
    local arg = {...}
    local final_string = ''
    local sep = arg[#arg]

    if #arg == 1 then return arg[1] end
    if type(sep) ~= 'string' then return nil end

    for i = 1, #arg - 1, 1 do
        if type(arg[i]) ~= 'string' then return nil end
        final_string = final_string .. arg[i] .. sep
    end

    if sep == '' then return final_string end
    return final_string:sub(0, (sep:len() * -1) - 1)
end

function strongstring.tableconcat(t)
    if type(t) ~= 'table' then return nil end
    return strongstring.concat(table.unpack(t))
end

function strongstring.septableconcat(t, sep)
    if sep == nil then sep = '' end
    if #t == 0 then return nil end

    table.insert(t, sep)
    return strongstring.sepconcat(table.unpack(t))
end

return strongstring