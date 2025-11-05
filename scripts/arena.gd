# scripts/arena.gd

extends Control

onready var main = get_parent()
onready var cpu_animator = $ANIMATOR/cpu_animator
onready var player_animator = $ANIMATOR/player_animator
onready var dice_cover_anim_cpu = $ANIMATOR/cpu_die
onready var dice_cover_anim_player = $ANIMATOR/player_die
onready var card_on_deck = $ANIMATOR/card_player/strength
onready var card_on_deck_label1 = $ANIMATOR/card_player/strength/strength_label_1
onready var card_on_deck_label2 = $ANIMATOR/card_player/strength/strength_label_2
onready var dice_cover_player = $dice_coverage
onready var dice_cover_cpu = $dice_coverage2
onready var card_on_deck_cpu = $ANIMATOR/card_cpu/strength
onready var card_on_deck_cpu_label1 = $ANIMATOR/card_cpu/strength/strength_label_1
onready var card_on_deck_cpu_label2 = $ANIMATOR/card_cpu/strength/strength_label_2
onready var card_texture = $ANIMATOR/card_player/strength/TextureRect
onready var card_texture_cpu = $ANIMATOR/card_cpu
onready var king_texture = load("res://assets/graphics/cards/king.png")
onready var soldier_texture = load("res://assets/graphics/cards/soldier.png")
onready var citizen_texture = load("res://assets/graphics/cards/citizen.png")
onready var kingdom_cards_texture = load("res://assets/graphics/cards/back.png")
onready var block_player_deck = $block
onready var is_player_card_placed = false
onready var player = $player
onready var cpu = $cpu
onready var placed_card_player = {
	"deck_id": "",
	"type": "",
	"strength": 0,
	"validity": true
}
onready var placed_card_cpu = {
	"deck_id": "",
	"type": "",
	"strength": 0,
	"validity": true
}

onready var player_die1
onready var player_die2
onready var player_die3
onready var player_die4
onready var cpu_die1
onready var cpu_die2
onready var cpu_die3
onready var cpu_die4
var rounds = 0
var cpu_power
var player_power


onready var dice_1_face_1 = $board/box/player/dice/die_1/face_1
onready var dice_1_face_2 = $board/box/player/dice/die_1/face_2
onready var dice_1_face_3 = $board/box/player/dice/die_1/face_3
onready var dice_1_face_4 = $board/box/player/dice/die_1/face_4
onready var dice_1_face_5 = $board/box/player/dice/die_1/face_5
onready var dice_1_face_6 = $board/box/player/dice/die_1/face_6
onready var dice_2_face_1 = $board/box/player/dice/die_2/face_1
onready var dice_2_face_2 = $board/box/player/dice/die_2/face_2
onready var dice_2_face_3 = $board/box/player/dice/die_2/face_3
onready var dice_2_face_4 = $board/box/player/dice/die_2/face_4
onready var dice_2_face_5 = $board/box/player/dice/die_2/face_5
onready var dice_2_face_6 = $board/box/player/dice/die_2/face_6
onready var dice_3_face_1 = $board/box/player/dice/die_3/face_1
onready var dice_3_face_2 = $board/box/player/dice/die_3/face_2
onready var dice_3_face_3 = $board/box/player/dice/die_3/face_3
onready var dice_3_face_4 = $board/box/player/dice/die_3/face_4
onready var dice_3_face_5 = $board/box/player/dice/die_3/face_5
onready var dice_3_face_6 = $board/box/player/dice/die_3/face_6
onready var dice_4_face_1 = $board/box/player/dice/die_4/face_1
onready var dice_4_face_2 = $board/box/player/dice/die_4/face_2
onready var dice_4_face_3 = $board/box/player/dice/die_4/face_3
onready var dice_4_face_4 = $board/box/player/dice/die_4/face_4
onready var dice_4_face_5 = $board/box/player/dice/die_4/face_5
onready var dice_4_face_6 = $board/box/player/dice/die_4/face_6

