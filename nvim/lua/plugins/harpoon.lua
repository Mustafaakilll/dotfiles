return {
  {
    "ThePrimeagen/harpoon",
    config = function()
      local nmap = vim.keymap.set

      local harpoon = require "harpoon"

      harpoon.setup {}

      nmap('n', "<leader>bm", require("harpoon.mark").add_file)
      nmap('n', "<leader>bbm", require("harpoon.ui").toggle_quick_menu)

      for i = 1, 9 do
        nmap('n',
          string.format("<leader>%s", i),
          function()
            require("harpoon.ui").nav_file(i)
          end
        )
      end
    end
  }
}
