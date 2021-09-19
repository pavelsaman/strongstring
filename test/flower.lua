describe('stringstrong.flower() #lower', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('make first letter lower', function()
        local string1 = 'Make lower'
        assert.are.equals('make lower', strongstring.flower(string1))
    end)

    it('first letter is already lower', function()
        local string1 = 'make lower'
        assert.are.equals('make lower', strongstring.flower(string1))
    end)

    it('pass in boolean', function()
        local string1 = true
        assert.are.equals(nil, strongstring.flower(string1))
    end)

    it('pass in nil', function()
        local string1 = nil
        assert.are.equals(nil, strongstring.flower(string1))
    end)

    it('pass in empty string', function()
        local string1 = ''
        assert.are.equals('', strongstring.flower(string1))
    end)

    it('pass in strign with white characters', function()
        local string1 = ' '
        assert.are.equals(' ', strongstring.flower(string1))
    end)

    it('utf character', function()
        local string1 = 'Ř'
        assert.are.equals('ř', strongstring.flower(string1))
    end)
end)