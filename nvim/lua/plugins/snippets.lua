return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  event = "InsertEnter",
  config = function()
    local ls = require("luasnip")
    local snippet = ls.snippet
    local text = ls.text_node
    local insert = ls.insert_node

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true, desc = "Expand or jump snippet" })

    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true, desc = "Jump backward snippet" })

    ls.add_snippets("markdown", {
      snippet("code", {
        text({ "```" }),
        insert(1, "language"),
        text({ "", "" }),
        insert(2, "content"),
        text({ "", "```" }),
      }),
      snippet("link", {
        text("["),
        insert(1, "text"),
        text("]("),
        insert(2, "url"),
        text(")"),
      }),
      snippet("task", {
        text("- [ ] "),
        insert(1, "todo"),
      }),
    })
  end,
}
