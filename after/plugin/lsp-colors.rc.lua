local status, colors = pcall(require, "lsp-colors")
if (not status) then return end

colors.setup {
  Error = "#ff0038",
  Warning = "#ff7700",
  Information = "#47eae0",
  Hint = "#00ff77"
}
