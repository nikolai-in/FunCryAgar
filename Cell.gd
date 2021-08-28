extends Area2D

var coin_value
var coin_type

func _ready():
	var random_float = randf()
	
	if random_float < 0.8:
		coin_type = 'DOGE'
	elif random_float < 0.95:
		coin_type = 'ETH'
	else:
		coin_type = 'BTC'
	coin_value = {'BTC': 1, 'DOGE': 0.001, "ETH": 0.1}[coin_type]
	scale *= coin_value + random_float * 2
	$AnimatedSprite.animation = coin_type


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Cell_body_entered(_body):
	hide()
	Global.score += coin_value
	$CollisionShape2D.set_deferred("disabled", true)

