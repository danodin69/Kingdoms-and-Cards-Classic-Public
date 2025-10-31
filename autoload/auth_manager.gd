# autoload/auth_manager.gd
extends Node

var current_user := {
	"account_id": "",
	"display_name": "",
	"is_connected": false,
	"balance": 0  
}

signal wallet_connected(account_id)
signal wallet_disconnected()
signal connection_failed(error)
signal verification_started()

const MIRROR_NODE_URL = "https://testnet.mirrornode.hedera.com/api/v1/accounts/"

func _ready():
	print("Hedera Auth (TESTNET) Ready")

func verify_and_connect(account_id: String):
	if account_id.empty():
		emit_signal("connection_failed", "Account ID cannot be empty")
		return
	
	if not _is_valid_account_format(account_id):
		emit_signal("connection_failed", "Invalid format. Use: 0.0.12345")
		return
	
	emit_signal("verification_started")
	print("Verifying account: ", account_id)
	
	var http = HTTPRequest.new()
	add_child(http)
	http.connect("request_completed", self, "_on_verification_complete", [account_id, http])
	
	var url = MIRROR_NODE_URL + account_id
	var error = http.request(url)
	
	if error != OK:
		emit_signal("connection_failed", "Network error")
		http.queue_free()

func _on_verification_complete(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray, account_id: String, http: HTTPRequest):
	http.queue_free()
	
	if response_code == 200:
		var json = JSON.parse(body.get_string_from_utf8())
		
		if json.error == OK:
			var account_data = json.result
			var balance_tinybars = int(account_data.get("balance", {}).get("balance", 0))
			var balance_hbar = balance_tinybars / 100000000.0  # Convert tinybars to HBAR
			
			print("✅ Account verified!")
			print("   Balance: ", balance_hbar, " HBAR")
			
			current_user = {
				"account_id": account_id,
				"display_name": "King " + account_id.split(".")[2],
				"is_connected": true,
				"balance": balance_hbar
			}
			
			emit_signal("wallet_connected", account_id)
			_save_session()
			
		else:
			emit_signal("connection_failed", "Failed to parse account data")
	
	elif response_code == 404:
		emit_signal("connection_failed", "Account not found on Hedera testnet")
	
	else:
		emit_signal("connection_failed", "Verification failed (Error: " + str(response_code) + ")")

func _is_valid_account_format(account_id: String) -> bool:

	var parts = account_id.split(".")
	if parts.size() != 3:
		return false
	
	for part in parts:
		if not part.is_valid_integer():
			return false
	
	return true

func is_wallet_connected() -> bool:
	return current_user.is_connected

func disconnect_wallet():
	current_user = {
		"account_id": "",
		"display_name": "",
		"is_connected": false,
		"balance": 0
	}
	emit_signal("wallet_disconnected")
	_clear_session()

func _save_session():
	var config = ConfigFile.new()
	config.set_value("hedera", "account_id", current_user.account_id)
	config.set_value("hedera", "display_name", current_user.display_name)
	config.set_value("hedera", "balance", current_user.balance)
	config.save("user://hedera_session.cfg")

func load_session() -> bool:
	var config = ConfigFile.new()
	var err = config.load("user://hedera_session.cfg")
	
	if err == OK:
		var account_id = config.get_value("hedera", "account_id", "")
		if account_id != "":
			current_user = {
				"account_id": account_id,
				"display_name": config.get_value("hedera", "display_name", ""),
				"is_connected": true,
				"balance": config.get_value("hedera", "balance", 0)
			}
			emit_signal("wallet_connected", account_id)
			return true
	
	return false

func _clear_session():
	var dir = Directory.new()
	if dir.file_exists("user://hedera_session.cfg"):
		dir.remove("user://hedera_session.cfg")

func get_account_id() -> String:
	return current_user.account_id

func get_display_name() -> String:
	return current_user.display_name

func get_balance() -> float:
	return current_user.balance
