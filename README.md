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
