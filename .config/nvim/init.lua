local core_modules = {
	"user.impatient",
	"user.plugins",
  "user.colorschemes.catppuccin",
	"user.lualine-themes.lualine1",
	"user.startup-screens.startup-screen3",
	"user.barbeque.barbeque1",
	"user.options",
	"user.keymaps",
	"user.cmp",
	"user.lsp",
	"user.telescope",
	"user.treesitter",
	"user.autopairs",
	"user.comment",
	"user.gitsigns",
	"user.nvim-tree",
	"user.navic",
	"user.cybu",
	"user.whichkey",
	"user.toggleterm",
	"user.project",
	"user.indentline",
	"user.autocommands",
	"user.colorizer",
	"user.illuminate",
	"user.notify",
	"user.jaq",
	"user.better-escape",
	"user.hop"
}

-- Using pcall we can handle better any loading issues
for _, module in ipairs(core_modules) do
	local ok, _ = pcall(require, module)
	if not ok then
		print("config missing!!, or not loaded, see all config files are available and if they are restart neovim")
		return
	end
end


--https://github.com/neovide/neovide/issues/124GPL3:wq
if vim.g.neovide == true then
    --vim.cmd 'set guifont=Hack\ NF:h10'
    vim.o.guifont='Hack Nerd Font Mono:h10'
    --vim.o.guifont='PowerlineSymbols:h10'
    --vim.o.guifont='Hack:h10'
    vim.g.neovide_scale_factor = 1.0 --позволяет изменить масштаб без изменения полное определение шрифта
    vim.g.syntaxneovide_floating_blur_amount_x = 2.0 --Плавающая степень размытия 
    vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_transparency = 0.5 --Прозрачность 
    vim.g.neovide_scroll_animation_length = 0.3 --Продолжительность анимации прокрутки 
    vim.g.neovide_hide_mouse_when_typing = 'v:false' --Скрытие мыши при наборе текста :wq
    vim.g.neovide_underline_automatic_scaling = 'v:false' -- Подчеркнуть автоматическое масштабирование 
    vim.g.neovide_refresh_rate = 60 --Частота обновления 
    vim.g.neovide_refresh_rate_idle = 0.15 -- Частота обновления в режиме ожидания 
    vim.g.neovide_no_idle = 'v:true' --Это может быть быстрым взломом, если анимация останавливается слишком рано
    vim.g.neovide_confirm_quit = 'v:true' --Подтвердить Выход 
    vim.g.neovide_fullscreen = 'v:true' --Полноэкранный 
    vim.g.neovide_remember_window_size = 'v:true' --Запомнить предыдущий размер окна 
    vim.g.neovide_profiler = 'v:true' --показывает график времени кадра в левом верхнем углу угол
    vim.g.neovide_input_use_logo = 'v:false'  --v:true on macOS
	  --Настройки курсора 
    vim.g.neovide_cursor_animation_length = 0.1 --Длина анимации 
    vim.g.neovide_cursor_trail_size = 0.5 --Размер анимационного следа
    vim.g.neovide_cursor_antialiasing = 'v:true' --Сглаживание 
    --vim.g.neovide_cursor_unfocused_outline_width = 0.125 --Несфокусированная ширина контура 
    vim.g.neovide_cursor_vfx_mode = 'railgun'
    vim.g.neovide_cursor_vfx_opacity = 200.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    vim.g.neovide_cursor_vfx_particle_density = 7.0
    vim.g.neovide_cursor_vfx_particle_speed = 10.0
    vim.g.neovide_cursor_vfx_particle_phase = 1.5
    vim.g.neovide_cursor_vfx_particle_curl = 1.0
	  vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
