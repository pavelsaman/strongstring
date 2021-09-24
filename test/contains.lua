describe('stringstrong.contains() #search #contains', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('string contains search string', function()
        local str = 'Some string to search in.'
        local search_str = 'to '
        assert.are.equals(true, strongstring.contains(str, search_str))
    end)

    it('string does not contain search string', function()
        local str = 'Some string to search in.'
        local search_str = 'to\t'
        assert.are.equals(false, strongstring.contains(str, search_str))
    end)

    it('search is case sensitive', function()
        local str = 'Some string to search in.'
        local search_str = 'tO'
        assert.are.equals(false, strongstring.contains(str, search_str))
    end)

    it('search string is in string multiple times', function()
        local str = 'Some string to search in.'
        local search_str = ' '
        assert.are.equals(true, strongstring.contains(str, search_str))
    end)

    it('search string is empty', function()
        local str = 'Some string to search in.'
        local search_str = ''
        assert.are.equals(true, strongstring.contains(str, search_str))
    end)

    it('search string is nil', function()
        local str = 'Some string to search in.'
        local search_str = nil
        assert.are.equals(nil, strongstring.contains(str, search_str))
    end)

    it('search string is missing', function()
        local str = 'Some string to search in.'
        assert.are.equals(nil, strongstring.contains(str))
    end)

    it('search string is not string data type', function()
        local str = 'Some string to search in.'
        local search_str = 5
        assert.are.equals(nil, strongstring.contains(str, search_str))
    end)

    it('string is nil', function()
        local str = nil
        local search_str = ' '
        assert.are.equals(nil, strongstring.contains(str, search_str))
    end)

    it('string is not string data type', function()
        local str = 6
        local search_str = ' '
        assert.are.equals(nil, strongstring.contains(str, search_str))
    end)

    it('search string contains a special character for regex', function()
        local str = 'ciao('
        local search_str = '('
        assert.are.equals(true, strongstring.contains(str, search_str))
    end)
end)