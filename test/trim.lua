describe('stringstrong.trim() #trim', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('Trim whitespace from beginning of string', function()
        local string = '  Trim this!'
        assert.are.equals('Trim this!', strongstring.trim(string))
    end)

    it('Trim whitespace from end of string', function()
        local string = 'Trim this!   '
        assert.are.equals('Trim this!', strongstring.trim(string))
    end)

    it('Trim whitespace from both sides', function()
        local string = ' Trim this!   '
        assert.are.equals('Trim this!', strongstring.trim(string))
    end)

    it('Trim tab', function()
        local string = '\tTrim this!  \t '
        assert.are.equals('Trim this!', strongstring.trim(string))
    end)

    it('Trim tab', function()
        local string = '\tTrim this!  \t '
        assert.are.equals('Trim this!', strongstring.trim(string))
    end)

    it('Trim vertical tab', function()
        local string = 'Trim this!  \v'
        assert.are.equals('Trim this!', strongstring.trim(string))
    end)

    it('Trim U+0085 NEXT LINE', function()
        local string = 'Trim this!  '
        assert.are.equals('Trim this!', strongstring.trim(string))
    end)

    it('Trim newline', function()
        local string = '\nTrim this!'
        assert.are.equals('Trim this!', strongstring.trim(string))
    end)

    it('Trim U+2029 PARAGRAPH SEPARATOR', function()
        local string = ' Trim this!'
        assert.are.equals('Trim this!', strongstring.trim(string))
    end)

    it('Pass in nil', function()
        local string = nil
        assert.are.equals(nil, strongstring.trim(string))
    end)

    it('Pass in number', function()
        local string = 5
        assert.are.equals(nil, strongstring.trim(string))
    end)

    it('Pass in table', function()
        local string = {5}
        assert.are.equals(nil, strongstring.trim(string))
    end)

    it('Pass in string with only whitespace', function()
        local string = '\t  '
        assert.are.equals('', strongstring.trim(string))
    end)

    it('Pass in empty string', function()
        local string = ''
        assert.are.equals('', strongstring.trim(string))
    end)

    it('Pass in string with one whitespace character', function()
        local string = ' '
        assert.are.equals('', strongstring.trim(string))
    end)
end)