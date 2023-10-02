-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Activate relative line numbers
vim.opt.relativenumber = true

-- 2 Spaces for each tab
vim.opt.tabstop = 2

-- Save current buffer 
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"

-- Switch between buffers
lvim.keys.normal_mode["<S-h>"] = ":bprevious<CR>"
lvim.keys.normal_mode["<S-l>"] = ":bnext<CR>"

-- Close buffer
lvim.keys.which_key.mappings["<b-d>"] = ":bd<CR>"
