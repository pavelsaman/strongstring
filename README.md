# strongstring

`strongstring` defines functions for string manipulation.

![unit checks](https://github.com/pavelsaman/strongstring/actions/workflows/test.yml/badge.svg?branch=master)

# Basic usage

```lua
local strongstring = require('strongstring')
local words = strongstring.split('long.string.to.split', '.') -- {'long', 'string', 'to', 'split'}

local sentence = strongstring.concat(table.unpack(words)) -- longstringtosplit

local orig_sentence = strongstring.septableconcat(words, ' ') -- long string to split
```

# Public API

The following methods are available for use:

## `split(string, sep)`

Takes a string and a one chracter long separator. Returns a table. `sep` is a mandatory argument.

## `concat(...)`

Concatenates any number of string arguments into one string.

## `sepconcat(...)`

Like `concat(...)` but the last argument is a separator. Separator is inserted between other string arguments.

An example on three strings:

```lua
local concat_str = strongstring.sepconcat('a', 'b', 'c', '.') -- a.b.c
```

## `tableconcat(table)`

Like `concat()` but takes a table as an argument.

## `septableconcat(table, sep)`

Like `sepconcat()` but takes a table and separator as arguments.

## `fupper(string)`

Makes the first character upper case.

## `flower(string)`

Makes the first character lower case.

## `ltrim(string)`

Trims all whitespace (including unicode) on the right side of the string.

## `rtrim(string)`

Trims all whitespace (including unicode) on the left side of the string.

## `trim(string)`

Performs `ltrim()` and `rtrim()` on the string and returns the result.

## `lpad(string, [pad_string,] length)`

Adds `pad_string` to the left of `string` so that the total length is equal to `length`.

`pad_string` is optional, it defaults to ` ` (SPACE).

```lua
print(strongstring.lpad('abc', '*', 5)) -- **abc
print(strongstring.lpad('abc', 5)) -- "  abc" (two spaces and "abc")
print(strongstring.lpad('abc', '*!@', 5)) -- *!abc
print(strongstring.lpad('abc', '*!@', 7)) -- *!@*abc
```

## `rpad(string, [pad_string,] length)`

Adds `pad_string` to the right of `string` so that the total length is equal to `length`.

`pad_string` is optional, it defaults to ` ` (SPACE).

```lua
print(strongstring.rpad('abc', '*', 6)) -- abc***
```

## `escapeMagic(string)`

Returns a string with escaped magic characters.

```lua
print(strongstring.escapeMagic('[]')) -- %[%]
```

## `startsWith(string, start_string)`

Returns `true` is `string` starts with `start_string`, returns `false` otherwise. Returns `nil` if `start_string` is not passed in or one of the arguments is nil or of a different data type than string.

## `endsWith(string, end_string)`

Returns `true` is `string` ends with `start_string`, returns `false` otherwise. Returns `nil` if `start_string` is not passed in or one of the arguments is nil or of a different data type than string.

## `contains(string, search_string)`

Returns `true` is `string` contains `search_string`, returns `false` otherwise. Returns `nil` if `start_string` is not passed in or one of the arguments is nil or of a different data type than string.

## `deleteCommonWhiteChars(string)`

Deletes ` ` (space), `\r`, `\n`, `\f`, `\t` from a string, that is it substitutes these characters with an empty string.

## `isPali(string)`

Returns `true` is the string is a palindrome.

It first converts the whole string to lowercase and deletes common white spaces (see `deleteCommonWhiteChars()` function). It won't, however, find ASCII equivalents for UTF-8 chracters, e.g. `y` and `ý` are considered to be different characters even though a human might consider them the same for the sake of a palindrome. An empty string is a palindrome.

# Automated checks

Run all of them with busted:

```
$ cd strongstring
$ busted test/*
```

All automated checks run in a CI pipeline here in GitHub Actions. See the status on the top of this README.md file.

# Future plans

I will likely extend the public API as I encounter more situations where some string method would be useful.

# License

`strongstring` is licensed under the MIT license. See LICENSE.md for details on the MIT license.
