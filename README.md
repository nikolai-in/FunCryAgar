# AgarEdu

Agar.io clone in Godot Engine for educational purposes

![godot-ci export](https://github.com/nikolai-in/FunCryAgar/actions/workflows/godot-ci.yml/badge.svg)

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
  "coin_ammount": 500,
  "game_scale": 3,
  "speed": 1.0,
  "music": true
 }
}
```

только в одну строчку

В Windows он находится в `%appdata%\Godot\app_userdata\AgarEdu\data.json` или в `%APPDATA%\AgarEdu\data.json`

 В Linux в `~/.local/share/godot/app_userdata/AgarEdu/data.json`

 А в  macOS `~/Library/Application Support/Godot/app_userdata/AgarEdu/data.json`

* Шанс выпадения монет:

```json
"coins": {
  "DOGE": 0.8,
  "ETH": 0.95
}
```

* Стоимость монет:

```json
"coin_value": {
  "DOGE": 0.001,
  "ETH": 0.1,
  "BTC": 0.5
}
```

* Разные опции:

```json
 "options": {
  "kWt_min": 15,
  "kWt_max": 40,
  "score_min": 0.5,
  "score_max": 5,
  "coin_ammount": 500,
  "game_scale": 3,
  "speed": 1.0,
  "music": true
 }
```
