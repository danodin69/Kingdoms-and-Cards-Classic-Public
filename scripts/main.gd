#scripts/main.gd

extends Control


var ui_accept_group = "ui_accept"
var ui_place_card = "place_card"
var ui_cancel_card = "cancel_card"


onready var arena = $arena
onready var audio_clip_click = $audio/click
onready var audio_clip_place_card = $audio/placed_card
onready var audio_clip_cancel_card = $audio/cancel
onready var menu = $main_menu
onready var how_to_play_screen = $main_menu/help/how_to_play
onready  var contact_screen = $main_menu/help/contact
onready var help_screen = $main_menu/help
onready var audio = $audio
var e = -1
var music = 1
var sound = 1

var sound_on_texture := "res://assets/graphics/ui/buttons/sound_abled.png"
var sound_off_texture := "res://assets/graphics/ui/buttons/sound_disabled.png"
var music_on_texture := "res://assets/graphics/ui/buttons/music_abled.png"
var music_off_texture := "res://assets/graphics/ui/buttons/music_disabled.png"

onready var sound_button:= $menu/side_menu/sound
onready var music_button:= $menu/side_menu/music
#select mode ==== ==== 
onready var main = $"."
onready var mode = $main_menu/mode
onready var help_mode_details = $main_menu/mode/help

func _ready():
	group_buttons()
	AudioServer.set_bus_layout(load("res://default_bus_layout.tres"))
	$main_menu/AnimationPlayer.play("learn_nudge")
func _on_next_pressed():
	toggle_help_screen()
		
func toggle_help_screen():
	e = e * -1
	print(e)
	if e == 1:
		contact_screen.show()
		how_to_play_screen.hide()	
	elif e == -1: 
		contact_screen.hide()
		how_to_play_screen.show()
		
		
func toggle_music():
	music = music * -1
	print(music)
	if music == -1:
		AudioServer.set_bus_mute(1,true)
	elif music == 1:
		AudioServer.set_bus_mute(1,false)
	_update_music_button_texture()
	
func toggle_sound():
	sound = sound * -1
	print(sound)
	if sound == -1:
		AudioServer.set_bus_mute(2,true)
		
		
	elif sound == 1:
		AudioServer.set_bus_mute(2,false)
		
	_update_sound_button_texture()
	
func _on_exit_helpscreen_pressed():
	help_screen.hide()


func _on_help_button_pressed():
	help_screen.show()


func _on_play_pressed():
	mode.show()
#	menu.hide()


func _on_main_menu_pressed():
	menu.show()


func _on_replay_pressed():
	menu.hide()
	

func add_ui_accept_buttons_to_group():
	var buttons = get_tree().get_nodes_in_group(ui_accept_group)

	var buttonIndex = 1 


	for button in buttons:
		button.connect("pressed", self, "_on_button_pressed")
		button.name = "Button_" + str(buttonIndex)

		buttonIndex += 1 

func _on_button_pressed():
		audio_clip_click.play()
		
func add_palce_card_buttons_to_group():
	var buttons = get_tree().get_nodes_in_group(ui_place_card)

	var buttonIndex = 1 

	for button in buttons:
		button.connect("pressed", self, "_on_place_card_pressed")
		button.name = "Button_" + str(buttonIndex)
		
		buttonIndex += 1 

func _on_place_card_pressed():
	audio_clip_place_card.play()
		
		

func add_cancel_card_buttons_to_group():
	var buttons = get_tree().get_nodes_in_group(ui_cancel_card)

	var buttonIndex = 1 


	for button in buttons:
		button.connect("pressed", self, "_on_cancel_card_pressed")
		button.name = "Button_" + str(buttonIndex)

		buttonIndex += 1 

func _on_cancel_card_pressed():
	audio_clip_cancel_card.play()

func group_buttons():
	add_ui_accept_buttons_to_group()
	add_palce_card_buttons_to_group()
	add_cancel_card_buttons_to_group()


func _on_music_pressed():
	toggle_music()


func _on_sound_pressed():
	toggle_sound()

func _update_sound_button_texture():
	var texture_path = sound_on_texture if sound == 1 else sound_off_texture
	var texture = load(texture_path)
	
	sound_button.texture_normal = texture


func _update_music_button_texture():
	var texture_path = music_on_texture if music == 1 else music_off_texture
	var texture = load(texture_path)
	
	music_button.texture_normal = texture
	
#SELECT MODE

func _on_help_mode_btn_pressed():
	help_mode_details.show()



func _on_exit_hep_pressed():
	help_mode_details.hide()

func _on_skill_pressed():
	shuffler.shuffle_and_distribute_cards()
	mode.hide()
	menu.hide()
	arena.get_node("player/luck").hide()
	main.get_node("menu/side_menu/skill").disabled = true
	


func _on_luck_pressed():
	shuffler.shuffle_and_distribute_cards()
	arena.luck_mode = true
	print(arena.luck_mode)
	arena.get_node("player/luck").show()
	main.get_node("menu/side_menu/luck").disabled = true
	mode.hide()
	menu.hide()
	


func _on_home_pressed():
	get_tree().reload_current_scene()