onready var cpu_dice_1_face_1 = $board/box/cpu/dice/die_1/face_1
onready var cpu_dice_1_face_2 = $board/box/cpu/dice/die_1/face_2
onready var cpu_dice_1_face_3 = $board/box/cpu/dice/die_1/face_3
onready var cpu_dice_1_face_4 = $board/box/cpu/dice/die_1/face_4
onready var cpu_dice_1_face_5 = $board/box/cpu/dice/die_1/face_5
onready var cpu_dice_1_face_6 = $board/box/cpu/dice/die_1/face_6
onready var cpu_dice_2_face_1 = $board/box/cpu/dice/die_2/face_1
onready var cpu_dice_2_face_2 = $board/box/cpu/dice/die_2/face_2
onready var cpu_dice_2_face_3 = $board/box/cpu/dice/die_2/face_3
onready var cpu_dice_2_face_4 = $board/box/cpu/dice/die_2/face_4
onready var cpu_dice_2_face_5 = $board/box/cpu/dice/die_2/face_5
onready var cpu_dice_2_face_6 = $board/box/cpu/dice/die_2/face_6
onready var cpu_dice_3_face_1 = $board/box/cpu/dice/die_3/face_1
onready var cpu_dice_3_face_2 = $board/box/cpu/dice/die_3/face_2
onready var cpu_dice_3_face_3 = $board/box/cpu/dice/die_3/face_3
onready var cpu_dice_3_face_4 = $board/box/cpu/dice/die_3/face_4
onready var cpu_dice_3_face_5 = $board/box/cpu/dice/die_3/face_5
onready var cpu_dice_3_face_6 = $board/box/cpu/dice/die_3/face_6
onready var cpu_dice_4_face_1 = $board/box/cpu/dice/die_4/face_1
onready var cpu_dice_4_face_2 = $board/box/cpu/dice/die_4/face_2
onready var cpu_dice_4_face_3 = $board/box/cpu/dice/die_4/face_3
onready var cpu_dice_4_face_4 = $board/box/cpu/dice/die_4/face_4
onready var cpu_dice_4_face_5 = $board/box/cpu/dice/die_4/face_5
onready var cpu_dice_4_face_6 = $board/box/cpu/dice/die_4/face_6

onready var round_board = $roundBoardBg/round_board/per_round
onready var score_board = $roundBoardBg
onready var total_rounds = 0
onready var player_round_score = 0
onready var cpu_round_score = 0
onready var round_timer = $roundBoardBg/round_board/Timer
onready var player_wins_ui = $roundBoardBg/round_board/you_win
onready var cpu_wins_ui = $roundBoardBg/round_board/cpu_win
onready var game_over_btns = $roundBoardBg/round_board/game_over_btns
onready var current_round_label = $roundBoardBg/round_board/per_round/current_round
onready var cpu_round_score_label = $roundBoardBg/round_board/per_round/cpu_score
onready var player_round_score_label = $roundBoardBg/round_board/per_round/player_score
onready var statistics_label = $roundBoardBg/round_board/round_stats/data
onready var total_rounds_won_player = 0
onready var total_rounds_won_cpu = 0

onready var cards_ui_player = [
	$board/cards_ui_player/card_in_deck_1,
	$board/cards_ui_player/card_in_deck_2,
	$board/cards_ui_player/card_in_deck_3,
	$board/cards_ui_player/card_in_deck_4,
	$board/cards_ui_player/card_in_deck_5,
	$board/cards_ui_player/card_in_deck_6,
	$board/cards_ui_player/card_in_deck_7,
	$board/cards_ui_player/card_in_deck_8,
	$board/cards_ui_player/card_in_deck_9,
	$board/cards_ui_player/card_in_deck_10
]
onready var cards_ui_cpu = [
	$board/cards_ui_cpu/card_in_deck_1,
	$board/cards_ui_cpu/card_in_deck_2,
	$board/cards_ui_cpu/card_in_deck_3,
	$board/cards_ui_cpu/card_in_deck_4,
	$board/cards_ui_cpu/card_in_deck_5,
	$board/cards_ui_cpu/card_in_deck_6,
	$board/cards_ui_cpu/card_in_deck_7,
	$board/cards_ui_cpu/card_in_deck_8,
	$board/cards_ui_cpu/card_in_deck_9,
	$board/cards_ui_cpu/card_in_deck_10
]

onready var luck_mode = false
onready var cards_left_luck_mode_counter = $player/luck/card_counter

