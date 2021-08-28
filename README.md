# AgarEdu
Agar.io clone in Godot Engine for educational purposes

Файл настроек выглядит так:

```json
{
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
```
только в одну строчку

В Windows он находится в `%appdata%\Godot\app_userdata\AgarEdu\data.json` ~~или в `%APPDATA%\AgarEdu\data.json`~~, а в Linux и macOS `~/Library/Application Support/Godot/app_userdata/AgarEdu/data.json` ~~или в `~/.local/share/godot/app_userdata/AgarEdu/data.json`~~

```json
"coins": {
  "DOGE": 0.8,
  "ETH": 0.95
}
```
шансы выпадения монет


```json
"coin_value": {
  "DOGE": 0.001,
  "ETH": 0.1,
  "BTC": 0.5
}
```
их стоимость


```json
"options": {
  "kWt_min": 15,
  "kWt_max": 40,
  "score_min": 0.5,
  "score_max": 5,
  "coin_ammount": 200
}
```
различные опции
