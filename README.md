# Binary-Swap: swap operands in binary expressions

Small plugin for neovim 0.8+ powered on [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for swapping operands and operators in binary expressions: `123 > 0` to `0 < 123` and `1 + 2` to `2 + 1`
- Comparison operations;
- Mathematical operations;

https://user-images.githubusercontent.com/46977173/201508787-1b9604a1-1d0a-4feb-86d2-8b5417f4f679.mov

# Installation

With [packer.nvim]():

```lua
use({
  'Wansmer/binary-swap.nvim',
  setup = function ()
    vim.keymap.set('n', 'YOUR PREFER KEYS', function ()
      require('binary-swap').swap_operands()
    end)
    vim.keymap.set('n', 'YOUR PREFER KEYS', function ()
      require('binary-swap').swap_operands_with_operator()
    end)
  end
})
```

Binary-wap doesn't set up keymaps by default and no required additional settings.

There are two methods available outside:

1. `require('binary-swap').swap_operands()` – swap only operands
(e.g., `MAX_VALUE >= getCurrentValue()` will transform to `getCurrentValue() >= MAX_VALUE`, here **operator** `>=` is not changed);

2. `require('binary-swap').swap_operands_with_operator()` – swap operands and operator to opposite if possible. (e.g., `MAX_VALUE >= getCurrentValue()` transforms to `getCurrentValue() <= MAX_VALUE`)

## Note

I considered a few different languages and at each of them node with binary expression node has type `binary_expression`. Plugin searches this type by default because have no reason to add additional options to set up. If in your favorite language, this type is different, feel free to open an issue.
