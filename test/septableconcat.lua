describe('stringstrong.septableconcat() #concat #sep #table', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('concat table with sep', function()
        local t = {'abc', 'def'}
        local sep = '.'
        assert.are.equals('abc.def', strongstring.septableconcat(t, sep))
    end)

    it('sep is empty', function()
        local t = {'abc', 'def'}
        local sep = ''
        assert.are.equals('abcdef', strongstring.septableconcat(t, sep))
    end)

    it('sep is wrong data type', function()
        local t = {'abc', 'def'}
        local sep = false
        assert.are.equals(nil, strongstring.septableconcat(t, sep))
    end)

    it('no sep', function()
        local t = {'abc', 'def'}
        assert.are.equals('abcdef', strongstring.septableconcat(t))
    end)

    it('table has only one element', function()
        local t = {'abc'}
        local sep = '/'
        assert.are.equals('abc', strongstring.septableconcat(t, sep))
    end)

    it('empty table', function()
        local t = {}
        local sep = '/'
        assert.are.equals(nil, strongstring.septableconcat(t, sep))
    end)

    it('table with numbers', function()
        local t = {1, 2, 3}
        local sep = '/'
        assert.are.equals(nil, strongstring.septableconcat(t, sep))
    end)
end)