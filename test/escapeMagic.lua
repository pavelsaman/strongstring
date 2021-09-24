describe('stringstrong.escapeMagic() #escapeMagic #escape', function()
    local strongstring

    lazy_setup(function()
        strongstring = require('src/strongstring')
    end)

    it('escape one magic character in string', function()
        local string_to_escape = 'ciao('
        local expected_result_string = 'ciao%('
        assert.are.equals(expected_result_string, strongstring.escapeMagic(string_to_escape))
    end)

    it('escape multiple magic characters in string', function()
        local string_to_escape = 'ci][ao('
        local expected_result_string = 'ci%]%[ao%('
        assert.are.equals(expected_result_string, strongstring.escapeMagic(string_to_escape))
    end)

    it('escape escape characted', function()
        local string_to_escape = '%'
        local expected_result_string = '%%'
        assert.are.equals(expected_result_string, strongstring.escapeMagic(string_to_escape))
    end)

    it('string is nil', function()
        local string_to_escape = nil
        assert.are.equals(nil, strongstring.escapeMagic(string_to_escape))
    end)

    it('string param is not string data type', function()
        local string_to_escape = 5
        assert.are.equals(nil, strongstring.escapeMagic(string_to_escape))
    end)

    it('string is empty', function()
        local string_to_escape = ''
        local expected_result_string = ''
        assert.are.equals(expected_result_string, strongstring.escapeMagic(string_to_escape))
    end)

    it('escape every magic character', function()
        local magic_characters = {'(', ')', '[', ']', '^', '$', '.', '+', '-', '*', '%', '?'}
        for i = 1, #magic_characters, 1 do
            assert.are.equals('%' .. magic_characters[i], strongstring.escapeMagic(magic_characters[i]))
        end
    end)
end)