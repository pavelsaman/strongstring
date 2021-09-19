describe('stringstrong.tableconcat() #concat #table', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('concat table', function()
        local table_of_string = {'a', 'b', 'c'}
        assert.are.equals('abc', strongstring.tableconcat(table_of_string))
    end)

    it('concat table with one element', function()
        local table_of_string = {'a'}
        assert.are.equals('a', strongstring.tableconcat(table_of_string))
    end)

    it('concat table with wrong data types', function()
        local table_of_string = {false}
        assert.are.equals(nil, strongstring.tableconcat(table_of_string))
    end)

    it('no table passed in', function()
        local table_of_string = false
        assert.are.equals(nil, strongstring.tableconcat(table_of_string))
    end)
end)