-- classify all below filetype extensions as "cheatfiles"
vim.filetype.add({
  extension = {
    cheat = "cheat",
    cht = "cheat",
    chtf = "cheat",
  },
})