func _get_dice_ui_nodes(is_player: bool, die_index: int):
	var prefix = "dice" if is_player else "cpu_dice"
	var suffix = ""
	if die_index == 1:
		suffix = "_1"
	elif die_index == 2:
		suffix = "_2"
	elif die_index == 3:
		suffix = "_3"
	elif die_index == 4:
		suffix = "_4"
	else:
		return null

	var dice_nodes = {}
	for i in range(1, 7):
		var node_name = prefix + suffix + "_face_" + str(i)
		dice_nodes[i] = get_node("board/box/" + ("player" if is_player else "cpu") + "/dice/die_" + str(die_index) + "/face_" + str(i))
	return dice_nodes

func _hide_dice_ui(is_player: bool, die_index: int):
	var dice_nodes = _get_dice_ui_nodes(is_player, die_index)
	if dice_nodes:
		for face_node in dice_nodes.values():
			if face_node:
				face_node.hide()

func _update_dice_ui(is_player: bool, die_index: int, value: int):
	var dice_nodes = _get_dice_ui_nodes(is_player, die_index)
	if dice_nodes and dice_nodes.has(value):
		var target_node = dice_nodes[value]
		if target_node:
			target_node.show()
			for i in range(1, 7):
				if i != value:
					var other_node = dice_nodes[i]
					if other_node:
						other_node.hide()

func _roll_dice_set(dice_count: int, is_player: bool) -> int:
	for i in range(dice_count + 1, 5):
		_hide_dice_ui(is_player, i)

	var total = 0
	var dice_values = []
	randomize()

	for i in range(1, dice_count + 1):
		var die_value = randi() % 6 + 1
		dice_values.append(die_value)
		total += die_value
		_update_dice_ui(is_player, i, die_value)

	if is_player:
		for i in range(4):
			if i < dice_values.size():
				if i == 0: player_die1 = dice_values[i]
				elif i == 1: player_die2 = dice_values[i]
				elif i == 2: player_die3 = dice_values[i]
				elif i == 3: player_die4 = dice_values[i]
			else:
				if i == 0: player_die1 = 0
				elif i == 1: player_die2 = 0
				elif i == 2: player_die3 = 0
				elif i == 3: player_die4 = 0
	else:
		for i in range(4):
			if i < dice_values.size():
				if i == 0: cpu_die1 = dice_values[i]
				elif i == 1: cpu_die2 = dice_values[i]
				elif i == 2: cpu_die3 = dice_values[i]
				elif i == 3: cpu_die4 = dice_values[i]
			else:
				if i == 0: cpu_die1 = 0
				elif i == 1: cpu_die2 = 0
				elif i == 2: cpu_die3 = 0
				elif i == 3: cpu_die4 = 0

	return total

func stop_rolling_dice():
	dice_cover_anim_cpu.stop()
	dice_cover_anim_player.stop()
	main.get_node("audio/dice_thrown").play()

func place_player_card():
	player_animator.play("place_card_player")
	draw_rules()
	print("PLAYER: ", placed_card_player)
	block_player_deck.show()
	is_player_card_placed = true
	reveal_cards()

	var dice_count = 1
	if not luck_mode:
		if placed_card_player.type == "KING" or placed_card_player.type == "CITIZEN":
			dice_count = 2
			if player.health <= 3:
				dice_count = 3
		else:
			dice_count = 3
			if player.health <= 3:
				dice_count = 4

	var dice_total = _roll_dice_set(dice_count, true)
	player_power = placed_card_player.strength + dice_total
	player_round_score_label.text = str(player_power)

	print("PLAYER POINTS: ", player_power)

func place_cpu_card():
	var dice_count = 1
	if not luck_mode:
		if placed_card_cpu.type == "KING" or placed_card_cpu.type == "CITIZEN":
			dice_count = 2
			if cpu.health <= 3:
				dice_count = 3
		else:
			dice_count = 3
			if cpu.health <= 3:
				dice_count = 4

	var dice_total = _roll_dice_set(dice_count, false)
	cpu_power = placed_card_cpu.strength + dice_total
	cpu_round_score_label.text = str(cpu_power)

	cpu_animator.play("place_card_cpu")
	dice_cover_anim_cpu.play("rolling_dice")
	dice_cover_anim_player.play("rolling")
	print("CPU: ", placed_card_cpu)
	print("CPU ATTACK POINTS: ", cpu_power)

