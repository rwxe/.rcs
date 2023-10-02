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

-- This is where you actually apply your config choices

config.color_scheme = 'Monokai Remastered' -- 主题
config.window_background_opacity = 0.85
config.enable_tab_bar = true
config.font_size=12.0 -- 字体大小
config.font = wezterm.font_with_fallback({ "Fira Code Retina", "Noto Sans CJK SC", }) -- 字体选择
config.use_ime = true



config.keys = {
    {
        -- F11 全屏
        key = 'F11',
        mods = '',
        action = act.ToggleFullScreen,
    },
    {
        -- 垂直分割屏幕，在下面生成新窗口
        key = '_', mods = 'ALT|SHIFT|WIN',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        -- 水平分割屏幕，在右边生成新窗口
        key = '+', mods = 'ALT|SHIFT|WIN',
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
    -- NOTE that binding only the 'Up' event can give unexpected behaviors.
    -- Read more below on the gotcha of binding an 'Up' event only.
}


return config

