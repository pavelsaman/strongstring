describe('stringstrong.fupper() #upper', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('make first letter upper', function()
        local string1 = 'make upper'
        assert.are.equals('Make upper', strongstring.fupper(string1))
    end)

    it('first letter is already upper', function()
        local string1 = 'Make upper'
        assert.are.equals('Make upper', strongstring.fupper(string1))
    end)

    it('pass in boolean', function()
        local string1 = true
        assert.are.equals(nil, strongstring.fupper(string1))
    end)

    it('pass in nil', function()
        local string1 = nil
        assert.are.equals(nil, strongstring.fupper(string1))
    end)

    it('pass in empty string', function()
        local string1 = ''
        assert.are.equals('', strongstring.fupper(string1))
    end)

    it('pass in strign with white characters', function()
        local string1 = ' '
        assert.are.equals(' ', strongstring.fupper(string1))
    end)
end)