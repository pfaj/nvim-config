local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
})

-- local set = function(nonNix, nix)
--     if vim.g.nix == true then
--         return nix
--     else
--         return nonNix
--     end
-- end
--
-- -- Bootstrap lazy.nvim
-- local load_lazy = set(function()
--   local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--   if not (vim.uv or vim.loop).fs_stat(lazypath) then
--     local lazyrepo = "https://github.com/folke/lazy.nvim.git"
--     local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
--     if vim.v.shell_error ~= 0 then
--       vim.api.nvim_echo({
--         { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
--         { out, "WarningMsg" },
--         { "\nPress any key to exit..." },
--       }, true, {})
--       vim.fn.getchar()
--       os.exit(1)
--     end
--   end
--   vim.opt.rtp:prepend(lazypath)
-- end, function()
--     -- Prepend the runtime path with the directory of lazy
--     -- This means we can call `require("lazy")`
--     vim.opt.rtp:prepend([[lazy.nvim-plugin-path]])
-- end)
--
-- -- Actually execute the loading function we set above
-- load_lazy()
--
-- -- Disable resetting the RTP, so that you actually see our new one
-- require("lazy").setup({
--   spec = {
--     { import = "plugins" },
--   },
--   checker = {
--     enabled = true, -- check for plugin updates periodically
--     notify = false, -- notify on update
--   }, -- automatically check for plugin updates
--   { performance = { rtp = { reset = set(true, false) } } }
-- })
--
