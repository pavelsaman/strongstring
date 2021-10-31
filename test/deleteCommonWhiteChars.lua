describe('stringstrong.deleteCommonWhiteChars() #delete #char #white', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('delete spaces', function()
        local string = 'step on no pets'
        assert.are.equals('steponnopets', strongstring.deleteCommonWhiteChars(string))
    end)

    it('delete tabs', function()
        local string = 'step\ton no pets'
        assert.are.equals('steponnopets', strongstring.deleteCommonWhiteChars(string))
    end)

    it('delete form feed and other common white characters', function()
        local string = 'step\ton no\fpets\n\r'
        assert.are.equals('steponnopets', strongstring.deleteCommonWhiteChars(string))
    end)

    it('empty string results in empty string', function()
        local string = ''
        assert.are.equals('', strongstring.deleteCommonWhiteChars(string))
    end)

    it('returns nil when nil passed in', function()
        assert.are.equals(nil, strongstring.deleteCommonWhiteChars(nil))
    end)

    it('returns nil when number passed in', function()
        assert.are.equals(nil, strongstring.deleteCommonWhiteChars(8))
    end)

    it('returns nil when table passed in', function()
        assert.are.equals(nil, strongstring.deleteCommonWhiteChars({}))
    end)
end)