func reveal_cards():
	if is_player_card_placed == true:
		var card_textures = {
			"KING": king_texture,
			"SOLDIER": soldier_texture,
			"CITIZEN": citizen_texture
		}
		if placed_card_player.type in card_textures:
			card_texture.texture = card_textures[placed_card_player.type]
		if placed_card_cpu.type in card_textures:
			card_texture_cpu.texture = card_textures[placed_card_cpu.type]
		var strength = str(placed_card_player.strength)
		var strength_cpu = str(placed_card_cpu.strength)
		card_on_deck_label1.text = strength
		card_on_deck_label2.text = strength
		card_on_deck_cpu_label1.text = strength_cpu
		card_on_deck_cpu_label2.text = strength_cpu
		card_on_deck_cpu.show()
		card_on_deck.show()

func _on_block_pressed():
	print("AWAIT NEW ROUND")

func match_maker():
	rounds += 1
	current_round_label.text = str("ROUND: ", rounds)
	if cpu_power > player_power:
		cpu_round_score += 1
		player.health -= 1
		print("PLAYER PLACED CARD VALIDITY", placed_card_player)
		player.check_card_false_validity()
		cpu_animator.play("withdrawl_card_cpu")
		player_animator.play("withdraw_card_player")
		print("CPU WINS THIS ROUND, BETTER LUCK NEXT TIME")
		total_rounds_won_cpu += 1
		print("HEALTH PLAYER: ", player.health)
		print("HEALTH CPU: ", cpu.health)
		print(placed_card_player.deck_id)
		board_check_card_validity()
		cards_left_luck_mode_counter.text = str(player.health)
		board_check_card_validity_player_auto()
		player.check_card_true_validity()
	else:
		player_round_score += 1
		cpu.health -= 1
		if placed_card_player.deck_id == "p1_kc" and player.king_card.deck_id == "p1_kc":
			player.king_card.validity = true
		elif placed_card_player.deck_id == "p1_sc1" and player.soldier_card_1.deck_id == "p1_sc1":
			player.soldier_card_1.validity = true
		elif placed_card_player.deck_id == "p1_sc2" and player.soldier_card_2.deck_id == "p1_sc2":
			player.soldier_card_2.validity = true
		elif placed_card_player.deck_id == "p1_sc3" and player.soldier_card_3.deck_id == "p1_sc3":
			player.soldier_card_3.validity = true
		elif placed_card_player.deck_id == "p1_sc4" and player.soldier_card_4.deck_id == "p1_sc4":
			player.soldier_card_4.validity = true
		elif placed_card_player.deck_id == "p1_sc5" and player.soldier_card_5.deck_id == "p1_sc5":
			player.soldier_card_5.validity = true
		elif placed_card_player.deck_id == "p1_sc6" and player.soldier_card_6.deck_id == "p1_sc6":
			player.soldier_card_6.validity = true
		elif placed_card_player.deck_id == "p1_cc1" and player.citizen_card_1.deck_id == "p1_cc1":
			player.citizen_card_1.validity = true
		elif placed_card_player.deck_id == "p1_cc2" and player.citizen_card_2.deck_id == "p1_cc2":
			player.citizen_card_2.validity = true
		elif placed_card_player.deck_id == "p1_cc3" and player.citizen_card_3.deck_id == "p1_cc3":
			player.citizen_card_3.validity = true
		player.check_card_true_validity()
		board_check_card_validity_cpu()
		print("HEALTH PLAYER: ", player.health)
		print("HEALTH CPU: ", cpu.health)
		cpu_animator.play("withdrawl_card_cpu")
		player_animator.play("withdraw_card_player")
		print("YOU WIN THIS ROUND, LUCK WAS ON YOUR SIDE!")
		total_rounds_won_player += 1

	update_cards_ui_player()
	update_cards_ui_cpu()
	statistics_label.text = str("YOU: ", total_rounds_won_player, " vs CPU: ", total_rounds_won_cpu)
	dice_cover_cpu.hide()
	dice_cover_player.hide()


func clean_current_cards():
	placed_card_player = {
		"deck_id": "",
		"type": "",
		"strength": 0,
		"validity": true
	}
	placed_card_cpu = {
		"deck_id": "",
		"type": "",
		"strength": 0,
		"validity": true
	}

func round_board_timer():
	cpu_animator.play_backwards("place_card_cpu")
	player_animator.play_backwards("place_card_player")

