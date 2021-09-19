describe('stringstrong.sepconcat() #concat #sep', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('concat two strings with char separator', function()
        local string1 = 'abc'
        local string2 = 'def'
        local sep = '.'
        assert.are.equals(string1 .. sep .. string2, strongstring.sepconcat(string1, string2, sep))
    end)

    it('concat one strings with char separator', function()
        local string1 = 'abc'
        local sep = '.'
        assert.are.equals(string1, strongstring.sepconcat(string1, sep))
    end)

    it('string is wrong data type', function()
        local string1 = {}
        local sep = '.'
        assert.are.equals(nil, strongstring.sepconcat(string1, sep))
    end)

    it('sep is wrong data type', function()
        local string1 = 'a'
        local sep = true
        assert.are.equals(nil, strongstring.sepconcat(string1, sep))
    end)

    it('no separator passed in', function()
        local string1 = 'abc'
        assert.are.equals(string1, strongstring.sepconcat(string1))
    end)

    it('no separator passed in, string has one character', function()
        local string1 = '.'
        assert.are.equals(string1, strongstring.sepconcat(string1))
    end)

    it('sep is an empty string', function()
        local string1 = '.'
        local string2 = '/'
        local sep = ''
        assert.are.equals(string1 .. string2, strongstring.sepconcat(string1, string2, sep))
    end)

    it('sep is longer than strings', function()
        local string1 = '.'
        local string2 = '/'
        local sep = 'someverylongseparator'
        assert.are.equals(string1 .. sep .. string2, strongstring.sepconcat(string1, string2, sep))
    end)
end)