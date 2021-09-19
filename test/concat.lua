describe('stringstrong.concat() #concat', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('concat two strings', function()
        local string1 = 'abc'
        local string2 = 'def'
        assert.are.equals(string1 .. string2, strongstring.concat(string1, string2))
    end)

    it('string1 is not string type', function()
        local string1 = false
        local string2 = 'def'
        assert.are.equals(nil, strongstring.concat(string1, string2))
    end)

    it('string2 is not string type', function()
        local string1 = 'abc'
        local string2 = true
        assert.are.equals(nil, strongstring.concat(string1, string2))
    end)

    it('string1 is empty', function()
        local string1 = ''
        local string2 = 'def'
        assert.are.equals(string1 .. string2, strongstring.concat(string1, string2))
    end)

    it('concat more than two strings', function()
        local string1 = ''
        local string2 = 'def'
        local string3 = 'ghi'
        assert.are.equals(string1 .. string2 .. string3, strongstring.concat(string1, string2, string3))
    end)

    it('concat more than two strings, last string is not string type', function()
        local string1 = ''
        local string2 = 'def'
        local string3 = {false}
        assert.are.equals(nil, strongstring.concat(string1, string2, string3))
    end)
end)