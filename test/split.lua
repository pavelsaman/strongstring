describe('stringstrong.split() #split', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('splits string when one char is provided', function()
        local str = 'string/to/split'
        local sep = '/'
        assert.are.same({'string', 'to', 'split'}, strongstring.split(str, sep))
    end)

    it('splits string when one word is provided', function()
        local str = 'string/to/split'
        local sep = 'to'
        assert.are.same(nil, strongstring.split(str, sep))
    end)

    it('nil passed in as string', function()
        local str = nil
        local sep = '.'
        assert.are.same(nil, strongstring.split(str, sep))
    end)

    it('nil passed in as sep', function()
        local str = 'some string'
        local sep = nil
        assert.are.same({'some string'}, strongstring.split(str, sep))
    end)

    it('sep is empty', function()
        local str = 'some string'
        local sep = ''
        assert.are.same({'some string'}, strongstring.split(str, sep))
    end)

    it('string is empty', function()
        local str = ''
        local sep = '.'
        assert.are.same({''}, strongstring.split(str, sep))
    end)

    it('sep not in string', function()
        local str = 'some string to split'
        local sep = '.'
        assert.are.same({'some string to split'}, strongstring.split(str, sep))
    end)

    it('sep is not string type', function()
        local str = 'some string to split'
        local sep = {'.'}
        assert.are.same({'some string to split'}, strongstring.split(str, sep))
    end)

    it('sep is boolean', function()
        local str = 'some string to split'
        local sep = false
        assert.are.same({'some string to split'}, strongstring.split(str, sep))
    end)

    it('str is not string type', function()
        local str = {'some string to split'}
        local sep = '.'
        assert.are.same(nil, strongstring.split(str, sep))
    end)

    it('str is boolean', function()
        local str = true
        local sep = '.'
        assert.are.same(nil, strongstring.split(str, sep))
    end)

    it('split by newline', function()
        local str = 'string with\nnewline'
        local sep = '\n'
        assert.are.same({'string with', 'newline'}, strongstring.split(str, sep))
    end)

    it('splits string when magic char "]" is provided', function()
        local str = 'string]to]split'
        local sep = ']'
        assert.are.same({'string', 'to', 'split'}, strongstring.split(str, sep))
    end)

    it('splits string when magic char "*" is provided', function()
        local str = 'string*to*split'
        local sep = '*'
        assert.are.same({'string', 'to', 'split'}, strongstring.split(str, sep))
    end)
end)