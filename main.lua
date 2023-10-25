if not CivKillsTracker then

	_G.CivKillsTracker = _G.CivKillsTracker or {}
	CivKillsTracker._path = ModPath
	CivKillsTracker._data_path = SavePath .. "CivKillsTracker.txt"
	CivKillsTracker.settings = {
		x = 0,
		y = 0,
		chosen_font = "fonts/font_small_mf",
		font_size = 20
	}
	CivKillsTracker.fonts = {
		"fonts/font_small_mf",
		"fonts/font_eurostile_ext",
		"fonts/font_large",
		"fonts/font_medium",
		"fonts/font_medium_noshadow",
		"fonts/font_medium_shadow",
		"fonts/font_small",
		"fonts/font_small_noshadow",
		"fonts/font_small_shadow",
	}

	CivKillsTracker.values = {
		civs_killed = 0,
		civs_killed_new = 0
	}

    function CivKillsTracker:Load()
		local save_data
		if io.file_is_readable(self._data_path) then
		  save_data = io.load_as_json(self._data_path)
		end
		if save_data then
		  for k, v in pairs(save_data) do
		    self.settings[k] = v
		  end
		end
    end
    
    function CivKillsTracker:Save()
        local file = io.open(self._data_path, "w+")
        if file then
			file:write(json.encode(self.settings))
            file:close()
        end
    end

    Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_CivsKilledTracker", function(loc)
		loc:load_localization_file(CivKillsTracker._path .. "loc/english.json")
	end)
    
end

CivKillsTracker:Load()

local required = {}
if RequiredScript and not required [RequiredScript] then
	local fname = CivKillsTracker._path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	required [RequiredScript] = true
end