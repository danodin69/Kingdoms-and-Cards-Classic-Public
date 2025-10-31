extends ColorRect


func _ready():
	$AnimationPlayer.play("splash")
func go_to_menu():
	get_tree().change_scene("res://main.tscn")

func go_to_login():
	get_tree().change_scene("res://scenes/login.tscn")
