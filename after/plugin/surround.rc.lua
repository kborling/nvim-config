local status, surround = pcall(require, "nvim-surround")
if (not status) then return end

surround.setup({
  keymaps = {
    normal = "sa",
    delete = "sd",
    change = "sr",
  },
})
