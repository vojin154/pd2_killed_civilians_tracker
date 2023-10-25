
function CivKillsTracker:init()

	if managers.hud ~= nil then 
		self.hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2)
		self.text = self.hud.panel:text({
			vertical = "top",
			align = "left",
			blend_mode = "normal",
			y = self.settings.y * self.hud.panel:height(),
			layer = 0,
			text = "Civilians Killed: " .. tostring(self.values.civs_killed),
			font = self.settings.chosen_font,
			font_size = self.settings.font_size,
			x = self.settings.x * self.hud.panel:width(),
			color = Color.white
		})
	end

end

function CivKillsTracker:update()

	if self.values.civs_killed_new >= self.values.civs_killed then
		self.text:set_text("Civilians killed: " .. tostring(self.values.civs_killed))
		self.values.civs_killed = self.values.civs_killed_new
	end

end

Hooks:PostHook(HUDManager, "_player_hud_layout", "CivKillsTracker", function(self)
	CivKillsTracker:init()
end)

Hooks:PostHook(HUDManager, "update", "CivKillsTrackerUpdater", function(self)
	CivKillsTracker:update()
end)