describe('stringstrong.endsWith() #search #endsWith', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('string ends with a given search string', function()
        local str = 'Some string to search in.'
        local search_str = 'in.'
        assert.are.equals(true, strongstring.endsWith(str, search_str))
    end)

    it('string does not end with a given search string', function()
        local str = 'Some string to search in.'
        local search_str = 'in'
        assert.are.equals(false, strongstring.endsWith(str, search_str))
    end)

    it('search is case sensitive', function()
        local str = 'Some string to search in.'
        local search_str = 'IN.'
        assert.are.equals(false, strongstring.endsWith(str, search_str))
    end)

    it('string is not string data type', function()
        local str = 6
        local search_str = 'in'
        assert.are.equals(nil, strongstring.endsWith(str, search_str))
    end)

    it('search string is not string data type', function()
        local str = 'abc'
        local search_str = 1
        assert.are.equals(nil, strongstring.endsWith(str, search_str))
    end)

    it('string is nil', function()
        local str = nil
        local search_str = 'abc'
        assert.are.equals(nil, strongstring.endsWith(str, search_str))
    end)

    it('search string is nil', function()
        local str = 'ciao'
        local search_str = nil
        assert.are.equals(nil, strongstring.endsWith(str, search_str))
    end)

    it('search string is missing', function()
        local str = 'ciao'
        assert.are.equals(nil, strongstring.endsWith(str))
    end)

    it('search string contains a special character for regex', function()
        local str = 'ciao%$'
        local search_str = 'o%$'
        assert.are.equals(true, strongstring.endsWith(str, search_str))
    end)
end)