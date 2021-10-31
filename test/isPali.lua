describe('stringstrong.isPali() #pali', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('return true if palindrome is found', function()
        local string = 'step on no pets'
        assert.are.equals(true, strongstring.isPali(string))
    end)

    it('return false if palindrome is found', function()
        local string = 'abc'
        assert.are.equals(false, strongstring.isPali(string))
    end)

    it('return true if utf-8 palindrome is found', function()
        local string = 'malý ýlam'
        assert.are.equals(true, strongstring.isPali(string))
    end)

    it('trim string before looking for palindrome', function()
        local string = '  step on no pets '
        assert.are.equals(true, strongstring.isPali(string))
    end)

    it('empty string is palindrome', function()
        local string = ''
        assert.are.equals(true, strongstring.isPali(string))
    end)

    it('returns nil when no string passed in', function()
        assert.are.equals(nil, strongstring.isPali())
    end)

    it('returns nil when number passed in', function()
        assert.are.equals(nil, strongstring.isPali(9))
    end)

    it('returns nil when table passed in', function()
        assert.are.equals(nil, strongstring.isPali({}))
    end)

    it('returns nil when nil is passed in', function()
        assert.are.equals(nil, strongstring.isPali(nil))
    end)

    it('return true if palindrome has different case', function()
        local string = 'Step on no pets'
        assert.are.equals(true, strongstring.isPali(string))
    end)

    it('do not count whitespace', function()
        local string = 'Step on   no  pets'
        assert.are.equals(true, strongstring.isPali(string))
    end)

    it('do not count whitespace', function()
        local string = 'Step on \tno \npets\r'
        assert.are.equals(true, strongstring.isPali(string))
    end)
end)
