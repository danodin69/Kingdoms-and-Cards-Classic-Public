# scripts/login.gd
extends Control

onready var account_input = $AccountInput
onready var connect_btn = $ConnectButton
onready var status_label = $StatusLabel
onready var account_display = $PopUp/AccountDisplay

func _ready():

	connect_btn.connect("pressed", self, "_on_connect_pressed")
	HederaAuth.connect("verification_started", self, "_on_verification_started")
	HederaAuth.connect("wallet_connected", self, "_on_wallet_connected")
	HederaAuth.connect("connection_failed", self, "_on_connection_failed")
	
	status_label.text = "Enter your Hedera testnet Account ID to Play\nIf you do not have one, go to portal.hedera.com"
	account_display.text = ""
	account_input.placeholder_text = "0.0.123456"
	
	if HederaAuth.load_session():
		_show_connected_state()
		# Auto-transition after 1 second
#		yield(get_tree().create_timer(1.0), "timeout")
#		_transition_to_menu()

func _on_connect_pressed():
	var account_id = account_input.text.strip_edges()
	
	# Basic client-side validation
	if account_id.empty():
		status_label.text = "Please enter an account ID"
		status_label.modulate = Color.orange
		return
	
	if not account_id.begins_with("0.0."):
		status_label.text = "Format must be: 0.0.XXXXX"
		status_label.modulate = Color.orange
		return
	

	HederaAuth.verify_and_connect(account_id)

func _on_verification_started():
	connect_btn.disabled = true
	status_label.text = "⏳Checking account on Hedera testnet..."
	status_label.modulate = Color.yellow
	account_input.editable = false

func _on_wallet_connected(account_id: String):
	_show_connected_state()

func _on_connection_failed(error: String):
	status_label.text = "❌ " + error
	status_label.modulate = Color.red
	connect_btn.disabled = false
#	connect_btn.text = "Connect"
	account_input.editable = true

func _show_connected_state():
	$PopUp.show()
	var balance = HederaAuth.get_balance()
	
	status_label.text = "✅Connected To Hedera Testnet!"
	status_label.modulate = Color.green
	
	account_display.text = "Welcome Your Highness, %s\n\nAccount ID: %s\n\nBalance: %.2f HBAR" % [
		HederaAuth.get_display_name(),
		HederaAuth.get_account_id(),
		balance
	]
	
#	connect_btn.text = "Connected ✓"
	connect_btn.disabled = true
	account_input.editable = false

func _transition_to_menu():
	get_tree().change_scene("res://main.tscn")


func _on_Procceed_pressed():
	$PopUp/AnimationPlayer.play("proceed_to_menu")
	yield(get_tree().create_timer(1.5), "timeout")
	_transition_to_menu()
