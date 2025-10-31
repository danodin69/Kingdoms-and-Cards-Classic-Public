#scripts/Profile.gd
extends Control

onready var account_display = $PopUp/AccountDisplay
onready var account_name = $MiniPanel/AccountName
onready var mini_panel_gameplay = $MiniPanel 
onready var background = $ColourRect
onready var logout = $MiniPanelLogout/Logout 
onready var logout_mini_panel = $MiniPanelLogout
onready var logout_colour_rect = $LogingOut
onready var animation_player = $AnimationPlayer
onready var hederalogo = $HederaLogo

func _ready():
	mini_panel_gameplay.connect("gui_input", self, "_on_mini_panel_gui_input")
	if HederaAuth.load_session():
		_set_account_name()

	
	
func _set_account_name():
	account_name.text = str(HederaAuth.get_display_name())
	
	
func _show_Profile_state():
	$PopUp.show()
	background.show()
	hederalogo.show()
	var balance = HederaAuth.get_balance()
	
	account_display.text = "You are playing as %s\n\nAccount ID: %s\n\nBalance: %.2f HBAR" % [
		HederaAuth.get_display_name(),
		HederaAuth.get_account_id(),
		balance
	]

func _on_mini_panel_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		_show_Profile_state()


func _hide_Profile_state():
	$PopUp.hide()
	background.hide()
	hederalogo.hide()
	logout_mini_panel.hide()
	
func _log_out():
	if HederaAuth.load_session():
		animation_player.play("fade_to_login")
		yield(get_tree().create_timer(3), "timeout")
		HederaAuth._clear_session()
		get_tree().change_scene("res://scenes/login.tscn")


func _on_Logout_pressed():
	_log_out()


func _on_Proceed_pressed():
	_hide_Profile_state()


func _on_hedera_button_pressed():
	_show_Profile_state()
	logout_mini_panel.show()
