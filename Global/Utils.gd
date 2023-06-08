extends Node

#u should replace res with users
const SAVE_PATH="res://savegame.bin"

func saveGame():
	var file =FileAccess.open(SAVE_PATH,FileAccess.WRITE)
	var data:Dictionary = {
		"playerHP": Global.playerHP,
		"Gold": Global.Gold,
	}
	var jstr=JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
		var file =FileAccess.open(SAVE_PATH,FileAccess.READ)
		if FileAccess.file_exists(SAVE_PATH) == true:
			if not file.eof_reached():
				var current_line=JSON.parse_string(file.get_line())
				if current_line:
					Global.playerHP=current_line["playerHP"]
					Global.Gold=current_line["Gold"]
