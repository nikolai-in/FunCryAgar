extends Area2D

var coin_value
var coin_type


func _ready():
	hide()
	var random_float = randf()
	
	if random_float < Global.data['coins']["DOGE"]:
		coin_type = 'DOGE'
	elif random_float < Global.data['coins']["ETH"]:
		coin_type = 'ETH'
	else:
		coin_type = 'BTC'
	coin_value = Global.data["coin_value"][coin_type]
	
	var size = coin_value + random_float * 2
	if size < 0.25:
		size = 0.25
	scale *= size
	$AnimatedSprite.animation = coin_type
