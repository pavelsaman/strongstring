describe('left padding #lpad', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('left pad with a certain character', function()
        local string1 = '123'
        local pad_char = '0'
        local length = 5

        assert.are.equals('00123', strongstring.lpad(string1, pad_char, length))
    end)

    it('left pad with a certain string', function()
        local string1 = '123'
        local pad_char = '00'
        local length = 5

        assert.are.equals('00123', strongstring.lpad(string1, pad_char, length))
    end)

    it('pad string is longed than length', function()
        local string1 = '123'
        local pad_char = '0123456'
        local length = 5

        assert.are.equals('01123', strongstring.lpad(string1, pad_char, length))
    end)

    it('pad string is shorter than length', function()
        local string1 = '123'
        local pad_char = '#'
        local length = 5

        assert.are.equals('##123', strongstring.lpad(string1, pad_char, length))
    end)

    it('pad string is not string data type', function()
        local string1 = '123'
        local pad_char = 1
        local length = 5

        assert.are.equals(nil, strongstring.lpad(string1, pad_char, length))
    end)

    it('string is not string data type', function()
        local string1 = 2
        local pad_char = '@'
        local length = 5

        assert.are.equals(nil, strongstring.lpad(string1, pad_char, length))
    end)

    it('pad string is empty string', function()
        local string1 = 'abc'
        local pad_char = ''
        local length = 5

        assert.are.equals('  abc', strongstring.lpad(string1, pad_char, length))
    end)

    it('pad string is space', function()
        local string1 = 'abc'
        local pad_char = ' '
        local length = 10

        assert.are.equals('       abc', strongstring.lpad(string1, pad_char, length))
    end)

    it('pad string is tab', function()
        local string1 = 'abc'
        local pad_char = '\t'
        local length = 4

        assert.are.equals('\tabc', strongstring.lpad(string1, pad_char, length))
    end)

    it('pad string is U+0085', function()
        local string1 = 'abc'
        local pad_char = ''
        local length = 4

        assert.are.equals('abc', strongstring.lpad(string1, pad_char, length))
    end)

    it('length is zero', function()
        local string1 = 'abc'
        local pad_char = '#'
        local length = 0

        assert.are.equals('abc', strongstring.lpad(string1, pad_char, length))
    end)

    it('length is lower than string', function()
        local string1 = 'abc'
        local pad_char = '#'
        local length = 1

        assert.are.equals('abc', strongstring.lpad(string1, pad_char, length))
    end)

    it('length equals string length', function()
        local string1 = 'abc'
        local pad_char = '#'
        local length = 3

        assert.are.equals('abc', strongstring.lpad(string1, pad_char, length))
    end)

    it('length is not number', function()
        local string1 = 'abc'
        local pad_char = '#'
        local length = nil

        assert.are.equals(nil, strongstring.lpad(string1, pad_char, length))
    end)

    it('length is not number', function()
        local string1 = 'abc'
        local pad_char = '#'
        local length = nil

        assert.are.equals(nil, strongstring.lpad(string1, pad_char, length))
    end)

    it('pad_str is not given', function()
        local string1 = 'abc'
        local length = 5

        assert.are.equals('  abc', strongstring.lpad(string1, length))
    end)

    it('string is empty', function()
        local string1 = ''
        local pad_char = '00'
        local length = 5

        assert.are.equals('00000', strongstring.lpad(string1, pad_char, length))
    end)

    it('string is nil', function()
        local string1 = nil
        local pad_char = '00'
        local length = 5

        assert.are.equals(nil, strongstring.lpad(string1, pad_char, length))
    end)
end)

describe('right padding #rpad', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('right pad with a certain character', function()
        local string1 = '123'
        local pad_char = '*'
        local length = 5

        assert.are.equals('123**', strongstring.rpad(string1, pad_char, length))
    end)

    it('pad string is more than one character', function()
        local string1 = '123'
        local pad_char = '*!'
        local length = 5

        assert.are.equals('123*!', strongstring.rpad(string1, pad_char, length))
    end)

    it('pad string is longer than string', function()
        local string1 = '123'
        local pad_char = '*!abc'
        local length = 6

        assert.are.equals('123*!a', strongstring.rpad(string1, pad_char, length))
    end)

    it('pad string is empty', function()
        local string1 = '123'
        local pad_char = ''
        local length = 6

        assert.are.equals('123   ', strongstring.rpad(string1, pad_char, length))
    end)

    it('length equals string', function()
        local string1 = '123'
        local pad_char = '!'
        local length = 3

        assert.are.equals('123', strongstring.rpad(string1, pad_char, length))
    end)

    it('length is negative number', function()
        local string1 = '123'
        local pad_char = '!'
        local length = -7

        assert.are.equals('123', strongstring.rpad(string1, pad_char, length))
    end)

    it('utf8 characters in string', function()
        local string1 = '123'
        local pad_char = '!'
        local length = 5

        assert.are.equals('123!', strongstring.rpad(string1, pad_char, length))
    end)

    it('utf8 characters in pad string', function()
        local string1 = '123'
        local pad_char = ''
        local length = 5

        assert.are.equals('123', strongstring.rpad(string1, pad_char, length))
    end)
end)