func show_round_board():
	score_board.show()
	main.get_node("audio/next_round").play()
	if player.health == 0:
		cpu_wins_ui.show()
		round_board.hide()
		game_over_btns.show()
		statistics_label.text = str("TOTAL ROUNDS - ", rounds, "/ ROUNDS WON : YOU - ", total_rounds_won_player, " vs CPU - ", total_rounds_won_cpu)
	elif cpu.health == 0:
		main.get_node("audio/you_win").play()
		player_wins_ui.show()
		round_board.hide()
		game_over_btns.show()
		statistics_label.text = str("TOTAL ROUNDS - ", rounds, "/ ROUNDS WON : YOU - ", total_rounds_won_player, " vs CPU - ", total_rounds_won_cpu)
	else:
		game_over_btns.hide()
		round_board.show()
		cpu_wins_ui.hide()
		player_wins_ui.hide()
		statistics_label.text = str("YOU: ", total_rounds_won_player, " vs CPU: ", total_rounds_won_cpu)
	randomize()

func _on_next_round_pressed():
	cpu.place_card()
	score_board.hide()
	round_board.hide()
	dice_cover_cpu.show()
	dice_cover_player.show()
	block_player_deck.hide()
	card_on_deck_cpu.hide()
	card_texture_cpu.texture = kingdom_cards_texture

func update_cards_ui_cpu():
	for i in range(cards_ui_cpu.size()):
		cards_ui_cpu[i].hide()
	match cpu.health:
		10: cards_ui_cpu[9].show()
		9: cards_ui_cpu[8].show()
		8: cards_ui_cpu[7].show()
		7: cards_ui_cpu[6].show()
		6: cards_ui_cpu[5].show()
		5: cards_ui_cpu[4].show()
		4: cards_ui_cpu[3].show()
		3: cards_ui_cpu[2].show()
		2: cards_ui_cpu[1].show()
		1: cards_ui_cpu[0].show()

func update_cards_ui_player():
	for i in range(cards_ui_player.size()):
		cards_ui_player[i].hide()
	match player.health:
		10: cards_ui_player[9].show()
		9: cards_ui_player[8].show()
		8: cards_ui_player[7].show()
		7: cards_ui_player[6].show()
		6: cards_ui_player[5].show()
		5: cards_ui_player[4].show()
		4: cards_ui_player[3].show()
		3: cards_ui_player[2].show()
		2: cards_ui_player[1].show()
		1: cards_ui_player[0].show()

func board_check_card_validity():
	if placed_card_player.deck_id == "p1_kc":
		player.tombs[0].show()
		if player.king_card.deck_id == "p1_kc":
			player.king_card.validity = false
	if placed_card_player.deck_id == "p1_sc1":
		player.tombs[1].show()
		if player.soldier_card_1.deck_id == "p1_sc1":
			player.soldier_card_1.validity = false
	if placed_card_player.deck_id == "p1_sc2":
		player.tombs[2].show()
		if player.soldier_card_2.deck_id == "p1_sc2":
			player.soldier_card_2.validity = false
	if placed_card_player.deck_id == "p1_sc3":
		player.tombs[3].show()
		if player.soldier_card_3.deck_id == "p1_sc3":
			player.soldier_card_3.validity = false
	if placed_card_player.deck_id == "p1_sc4":
		player.tombs[4].show()
		if player.soldier_card_4.deck_id == "p1_sc4":
			player.soldier_card_4.validity = false
	if placed_card_player.deck_id == "p1_sc6":
		player.tombs[5].show()
		if player.soldier_card_6.deck_id == "p1_sc6":
			player.soldier_card_6.validity = false
	if placed_card_player.deck_id == "p1_sc5":
		player.tombs[6].show()
		if player.soldier_card_5.deck_id == "p1_sc5":
			player.soldier_card_5.validity = false
	if placed_card_player.deck_id == "p1_cc1":
		player.tombs[7].show()
		if player.citizen_card_1.deck_id == "p1_cc1":
			player.citizen_card_1.validity = false
	if placed_card_player.deck_id == "p1_cc2":
		player.tombs[8].show()
		if player.citizen_card_2.deck_id == "p1_cc2":
			player.citizen_card_2.validity = false
	if placed_card_player.deck_id == "p1_cc3":
		player.tombs[9].show()
		if player.citizen_card_3.deck_id == "p1_cc3":
			player.citizen_card_3.validity = false

