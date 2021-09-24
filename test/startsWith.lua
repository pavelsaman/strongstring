describe('stringstrong.startsWith() #search #startsWith', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('string starts with a given search string', function()
        local str = 'Some string to search in.'
        local search_str = 'Some'
        assert.are.equals(true, strongstring.startsWith(str, search_str))
    end)

    it('search is case sensitive', function()
        local str = 'Some string to search in.'
        local search_str = 'some'
        assert.are.equals(false, strongstring.startsWith(str, search_str))
    end)

    it('string does not start with a given search string', function()
        local str = 'Some string to search in.'
        local search_str = 'a'
        assert.are.equals(false, strongstring.startsWith(str, search_str))
    end)

    it('spaces in search string', function()
        local str = 'Some string to search in.'
        local search_str = 'Some string'
        assert.are.equals(true, strongstring.startsWith(str, search_str))
    end)

    it('search string not given', function()
        local str = 'Some string to search in.'
        local search_str = 'Some string'
        assert.are.equals(nil, strongstring.startsWith(str))
    end)

    it('search string is not a string', function()
        local str = 'Some string to search in.'
        local search_str = 5
        assert.are.equals(nil, strongstring.startsWith(str, search_str))
    end)

    it('string is nil', function()
        local search_str = 'Some string'
        assert.are.equals(nil, strongstring.startsWith(nil, search_str))
    end)

    it('string is not string data type', function()
        local str = 5
        local search_str = 'Some string'
        assert.are.equals(nil, strongstring.startsWith(str, search_str))
    end)

    it('search string contains a special character for regex', function()
        local str = '[ciao]'
        local search_str = '['
        assert.are.equals(true, strongstring.startsWith(str, search_str))
    end)
end)