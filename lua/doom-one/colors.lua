-- vim:fdm=marker
-- Neovim Color File
-- Name:            doom-one
-- Maintainer:      https://github.com/NTBBloodbath
-- License:         The MIT License (MIT)
-- Based On:        https://github.com/romgrk/doom-one.vim and the original Doom Emacs one

local colors = {
  dark = {
    -- bg = "#282c34", -- default editor background (also found in OneDark Palette)
    -- bg = "#24272E",  -- editor background - (same palette just 1 shade darker than #282c34)
    -- bg = "#171d23",  -- editor background - darker (MyCustom_DoomOne_TokyoNight_Night)
    bg = "#141a1f",  -- editor background - preferred - 1 shade darker than #171d23
    -- bg = "#12171c",  -- editor background - 2 shade darker than #171d23
    -- bg = "#101418",  -- editor background - 3 shade darker than #171d23
    fg = "#bbc2cf",

    -- bg_alt = "#23272e", -- previous
    -- bg_alt = "#2f334d", -- tokyonight-moon
    bg_alt = "#292e42", -- tokyonight-night (tokyonight default)
    -- bg_alt = "#21242b", -- default cursorline
    -- bg_alt = "#1D2026", -- cursorline
    fg_alt = "#5b6268",

		base0 = "#1b2229",
		base1 = "#1c1e1e",
		-- base1 = "#171d23", -- editor background - darker (MyCustom_DoomOne_TokyoNight_Night)
		base2 = "#202328",
		base3 = "#23272e",
		base4 = "#3f444a",
		base5 = "#5b6268",
		base6 = "#73797e",
		base7 = "#9ca0a4",
		base8 = "#dfdfdf",

		grey = "#3f444a",
		red = "#ff6c6b",
		orange = "#da8548",
		green = "#98be65",
		teal = "#4db5bd",
		yellow = "#ecbe7b",
		blue = "#51afef",
		dark_blue = "#2257a0",
		magenta = "#c678dd", -- "violet" used as "magenta" in alacritty.toml
		violet = "#a9a1e1", -- "magenta" in alacritty.toml
		cyan = "#46d9ff",
		dark_cyan = "#5699af",
  },
	light = {
		bg = "#fafafa",
		fg = "#383a42",

		bg_alt = "#f0f0f0",
		fg_alt = "#c6c7c7",

		base0 = "#f0f0f0",
		base1 = "#e7e7e7",
		base2 = "#dfdfdf",
		base3 = "#c6c7c7",
		base4 = "#9ca0a4",
		base5 = "#424242",
		base6 = "#2e2e2e",
		base7 = "#1e1e1e",
		base8 = "#1b2229",

		grey = "#9ca0a4",
		red = "#e45649",
		orange = "#da8548",
		green = "#50a14f",
		teal = "#4db5bd",
		yellow = "#986801",
		blue = "#4078f2",
		dark_blue = "#a0bcf8",
		magenta = "#a626a4",
		violet = "#b751b6",
		cyan = "#0184bc",
		dark_cyan = "#005478",
	},
}

colors.get_palette = function(current_bg)
	return colors[current_bg]
end

return colors
