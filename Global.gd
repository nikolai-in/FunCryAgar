extends Node

var path = "user://data.json"

var default_data = {
	"coins": {
		"DOGE": 0.8,
		"ETH": 0.95
	},

	"coin_value": {
		"DOGE": 0.001,
		"ETH": 0.1,
		"BTC": 0.5
	},

	"options": {
		"kWt_min": 15,
		"kWt_max": 40,
		"score_min": 0.5,
		"score_max": 5,
		"coin_ammount": 200
	}
}

var data = { }

var score = 0
var time = 15

func reset_data():
	data = default_data.duplicate(true)

func load_game():
	var file = File.new()
	
	if not file.file_exists(path):
		reset_data()
		return
	
	file.open(path, file.READ)
	
	var text = file.get_as_text()
	
	data = parse_json(text)
	
	
	file.close()

func _ready():
	randomize()
	load_game()
