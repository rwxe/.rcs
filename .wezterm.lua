-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font_size=12.0 -- 字体大小
config.font = wezterm.font_with_fallback({ 
    "Fira Code", 
--    "Victor Mono",
--    "Triplicate A Code",
    "Noto Sans CJK SC", 
}) -- 字体选择
config.use_ime = true -- 启用输入法


-- 按键绑定
config.keys = {
    {
        -- F11 全屏
        key = 'F11',
        mods = '',
        action = act.ToggleFullScreen,
    },
    {
        -- 垂直分割屏幕，在下面生成新窗口
        key = '-', mods = 'CTRL|ALT|WIN',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        -- 水平分割屏幕，在右边生成新窗口
        key = '=', mods = 'CTRL|ALT|WIN',
        action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
    },
    {
        -- 移动到左边窗口 
        key = 'LeftArrow', mods = 'CTRL|WIN',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        -- 移动到左边窗口 
        key = 'h', mods = 'CTRL|WIN',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        -- 移动到右边窗口 
        key = 'RightArrow', mods = 'CTRL|WIN',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        -- 移动到右边窗口 
        key = 'l', mods = 'CTRL|WIN',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        -- 移动到上边窗口 
        key = 'UpArrow', mods = 'CTRL|WIN',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        -- 移动到上边窗口 
        key = 'k', mods = 'CTRL|WIN',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        -- 移动到下边窗口 
        key = 'DownArrow', mods = 'CTRL|WIN',
        action = act.ActivatePaneDirection 'Down',
    },
    {
        -- 移动到下边窗口 
        key = 'j', mods = 'CTRL|WIN',
        action = act.ActivatePaneDirection 'Down',
    },
    {
        -- 往左调整窗口大小
        key = 'LeftArrow', mods = 'CTRL|SHIFT|WIN',
        action = act.AdjustPaneSize {"Left", 1},
    },
    {
        -- 往右调整窗口大小
        key = 'RightArrow', mods = 'CTRL|SHIFT|WIN',
        action = act.AdjustPaneSize {"Right", 1},
    },
    {
        -- 往上调整窗口大小
        key = 'UpArrow', mods = 'CTRL|SHIFT|WIN',
        action = act.AdjustPaneSize {"Up", 1},
    },
    {
        -- 往下调整窗口大小
        key = 'DownArrow', mods = 'CTRL|SHIFT|WIN',
        action = act.AdjustPaneSize {"Down", 1},
    },
    {
        -- 全屏当前窗口，覆盖其他分裂窗口
        key = 'z', mods = 'CTRL|WIN',
        action = wezterm.action.TogglePaneZoomState,
    },
}
for i = 1, 8 do -- ALT+数字 切换Tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'ALT',
        action = act.ActivateTab(i - 1),
    })
end

-- 鼠标绑定
config.mouse_bindings = {
    {
        -- 更改默认点击行为，使其仅选择文本并且不要打开超链接
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'NONE',
        action = act.CompleteSelection 'ClipboardAndPrimarySelection',
    },

    {
        -- CTRL+鼠标左键 打开超链接
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor,
    },
}

-- 色彩设定
config.color_scheme = 'iTerm2 Default' -- 主题
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 600 -- 光标闪烁间隔ms
config.cursor_blink_ease_in = 'Constant' -- 光标闪烁无缓动 Constant, Linear
config.cursor_blink_ease_out = 'Constant'
config.window_background_opacity = 0.85 -- 透明度
config.enable_tab_bar = true -- 启用Tab栏
-- config.use_fancy_tab_bar = false -- 复古Tab栏
config.enable_scroll_bar = true -- 启用滚动条
config.inactive_pane_hsb = {  -- 非活动窗口亮度和对比度
    saturation = 0.8, 
    brightness = 0.7, } 
config.window_padding = { -- 边框距离
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.window_frame = {
    font = wezterm.font { family = 'Triplicate A Code', weight = 'Bold' },
    --font = wezterm.font { family = 'Valkyrie A Caps', weight = 'Bold', },
    font_size = 12.0,
}
config.colors = {
    tab_bar = {
        active_tab = {
            --bg_color = '#2e5c6e',
            --fg_color = 'White',
            bg_color = 'Black',
            fg_color = '#81d8d0',
        },
        inactive_tab = {
            bg_color = '#333333',
            fg_color = 'Silver',
        },

    },
    foreground = 'white', -- 默认前景色
    background = 'black', -- 默认背景色
    cursor_bg = '#10B9C4', -- 光标背景色
    cursor_fg = 'black', -- 光标文字前景色
    cursor_border = '#f37021', -- 非活动窗口的光标边框颜色
    selection_fg = 'black', -- 选择文字前景色
    selection_bg = '#fffacd', -- 选择文字背景色
    scrollbar_thumb = '#222222', -- 滚动栏色
    split = '#81d8d0', -- 分割线色
    compose_cursor = 'orange', -- 输入法启用时的光标颜色
    -- Colors for copy_mode and quick_select
    -- available since: 20220807-113146-c2fee766
    -- In copy_mode, the color of the active text is:
    -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
    -- 2. selection_* otherwise
    copy_mode_active_highlight_bg = { Color = '#000000' },
    -- use `AnsiColor` to specify one of the ansi color palette values
    -- (index 0-15) using one of the names "Black", "Maroon", "Green",
    --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
    -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
    copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
    copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
    copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

    quick_select_label_bg = { Color = 'peru' },
    quick_select_label_fg = { Color = '#ffffff' },
    quick_select_match_bg = { AnsiColor = 'Navy' },
    quick_select_match_fg = { Color = '#ffffff' },
}

return config