func board_check_card_validity_cpu():
	if placed_card_cpu.deck_id == "c1_kc":
		cpu.cpu_deck_king.erase(cpu.king_card)
	if placed_card_cpu.deck_id == "c1_sc1":
		cpu.cpu_deck_soldier.erase(cpu.soldier_card_1)
	if placed_card_cpu.deck_id == "c1_sc2":
		cpu.cpu_deck_soldier.erase(cpu.soldier_card_2)
	if placed_card_cpu.deck_id == "c1_sc3":
		cpu.cpu_deck_soldier.erase(cpu.soldier_card_3)
	if placed_card_cpu.deck_id == "c1_sc4":
		cpu.cpu_deck_soldier.erase(cpu.soldier_card_4)
	if placed_card_cpu.deck_id == "c1_sc5":
		cpu.cpu_deck_soldier.erase(cpu.soldier_card_5)
	if placed_card_cpu.deck_id == "c1_sc6":
		cpu.cpu_deck_soldier.erase(cpu.soldier_card_6)
	if placed_card_cpu.deck_id == "c1_cc1":
		cpu.cpu_deck_citizen.erase(cpu.citizen_card_1)
	if placed_card_cpu.deck_id == "c1_cc2":
		cpu.cpu_deck_citizen.erase(cpu.citizen_card_2)
	if placed_card_cpu.deck_id == "c1_cc3":
		cpu.cpu_deck_citizen.erase(cpu.citizen_card_3)
	if cpu.cpu_deck_king.empty():
		cpu.cpu_picker.erase(1)
	if cpu.cpu_deck_soldier.empty():
		cpu.cpu_picker.erase(2)
	if cpu.cpu_deck_citizen.empty():
		cpu.cpu_picker.erase(3)
	print('cpu- CURRENT DECK')
	print('KING ', cpu.cpu_deck_king)
	print('SOLDIERS ', cpu.cpu_deck_soldier)
	print('CITIZENS ', cpu.cpu_deck_citizen)

func board_check_card_validity_player_auto():
	if placed_card_player.deck_id == "p1_kc":
		if player.king_card.deck_id == "p1_kc":
			player.king_card.validity = false
		player.cpu_deck_king.erase(player.king_card)
	if placed_card_player.deck_id == "p1_sc1":
		if player.soldier_card_1.deck_id == "p1_sc1":
			player.soldier_card_1.validity = false
		player.cpu_deck_soldier.erase(player.soldier_card_1)
	if placed_card_player.deck_id == "p1_sc2":
		if player.soldier_card_2.deck_id == "p1_sc2":
			player.soldier_card_2.validity = false
		player.cpu_deck_soldier.erase(player.soldier_card_2)
	if placed_card_player.deck_id == "p1_sc3":
		if player.soldier_card_3.deck_id == "p1_sc3":
			player.soldier_card_3.validity = false
		player.cpu_deck_soldier.erase(player.soldier_card_3)
	if placed_card_player.deck_id == "p1_sc4":
		if player.soldier_card_4.deck_id == "p1_sc4":
			player.soldier_card_4.validity = false
		player.cpu_deck_soldier.erase(player.soldier_card_4)
	if placed_card_player.deck_id == "p1_sc5":
		if player.soldier_card_5.deck_id == "p1_sc5":
			player.soldier_card_5.validity = false
		player.cpu_deck_soldier.erase(player.soldier_card_5)
	if placed_card_player.deck_id == "p1_sc6":
		if player.soldier_card_6.deck_id == "p1_sc6":
			player.soldier_card_6.validity = false
		player.cpu_deck_soldier.erase(player.soldier_card_6)
	if placed_card_player.deck_id == "p1_cc1":
		if player.citizen_card_1.deck_id == "p1_cc1":
			player.citizen_card_1.validity = false
		player.cpu_deck_citizen.erase(player.citizen_card_1)
	if placed_card_player.deck_id == "p1_cc2":
		if player.citizen_card_2.deck_id == "p1_cc2":
			player.citizen_card_2.validity = false
		player.cpu_deck_citizen.erase(player.citizen_card_2)
	if placed_card_player.deck_id == "p1_cc3":
		if player.citizen_card_3.deck_id == "p1_cc3":
			player.citizen_card_3.validity = false
		player.cpu_deck_citizen.erase(player.citizen_card_3)
	if player.cpu_deck_king.empty():
		player.cpu_picker.erase(1)
	if player.cpu_deck_soldier.empty():
		player.cpu_picker.erase(2)
	if player.cpu_deck_citizen.empty():
		player.cpu_picker.erase(3)

