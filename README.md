# cheader.nvim
generate generic c headers with ifndef guards and implementation block

## Installation
```lua
--Plug
local Plug = vim.fn["plug#"]
Plug('bobon4uto/cheader.nvim')
require('cheader')
```
## Usage
Invoke `:Cheader` inside `.h` file and it will generate something like this:
```c
//  #define README_IMPLEMENTATION
#ifndef    _README_H_
#define    _README_H_
// readme interface



#ifdef      README_IMPLEMENTATION
// readme implementation



#endif   // README_IMPLEMENTATION
#endif   //_README_H_

```
note that I ran `:Cheader` in `README.md` to show how it works.
You can also override name used by passing it. E.G. running `:Cheader special$cryptic.lib-name#1`
```c
//  #define SPECIAL_CRYPTIC_LIB_NAME_1_IMPLEMENTATION
#ifndef    _SPECIAL_CRYPTIC_LIB_NAME_1_H_
#define    _SPECIAL_CRYPTIC_LIB_NAME_1_H_
// special_cryptic_lib_name_1 interface



#ifdef      SPECIAL_CRYPTIC_LIB_NAME_1_IMPLEMENTATION
// special_cryptic_lib_name_1 implementation



#endif   // SPECIAL_CRYPTIC_LIB_NAME_1_IMPLEMENTATION
#endif   //_SPECIAL_CRYPTIC_LIB_NAME_1_H_

```
note that it sanitizes the name so that any non-alphanumeric character is `_`.



