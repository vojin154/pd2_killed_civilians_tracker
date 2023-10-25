Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusCivsKilledTracker", function(menu_manager, nodes)
    CivKillsTracker:Load()

    local main_menu_id = "CIVS_KILLED_TRACKER_MAIN"

    MenuHelper:NewMenu(main_menu_id)

    MenuCallbackHandler.callback_civs_killed_tracker_y = function(self, item)
        CivKillsTracker.settings.y = item:value()
        if alive(CivKillsTracker.text) then
            CivKillsTracker.text:set_y(CivKillsTracker.settings.y * CivKillsTracker.hud.panel:height())
        end
        CivKillsTracker:Save()
    end

    MenuCallbackHandler.callback_civs_killed_tracker_x = function(self, item)
        CivKillsTracker.settings.x = item:value()
        if alive(CivKillsTracker.text) then
            CivKillsTracker.text:set_x(CivKillsTracker.settings.x * CivKillsTracker.hud.panel:width())
        end
        CivKillsTracker:Save()
    end

    MenuCallbackHandler.callback_civs_killed_tracker_font_size = function(self, item)
        CivKillsTracker.settings.font_size = item:value()
        if alive(CivKillsTracker.text) then
            CivKillsTracker.text:set_font_size(CivKillsTracker.settings.font_size)
        end
        CivKillsTracker:Save()
    end

    MenuCallbackHandler.callback_civs_killed_tracker_fonts = function(self, item)
        CivKillsTracker.settings.chosen_font = CivKillsTracker.fonts[item:value()]
        CivKillsTracker.settings.saved_font = item:value()
        if alive(CivKillsTracker.text) then
            CivKillsTracker.text:set_font(Idstring(CivKillsTracker.settings.chosen_font))
        end
        CivKillsTracker:Save()
    end

    MenuCallbackHandler.callback_civs_killed_tracker_reset = function(self, item)
        
        MenuHelper:ResetItemsToDefaultValue(item, {["CivKillsTracker.settings.chosen_font"] = true}, "fonts/font_small_mf")
        MenuHelper:ResetItemsToDefaultValue(item, {["civs_killed_tracker_font_size"] = true}, 20)
        MenuHelper:ResetItemsToDefaultValue(item, {["civs_killed_tracker_x"] = true}, 0)
        MenuHelper:ResetItemsToDefaultValue(item, {["civs_killed_tracker_y"] = true}, 0)
    
        CivKillsTracker:Save()
    
    end

    MenuHelper:AddMultipleChoice({
        id = "civs_killed_tracker_fonts",
        title = "civs_killed_tracker_fonts_title",
        desc = "civs_killed_tracker_fonts_desc",
        callback = "callback_civs_killed_tracker_fonts",
        items = CivKillsTracker.fonts,
        value = CivKillsTracker.settings.saved_font,
        menu_id = main_menu_id,
        priority = 8
    })

    MenuHelper:AddDivider({
        id = "civs_killed_tracker_fonts_divider",
        size = 16,
        menu_id = main_menu_id,
        priority = 7
    })
    
    MenuHelper:AddSlider({
        id = "civs_killed_tracker_font_size",
        title = "civs_killed_tracker_size_title",
        description = "civs_killed_tracker_size_desc",
        callback = "callback_civs_killed_tracker_font_size",
        value = CivKillsTracker.settings.font_size,
        min = 0,
        max = 100,
        step = 0.1,
        show_value = true,
        menu_id = main_menu_id,
        priority = 6
    })

    MenuHelper:AddDivider({
        id = "civs_killed_tracker_fonts_size_divider",
        size = 16,
        menu_id = main_menu_id,
        priority = 5
    })

    MenuHelper:AddSlider({
        id = "civs_killed_tracker_x",
        title = "X",
        callback = "callback_civs_killed_tracker_x",
        value = CivKillsTracker.settings.x,
        min = 0,
        max = 0.91,
        step = 0.01,
        show_value = true,
        menu_id = main_menu_id,
        priority = 4,
        localized = false
    })

    MenuHelper:AddDivider({
        id = "civs_killed_tracker_axis_divider",
        size = 0.5,
        menu_id = main_menu_id,
        priority = 3
    })

    MenuHelper:AddSlider({
        id = "civs_killed_tracker_y",
        title = "Y",
        callback = "callback_civs_killed_tracker_y",
        value = CivKillsTracker.settings.y,
        min = 0,
        max = 0.97,
        step = 0.01,
        show_value = true,
        menu_id = main_menu_id,
        priority = 2,
        localized = false
    })

    MenuHelper:AddDivider({
        id = "civs_killed_tracker_reset_divider",
        size = 16,
        menu_id = main_menu_id,
        priority = 1
    })

    MenuHelper:AddButton({
        id = "civs_killed_tracker_reset",
        title = "RESET",
        callback = "callback_civs_killed_tracker_reset",
        menu_id = main_menu_id,
        priority = 0,
        localized = false
    })

    nodes[main_menu_id] = MenuHelper:BuildMenu(main_menu_id, { area_bg = "none" })
    MenuHelper:AddMenuItem(nodes["blt_options"], main_menu_id, "civs_killed_tracker_menu", "civs_killed_tracker_menu_desc")

end)