func hide_tombs():
	player.tombs[0].hide()
	player.tombs[1].hide()
	player.tombs[2].hide()
	player.tombs[3].hide()
	player.tombs[4].hide()
	player.tombs[5].hide()
	player.tombs[6].hide()
	player.tombs[7].hide()
	player.tombs[8].hide()
	player.tombs[9].hide()

func reset_game_data():
	randomize()
	shuffler.shuffle_and_distribute_cards()
	
	player.king_card.validity = true
	player.soldier_card_1.validity = true
	player.soldier_card_2.validity = true
	player.soldier_card_3.validity = true
	player.soldier_card_4.validity = true
	player.soldier_card_5.validity = true
	player.soldier_card_6.validity = true
	player.citizen_card_1.validity = true
	player.citizen_card_2.validity = true
	player.citizen_card_3.validity = true
	
	cpu.king_card.validity = true
	cpu.soldier_card_1.validity = true
	cpu.soldier_card_2.validity = true
	cpu.soldier_card_3.validity = true
	cpu.soldier_card_4.validity = true
	cpu.soldier_card_5.validity = true
	cpu.soldier_card_6.validity = true
	cpu.citizen_card_1.validity = true
	cpu.citizen_card_2.validity = true
	cpu.citizen_card_3.validity = true
	
	cpu.cpu_deck_king = [cpu.king_card]
	cpu.cpu_deck_soldier = [
		cpu.soldier_card_1,
		cpu.soldier_card_2,
		cpu.soldier_card_3,
		cpu.soldier_card_4,
		cpu.soldier_card_5,
		cpu.soldier_card_6,
	]
	cpu.cpu_deck_citizen = [
		cpu.citizen_card_1,
		cpu.citizen_card_2,
		cpu.citizen_card_3,
	]
	
	cpu.cpu_picker = [1, 2, 3]
	
	player.cpu_deck_king = [player.king_card]
	player.cpu_deck_soldier = [
		player.soldier_card_1,
		player.soldier_card_2,
		player.soldier_card_3,
		player.soldier_card_4,
		player.soldier_card_5,
		player.soldier_card_6,
	]
	player.cpu_deck_citizen = [
		player.citizen_card_1,
		player.citizen_card_2,
		player.citizen_card_3,
	]
	player.cpu_picker = [1, 2, 3]
	
	player.check_card_true_validity()
	hide_tombs()
	rounds = 0
	player.health = 10
	cpu.health = 10
	card_texture_cpu.texture = kingdom_cards_texture
	cpu.place_card()
	cards_left_luck_mode_counter.text = str(player.health)
	update_cards_ui_cpu()
	update_cards_ui_player()
	block_player_deck.hide()
	player_round_score = 0
	cpu_round_score = 0
	total_rounds_won_player = 0 
	total_rounds_won_cpu = 0    
	dice_cover_cpu.show()
	dice_cover_player.show()

func start_game():
	reset_game_data()

func _on_main_menu_pressed():
	score_board.hide()
	get_tree().reload_current_scene()

func _on_replay_pressed():
	score_board.hide()
	reset_game_data()

func draw_rules():
	if player_power == cpu_power:
		if placed_card_cpu.type == "KING" and placed_card_player.type == "CITIZEN":
			player_power = player_power + 1
		elif placed_card_player.type == "KING" and placed_card_cpu.type == "CITIZEN":
			cpu_power = cpu_power + 1
		elif placed_card_player.type == "SOLDIER" and placed_card_cpu.type == "CITIZEN":
			player_power = player_power + 1
		elif placed_card_cpu.type == "SOLDIER" and placed_card_player.type == "CITIZEN":
			cpu_power = cpu_power + 1
		elif placed_card_cpu.type == "KING" and placed_card_player.type == "SOLDIER":
			cpu_power = cpu_power + 1
		elif placed_card_player.type == "KING" and placed_card_cpu.type == "SOLDIER":
			player_power = player_power + 1
		else:
			player_power = player_power + 1

func _on_skill_mode_pressed():
	start_game()

func _on_luck_mode_pressed():
	luck_mode = true
	start_game()
