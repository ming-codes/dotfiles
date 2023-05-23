# TODO

I'm out of keys in normal mode to map :/

- [ ] y% and y%% yanks
- [ ] `K` is mapped for both
      `vim.lsp.buf.hover()` and
      `vim.diagnostic.open_float()`

- [ ] debugger for mason is not working yet
- [ ] format on save
- [ ] neotest?

- [ ] need that table util :|

## How to organize plugins?

- By keys? keys are grouped
- Should move mappings, which is a table for wk

```lua mappings.lua

```

```lua options.lua
return {
  g = {
  },
  o = {
  },
  [ "kevinhwang91/nvim-ufo" ] = {
  }
}
```

## Keymapping

- <C-t> Open in new tab
- <C-v> Open in v split
