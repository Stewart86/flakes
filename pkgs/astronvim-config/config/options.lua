return {
  opt = {
    relativenumber = true,
    number = true,
    spell = false,
    signcolumn = "auto",
    wrap = true,
    showbreak = "↪ ",
    foldcolumn = "1",
    background = "dark",
    swapfile = false,
  },
  g = {
    mapleader = " ",
    autoformat_enabled = true,
    cmp_enabled = true,
    autopairs_enabled = true,
    diagnostics_enabled = true,
    status_diagnostics_enabled = true,
    icons_enabled = true,
    ui_notifications_enabled = true,
    heirline_bufferline = true,
    loaded_ruby_provider = 0,
    loaded_perl_provider = 0,
    clipboard = {
      copy = {
        ["+"] = "wl-copy",
        ["*"] = "wl-copy",
      },
      paste = {
        ["+"] = "wl-paste --no-newline",
        ["*"] = "wl-paste --no-newline",
      },
    },
    -- gitblame settings for less distraction
    gitblame_delay = 5000,
    gitblame_message_when_not_committed = "...",
    gitblame_date_format = "%r",
    gitblame_message_template = "          : <author> 🕒 <date> 📝 <summary>",
    diagnostic_enable_virtual_text = false,
  },
}
