extends Control

onready var main = get_parent()
onready var cpu_animator = $ANIMATOR/cpu_animator
onready var player_animator = $ANIMATOR/player_animator
onready var dice_cover_anim_cpu = $ANIMATOR/cpu_die
onready var dice_cover_anim_player = $ANIMATOR/player_die
onready var card_on_deck =$ANIMATOR/card_player/strength
onready var card_on_deck_label1 = $ANIMATOR/card_player/strength/strength_label_1
onready var card_on_deck_label2 = $ANIMATOR/card_player/strength/strength_label_2

onready var dice_cover_player = $dice_coverage
onready var dice_cover_cpu = $dice_coverage2

onready var card_on_deck_cpu =$ANIMATOR/card_cpu/strength
onready var card_on_deck_cpu_label1 = $ANIMATOR/card_cpu/strength/strength_label_1
onready var card_on_deck_cpu_label2 = $ANIMATOR/card_cpu/strength/strength_label_2

onready var card_texture = $ANIMATOR/card_player/strength/TextureRect
onready var card_texture_cpu = $ANIMATOR/card_cpu

onready var king_texture  = load("res://assets/graphics/cards/king.png")
onready var soldier_texture  = load("res://assets/graphics/cards/soldier.png")
onready var citizen_texture  = load("res://assets/graphics/cards/citizen.png")
onready var kingdom_cards_texture = load("res://assets/graphics/cards/back.png")

onready var block_player_deck = $block
onready var is_player_card_placed = false
onready var player = $player
onready var cpu = $cpu


onready var placed_card_player = {
	"deck_id" : "" , 
	"type" : "", 
	"strength" : 0 , 
	"validity" : true
	
	}
onready var placed_card_cpu = {
	"deck_id" : "" , 
	"type" : "", 
	"strength" : 0 , 
	"validity" : true
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
#CPU DICE ---------------------------------------------------------
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
onready var cpu_round_score  = 0
onready var round_timer = $roundBoardBg/round_board/Timer
onready var player_wins_ui = $roundBoardBg/round_board/you_win
onready var cpu_wins_ui = $roundBoardBg/round_board/cpu_win
onready var game_over_btns = $roundBoardBg/round_board/game_over_btns

onready var current_round_label = $roundBoardBg/round_board/per_round/current_round
onready var cpu_round_score_label = $roundBoardBg/round_board/per_round/cpu_score
onready var player_round_score_label = $roundBoardBg/round_board/per_round/player_score
onready var statistics_label =$roundBoardBg/round_board/round_stats/data
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
$board/cards_ui_cpu/card_in_deck_10]




#CARD UI --------------------------------------------------------------
onready var luck_mode = false
onready var cards_left_luck_mode_counter = $player/luck/card_counter


#func _ready():
##	$ANIMATOR/card_player.visible = true
##	$ANIMATOR/card_player.rect_position = Vector2(528,613)
#	passs
func stop_rolling_dice():
	dice_cover_anim_cpu.stop()
	dice_cover_anim_player.stop()
	main.get_node("audio/dice_thrown").play()

func place_player_card():
	player_animator.play("place_card_player")
	draw_rules()
	print("PLAYER: ",placed_card_player)
	block_player_deck.show()
	is_player_card_placed = true
	reveal_cards()
	
	if placed_card_player.type == "KING"||placed_card_player.type == "CITIZEN":
		if luck_mode == false:
			roll_dice_standard()
			print("die1 : ",player_die1)
			print("die2 : ",player_die2)
			player_power = player_die1 + player_die2 + placed_card_player.strength
			player_round_score_label.text = str(player_power)
	
		
			if player.health <= 3:
				roll_dice_balanced()
				player_power = placed_card_player.strength + player_die1 + player_die2 + player_die3
				player_round_score_label.text = str(player_power) 
				print("die1 : ",player_die1)
				print("die2 : ",player_die2)
				print("die3 : ",player_die3)
		elif luck_mode == true:
			roll_die_once_player()
			player_power = player_die1 + placed_card_player.strength
			player_round_score_label.text = str(player_power)
		
	else:
		if luck_mode == false:
			roll_dice_balanced()
			print("die1 : ",player_die1)
			print("die2 : ",player_die2)
			print("die3 : ",player_die3)
			player_power = player_die1 + player_die2 + player_die3 + placed_card_player.strength
			player_round_score_label.text = str(player_power)
	
		
			if player.health <= 3:
				roll_dice_balanced_endgame()
				player_power = placed_card_player.strength + player_die1 + player_die2 + player_die3 + player_die4
				player_round_score_label.text = str(player_power) 
				print("die1 : ",player_die1)
				print("die2 : ",player_die2)
				print("die3 : ",player_die3)
				print("die4 : ",player_die4)
				
		elif luck_mode == true:
			roll_die_once_player()
			player_power = player_die1 + placed_card_player.strength
			player_round_score_label.text = str(player_power)
		
	print("PLAYER POINTS: ", player_power)

func place_cpu_card():
	if placed_card_cpu.type == "KING"||placed_card_cpu.type == "CITIZEN":
		if luck_mode == false:
			roll_dice_standard_cpu()
			print("die1 : ",cpu_die1)
			print("die2 : ",cpu_die2)
			cpu_power = placed_card_cpu.strength + cpu_die1 + cpu_die2
			cpu_round_score_label.text = str(cpu_power) 
			
			if cpu.health <= 3:
				roll_dice_balanced_cpu()
				cpu_power = placed_card_cpu.strength + cpu_die1 + cpu_die2 + cpu_die3
				cpu_round_score_label.text = str(cpu_power) 
				print("die1 : ",cpu_die1)
				print("die2 : ",cpu_die2)
				print("die3 : ",cpu_die3)
		elif luck_mode == true:
			roll_die_once_cpu()
			cpu_power = placed_card_cpu.strength + cpu_die1
			cpu_round_score_label.text = str(cpu_power)
	else:
		if luck_mode == false:
			roll_dice_balanced_cpu()
			print("die1 : ",cpu_die1)
			print("die2 : ",cpu_die2)
			print("die3 : ",cpu_die3)
			cpu_power = placed_card_cpu.strength + cpu_die1 + cpu_die2 + cpu_die3
			cpu_round_score_label.text = str(cpu_power)
			if cpu.health <= 3:
				roll_dice_balanced_endgame_cpu()
				cpu_power = placed_card_cpu.strength + cpu_die1 + cpu_die2 + cpu_die3 + cpu_die4
				cpu_round_score_label.text = str(cpu_power) 
				print("die1 : ",cpu_die1)
				print("die2 : ",cpu_die2)
				print("die3 : ",cpu_die3)
				print("die4 : ",cpu_die4)
		elif luck_mode==true:
			roll_die_once_cpu()
			cpu_power = placed_card_cpu.strength + cpu_die1
			cpu_round_score_label.text = str(cpu_power)
			
	cpu_animator.play("place_card_cpu")
	dice_cover_anim_cpu.play("rolling_dice")
	dice_cover_anim_player.play("rolling")
	print("CPU: ",placed_card_cpu)
	print("CPU ATTACK POINTS: ",cpu_power)
	

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
		player.health-=1
		placed_card_player.validity = false
		print("PLAYER PLACED CARD VALIDITY",placed_card_player)
		player.check_card_false_validity()
		
		cpu_animator.play("withdrawl_card_cpu")
		player_animator.play("withdraw_card_player")
		
		print("CPU WINS THIS ROUND, BETTER LUCK NEXT TIME")
		total_rounds_won_cpu += 1
		print("HEALTH PLAYER: ",player.health)
		print("HEALTH CPU: ",cpu.health)
		print(placed_card_player.deck_id)
		board_check_card_validity()
		cards_left_luck_mode_counter.text = str(player.health)
		board_check_card_validity_player_auto()
	else:
		player_round_score += 1
		cpu.health-=1
		placed_card_cpu.validity = false
		player.check_card_true_validity()
		board_check_card_validity_cpu()
		
		print("HEALTH PLAYER: ",player.health)
		print("HEALTH CPU: ",cpu.health)
		cpu_animator.play("withdrawl_card_cpu")
		player_animator.play("withdraw_card_player")
		print("YOU WIN THIS ROUND, LUCK WAS ON YOUR SIDE!")
		total_rounds_won_player += 1
	
	update_cards_ui_player()
	update_cards_ui_cpu()
	statistics_label.text=str("YOU: ",total_rounds_won_player, " vs CPU: ",total_rounds_won_cpu)
	dice_cover_cpu.hide()
	dice_cover_player.hide()
	

func clean_current_cards():
	placed_card_player = {
	"deck_id" : "" , 
	"type" : "", 
	"strength" : 0 , 
	"validity" : true
	}
	placed_card_cpu  = {
	"deck_id" : "" , 
	"type" : "", 
	"strength" : 0 , 
	"validity" : true
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
		statistics_label.text=str("TOTAL ROUNDS - ",rounds,"/ ROUNDS WON : YOU - ",total_rounds_won_player, " vs CPU - ",total_rounds_won_cpu)
	elif cpu.health == 0:
		main.get_node("audio/you_win").play()
		player_wins_ui.show()
		round_board.hide()
		game_over_btns.show()
		statistics_label.text=str("TOTAL ROUNDS - ",rounds,"/ ROUNDS WON : YOU - ",total_rounds_won_player, " vs CPU - ",total_rounds_won_cpu)
	else:
		game_over_btns.hide()
		round_board.show()
		cpu_wins_ui.hide()
		player_wins_ui.hide()
		statistics_label.text=str("YOU: ",total_rounds_won_player, " vs CPU: ",total_rounds_won_cpu)
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
		10:
			cards_ui_cpu[9].show()
		9:
			cards_ui_cpu[8].show()
		8:
			cards_ui_cpu[7].show()
		7:
			cards_ui_cpu[6].show()
		6:
			cards_ui_cpu[5].show()
		5:
			cards_ui_cpu[4].show()
		4:
			cards_ui_cpu[3].show()
		3:
			cards_ui_cpu[2].show()
		2:
			cards_ui_cpu[1].show()
		1:
			cards_ui_cpu[0].show()


func update_cards_ui_player():
	for i in range(cards_ui_player.size()):
		cards_ui_player[i].hide()

	match player.health:
		10:
			cards_ui_player[9].show()
		9:
			cards_ui_player[8].show()
		8:
			cards_ui_player[7].show()
		7:
			cards_ui_player[6].show()
		6:
			cards_ui_player[5].show()
		5:
			cards_ui_player[4].show()
		4:
			cards_ui_player[3].show()
		3:
			cards_ui_player[2].show()
		2:
			cards_ui_player[1].show()
		1:
			cards_ui_player[0].show()
			
func board_check_card_validity():
	if placed_card_player.deck_id == "p1_kc":
		player.tombs[0].show()
	if placed_card_player.deck_id == "p1_sc1":
		player.tombs[1].show()
	if placed_card_player.deck_id == "p1_sc2":
		player.tombs[2].show()
	if placed_card_player.deck_id == "p1_sc3":
		player.tombs[3].show()
	if placed_card_player.deck_id == "p1_sc4":
		player.tombs[4].show()
	if placed_card_player.deck_id == "p1_sc5":
		player.tombs[5].show()
	if placed_card_player.deck_id == "p1_sc6":
		player.tombs[6].show()
	if placed_card_player.deck_id == "p1_cc1":
		player.tombs[7].show()
	if placed_card_player.deck_id == "p1_cc2":
		player.tombs[8].show()
	if placed_card_player.deck_id == "p1_cc3":
		player.tombs[9].show()

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

# LUCK MODE CARD VALIDITY CHECKER

func board_check_card_validity_player_auto():
	if placed_card_player.deck_id == "p1_kc":
		player.cpu_deck_king.erase(player.king_card)
	if placed_card_player.deck_id == "p1_sc1":
		player.cpu_deck_soldier.erase(player.soldier_card_1)
	if placed_card_player.deck_id == "p1_sc2":
		player.cpu_deck_soldier.erase(player.soldier_card_2)
	if placed_card_player.deck_id == "p1_sc3":
		player.cpu_deck_soldier.erase(player.soldier_card_3)
	if placed_card_player.deck_id == "p1_sc4":
		player.cpu_deck_soldier.erase(player.soldier_card_4)
	if placed_card_player.deck_id == "p1_sc5":
		player.cpu_deck_soldier.erase(player.soldier_card_5)
	if placed_card_player.deck_id == "p1_sc6":
		player.cpu_deck_soldier.erase(player.soldier_card_6)
	if placed_card_player.deck_id == "p1_cc1":
		player.cpu_deck_citizen.erase(player.citizen_card_1)
	if placed_card_player.deck_id == "p1_cc2":
		player.cpu_deck_citizen.erase(player.citizen_card_2)
	if placed_card_player.deck_id == "p1_cc3":
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
	shuffler.shuffle_and_distribute_cards()
	player.check_card_true_validity()
	hide_tombs()
	rounds = 0
	player.health = 10
	cpu.health = 10
	cards_left_luck_mode_counter.text = str(player.health)
	
	update_cards_ui_cpu()
	update_cards_ui_player()
	block_player_deck.hide()
	
	player_round_score = 0
	cpu_round_score = 0
	cpu.place_card()
	
	
func start_game():
	reset_game_data()
	
	


func _on_main_menu_pressed():
	score_board.hide()
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()


func _on_replay_pressed():
	score_board.hide()
	reset_game_data()
# warning-ignore:return_value_discarded

func draw_rules():
	if player_power == cpu_power:
		if placed_card_cpu.type == "KING" && placed_card_player.type == "CITIZEN":
			player_power = player_power + 1
		elif placed_card_player.type == "KING" && placed_card_cpu.type == "CITIZEN":
			cpu_power = cpu_power + 1
		elif placed_card_player.type == "SOLDIER" && placed_card_cpu.type == "CITIZEN":
			player_power = player_power + 1
		elif placed_card_cpu.type == "SOLDIER" && placed_card_player.type == "CITIZEN":
			cpu_power = cpu_power + 1
		elif placed_card_cpu.type == "KING" && placed_card_player.type == "SOLDIER":
			cpu_power = cpu_power + 1
		elif placed_card_player.type == "KING" && placed_card_cpu.type == "SOLDIER":
			player_power = player_power + 1
		else:
			player_power = player_power + 1

func _on_skill_mode_pressed():
	start_game()


func _on_luck_mode_pressed():
	luck_mode = true
	start_game()

#=========================DICE LOGIC =========================


func roll_die_once_player():
	randomize()
	var die1 = randi() % 6 + 1
	dice_2_face_1.hide()
	dice_2_face_2.hide()
	dice_2_face_3.hide()
	dice_2_face_4.hide()
	dice_2_face_5.hide()
	dice_2_face_6.hide()
	
	player_die1 = die1
	
	match player_die1:
		1:
			dice_1_face_1.show()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
			
		2:
			dice_1_face_2.show()
			dice_1_face_1.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
		3:
			dice_1_face_3.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
		4:
			dice_1_face_4.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
		5:
			dice_1_face_5.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_6.hide()
		6:
			dice_1_face_6.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()

func roll_die_once_cpu():
	randomize()
	var die1 = randi() % 6 + 1
	cpu_dice_2_face_1.hide()
	cpu_dice_2_face_2.hide()
	cpu_dice_2_face_3.hide()
	cpu_dice_2_face_4.hide()
	cpu_dice_2_face_5.hide()
	cpu_dice_2_face_6.hide()
	
	cpu_die1 = die1
	match cpu_die1:
		1:
			cpu_dice_1_face_1.show()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
			
		2:
			cpu_dice_1_face_2.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
		3:
			cpu_dice_1_face_3.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
		4:
			cpu_dice_1_face_4.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
		5:
			cpu_dice_1_face_5.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_6.hide()
		6:
			cpu_dice_1_face_6.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()

func roll_dice_standard()-> int:
	dice_3_face_1.hide()
	dice_3_face_2.hide()
	dice_3_face_3.hide()
	dice_3_face_4.hide()
	dice_3_face_5.hide()
	dice_3_face_6.hide()
	randomize()
	var die1 = randi() % 6 + 1
	var die2 = randi() % 6 + 1
	player_die1 = die1
	player_die2 = die2
	
	match player_die1:
		1:
			dice_1_face_1.show()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
			
		2:
			dice_1_face_2.show()
			dice_1_face_1.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
		3:
			dice_1_face_3.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
		4:
			dice_1_face_4.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
		5:
			dice_1_face_5.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_6.hide()
		6:
			dice_1_face_6.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			
	match player_die2:
		1:
			dice_2_face_1.show()
			dice_2_face_2.hide()
			dice_2_face_3.hide()
			dice_2_face_4.hide()
			dice_2_face_5.hide()
			dice_2_face_6.hide()
		2:
			dice_2_face_2.show()
			dice_2_face_1.hide()
			dice_2_face_3.hide()
			dice_2_face_4.hide()
			dice_2_face_5.hide()
			dice_2_face_6.hide()
		3:
			dice_2_face_3.show()
			dice_2_face_1.hide()
			dice_2_face_2.hide()
			dice_2_face_4.hide()
			dice_2_face_5.hide()
			dice_2_face_6.hide()
		4:
			dice_2_face_4.show()
			dice_2_face_1.hide()
			dice_2_face_2.hide()
			dice_2_face_3.hide()
			dice_2_face_5.hide()
			dice_2_face_6.hide()
		5:
			dice_2_face_5.show()
			dice_2_face_1.hide()
			dice_2_face_2.hide()
			dice_2_face_3.hide()
			dice_2_face_4.hide()
			dice_2_face_6.hide()
		6:
			dice_2_face_6.show()
			dice_2_face_1.hide()
			dice_2_face_2.hide()
			dice_2_face_3.hide()
			dice_2_face_4.hide()
			dice_2_face_5.hide()
	return die1 + die2

func roll_dice_standard_cpu()-> int:

	
	cpu_dice_3_face_1.hide()
	cpu_dice_3_face_2.hide()
	cpu_dice_3_face_3.hide()
	cpu_dice_3_face_4.hide()
	cpu_dice_3_face_5.hide()
	cpu_dice_3_face_6.hide()
	randomize()
	var die1 = int(rand_range(1, 6))
	var die2 = int(rand_range(1, 6))
	cpu_die1 = die1
	cpu_die2 = die2
	match cpu_die1:
		1:
			cpu_dice_1_face_1.show()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
			
		2:
			cpu_dice_1_face_2.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
		3:
			cpu_dice_1_face_3.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
		4:
			cpu_dice_1_face_4.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
		5:
			cpu_dice_1_face_5.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_6.hide()
		6:
			cpu_dice_1_face_6.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			
	match cpu_die2:
		1:
			cpu_dice_2_face_1.show()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_5.hide()
			cpu_dice_2_face_6.hide()
		2:
			cpu_dice_2_face_2.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_5.hide()
			cpu_dice_2_face_6.hide()
		3:
			cpu_dice_2_face_3.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_5.hide()
			cpu_dice_2_face_6.hide()
		4:
			cpu_dice_2_face_4.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_5.hide()
			cpu_dice_2_face_6.hide()
		5:
			cpu_dice_2_face_5.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_6.hide()
		6:
			cpu_dice_2_face_6.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_5.hide()
	return die1 + die2

func roll_dice_balanced_cpu() -> int:
	cpu_dice_4_face_1.hide()
	cpu_dice_4_face_2.hide()
	cpu_dice_4_face_3.hide()
	cpu_dice_4_face_4.hide()
	cpu_dice_4_face_5.hide()
	cpu_dice_4_face_6.hide()
	randomize()
	var die1 = randi() % 6 + 1
	var die2 = randi() % 6 + 1
	var die3 = randi() % 6 + 1
	
	cpu_die1 = die1
	cpu_die2 = die2
	cpu_die3 = die3
	
	
	match cpu_die1:
		1:
			cpu_dice_1_face_1.show()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
			
		2:
			cpu_dice_1_face_2.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
		3:
			cpu_dice_1_face_3.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
		4:
			cpu_dice_1_face_4.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
		5:
			cpu_dice_1_face_5.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_6.hide()
		6:
			cpu_dice_1_face_6.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			
	match cpu_die2:
		1:
			cpu_dice_2_face_1.show()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_5.hide()
			cpu_dice_2_face_6.hide()
		2:
			cpu_dice_2_face_2.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_5.hide()
			cpu_dice_2_face_6.hide()
		3:
			cpu_dice_2_face_3.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_5.hide()
			cpu_dice_2_face_6.hide()
		4:
			cpu_dice_2_face_4.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_5.hide()
			cpu_dice_2_face_6.hide()
		5:
			cpu_dice_2_face_5.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_6.hide()
		6:
			cpu_dice_2_face_6.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_5.hide()
			
	match cpu_die3:
		1:
			cpu_dice_3_face_1.show()
			cpu_dice_3_face_2.hide()
			cpu_dice_3_face_3.hide()
			cpu_dice_3_face_4.hide()
			cpu_dice_3_face_5.hide()
			cpu_dice_3_face_6.hide()
		2:
			cpu_dice_3_face_2.show()
			cpu_dice_3_face_1.hide()
			cpu_dice_3_face_3.hide()
			cpu_dice_3_face_4.hide()
			cpu_dice_3_face_5.hide()
			cpu_dice_3_face_6.hide()
		3:
			cpu_dice_3_face_3.show()
			cpu_dice_3_face_1.hide()
			cpu_dice_3_face_2.hide()
			cpu_dice_3_face_4.hide()
			cpu_dice_3_face_5.hide()
			cpu_dice_3_face_6.hide()
		4:
			cpu_dice_3_face_4.show()
			cpu_dice_3_face_1.hide()
			cpu_dice_3_face_2.hide()
			cpu_dice_3_face_3.hide()
			cpu_dice_3_face_5.hide()
			cpu_dice_3_face_6.hide()
		5:
			cpu_dice_3_face_5.show()
			cpu_dice_3_face_1.hide()
			cpu_dice_3_face_2.hide()
			cpu_dice_3_face_3.hide()
			cpu_dice_3_face_4.hide()
			cpu_dice_3_face_6.hide()
		6:
			cpu_dice_3_face_6.show()
			cpu_dice_3_face_1.hide()
			cpu_dice_3_face_2.hide()
			cpu_dice_3_face_3.hide()
			cpu_dice_3_face_4.hide()
			cpu_dice_3_face_5.hide()
			

	return die1 + die2 + die3
	
	
func roll_dice_balanced() -> int:
	dice_4_face_1.hide()
	dice_4_face_2.hide()
	dice_4_face_3.hide()
	dice_4_face_4.hide()
	dice_4_face_5.hide()
	dice_4_face_6.hide()
	randomize()
	var die1 = randi() % 6 + 1
	var die2 = randi() % 6 + 1
	var die3 = randi() % 6 + 1
	
	player_die1 = die1
	player_die2 = die2
	player_die3 = die3
	

	match player_die1:
		1:
			dice_1_face_1.show()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
			
		2:
			dice_1_face_2.show()
			dice_1_face_1.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
		3:
			dice_1_face_3.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
		4:
			dice_1_face_4.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
		5:
			dice_1_face_5.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_6.hide()
		6:
			dice_1_face_6.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			
	match player_die2:
		1:
			dice_2_face_1.show()
			dice_2_face_2.hide()
			dice_2_face_3.hide()
			dice_2_face_4.hide()
			dice_2_face_5.hide()
			dice_2_face_6.hide()
		2:
			dice_2_face_2.show()
			dice_2_face_1.hide()
			dice_2_face_3.hide()
			dice_2_face_4.hide()
			dice_2_face_5.hide()
			dice_2_face_6.hide()
		3:
			dice_2_face_3.show()
			dice_2_face_1.hide()
			dice_2_face_2.hide()
			dice_2_face_4.hide()
			dice_2_face_5.hide()
			dice_2_face_6.hide()
		4:
			dice_2_face_4.show()
			dice_2_face_1.hide()
			dice_2_face_2.hide()
			dice_2_face_3.hide()
			dice_2_face_5.hide()
			dice_2_face_6.hide()
		5:
			dice_2_face_5.show()
			dice_2_face_1.hide()
			dice_2_face_2.hide()
			dice_2_face_3.hide()
			dice_2_face_4.hide()
			dice_2_face_6.hide()
		6:
			dice_2_face_6.show()
			dice_2_face_1.hide()
			dice_2_face_2.hide()
			dice_2_face_3.hide()
			dice_2_face_4.hide()
			dice_2_face_5.hide()
		
	match player_die3:
		1:
			dice_3_face_1.show()
			dice_3_face_2.hide()
			dice_3_face_3.hide()
			dice_3_face_4.hide()
			dice_3_face_5.hide()
			dice_3_face_6.hide()
		2:
			dice_3_face_2.show()
			dice_3_face_1.hide()
			dice_3_face_3.hide()
			dice_3_face_4.hide()
			dice_3_face_5.hide()
			dice_3_face_6.hide()
		3:
			dice_3_face_3.show()
			dice_3_face_1.hide()
			dice_3_face_2.hide()
			dice_3_face_4.hide()
			dice_3_face_5.hide()
			dice_3_face_6.hide()
		4:
			dice_3_face_4.show()
			dice_3_face_1.hide()
			dice_3_face_2.hide()
			dice_3_face_3.hide()
			dice_3_face_5.hide()
			dice_3_face_6.hide()
		5:
			dice_3_face_5.show()
			dice_3_face_1.hide()
			dice_3_face_2.hide()
			dice_3_face_3.hide()
			dice_3_face_4.hide()
			dice_3_face_6.hide()
		6:
			dice_3_face_6.show()
			dice_3_face_1.hide()
			dice_3_face_2.hide()
			dice_3_face_3.hide()
			dice_3_face_4.hide()
			dice_3_face_5.hide()
	return die1 + die2 + die3
	

func roll_dice_balanced_endgame()-> int:
	randomize()
	var die1 = randi() % 6 + 1
	var die2 = randi() % 6 + 1
	var die3 = randi() % 6 + 1
	var die4 = randi() % 6 + 1
	
	player_die1 = die1
	player_die2 = die2
	player_die3 = die3
	player_die4 = die4
	
	match player_die1:
		1:
			dice_1_face_1.show()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
			
		2:
			dice_1_face_2.show()
			dice_1_face_1.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
		3:
			dice_1_face_3.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
		4:
			dice_1_face_4.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_5.hide()
			dice_1_face_6.hide()
		5:
			dice_1_face_5.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_6.hide()
		6:
			dice_1_face_6.show()
			dice_1_face_1.hide()
			dice_1_face_2.hide()
			dice_1_face_3.hide()
			dice_1_face_4.hide()
			dice_1_face_5.hide()
			
	match player_die2:
		1:
			dice_2_face_1.show()
			dice_2_face_2.hide()
			dice_2_face_3.hide()
			dice_2_face_4.hide()
			dice_2_face_5.hide()
			dice_2_face_6.hide()
		2:
			dice_2_face_2.show()
			dice_2_face_1.hide()
			dice_2_face_3.hide()
			dice_2_face_4.hide()
			dice_2_face_5.hide()
			dice_2_face_6.hide()
		3:
			dice_2_face_3.show()
			dice_2_face_1.hide()
			dice_2_face_2.hide()
			dice_2_face_4.hide()
			dice_2_face_5.hide()
			dice_2_face_6.hide()
		4:
			dice_2_face_4.show()
			dice_2_face_1.hide()
			dice_2_face_2.hide()
			dice_2_face_3.hide()
			dice_2_face_5.hide()
			dice_2_face_6.hide()
		5:
			dice_2_face_5.show()
			dice_2_face_1.hide()
			dice_2_face_2.hide()
			dice_2_face_3.hide()
			dice_2_face_4.hide()
			dice_2_face_6.hide()
		6:
			dice_2_face_6.show()
			dice_2_face_1.hide()
			dice_2_face_2.hide()
			dice_2_face_3.hide()
			dice_2_face_4.hide()
			dice_2_face_5.hide()
		
	match player_die3:
		1:
			dice_3_face_1.show()
			dice_3_face_2.hide()
			dice_3_face_3.hide()
			dice_3_face_4.hide()
			dice_3_face_5.hide()
			dice_3_face_6.hide()
		2:
			dice_3_face_2.show()
			dice_3_face_1.hide()
			dice_3_face_3.hide()
			dice_3_face_4.hide()
			dice_3_face_5.hide()
			dice_3_face_6.hide()
		3:
			dice_3_face_3.show()
			dice_3_face_1.hide()
			dice_3_face_2.hide()
			dice_3_face_4.hide()
			dice_3_face_5.hide()
			dice_3_face_6.hide()
		4:
			dice_3_face_4.show()
			dice_3_face_1.hide()
			dice_3_face_2.hide()
			dice_3_face_3.hide()
			dice_3_face_5.hide()
			dice_3_face_6.hide()
		5:
			dice_3_face_5.show()
			dice_3_face_1.hide()
			dice_3_face_2.hide()
			dice_3_face_3.hide()
			dice_3_face_4.hide()
			dice_3_face_6.hide()
		6:
			dice_3_face_6.show()
			dice_3_face_1.hide()
			dice_3_face_2.hide()
			dice_3_face_3.hide()
			dice_3_face_4.hide()
			dice_3_face_5.hide()
			
	match player_die4:
		1:
			dice_4_face_1.show()
			dice_4_face_2.hide()
			dice_4_face_3.hide()
			dice_4_face_4.hide()
			dice_4_face_5.hide()
			dice_4_face_6.hide()
		2:
			dice_4_face_2.show()
			dice_4_face_1.hide()
			dice_4_face_3.hide()
			dice_4_face_4.hide()
			dice_4_face_5.hide()
			dice_4_face_6.hide()
		3:
			dice_4_face_3.show()
			dice_4_face_1.hide()
			dice_4_face_2.hide()
			dice_4_face_4.hide()
			dice_4_face_5.hide()
			dice_4_face_6.hide()
		4:
			dice_4_face_4.show()
			dice_4_face_1.hide()
			dice_4_face_2.hide()
			dice_4_face_3.hide()
			dice_4_face_5.hide()
			dice_4_face_6.hide()
		5:
			dice_4_face_5.show()
			dice_4_face_1.hide()
			dice_4_face_2.hide()
			dice_4_face_3.hide()
			dice_4_face_4.hide()
			dice_4_face_6.hide()
		6:
			dice_4_face_6.show()
			dice_4_face_1.hide()
			dice_4_face_2.hide()
			dice_4_face_3.hide()
			dice_4_face_4.hide()
			dice_4_face_5.hide()
	
	return die1 + die2 + die3 + die4
	
func roll_dice_balanced_endgame_cpu()-> int:
	randomize()
	var die1 = randi() % 6 + 1
	var die2 = randi() % 6 + 1
	var die3 = randi() % 6 + 1
	var die4 = randi() % 6 + 1
	
	cpu_die1 = die1
	cpu_die2 = die2
	cpu_die3 = die3
	cpu_die4 = die4
	
	
	match cpu_die1:
		1:
			cpu_dice_1_face_1.show()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
			
		2:
			cpu_dice_1_face_2.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
		3:
			cpu_dice_1_face_3.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
		4:
			cpu_dice_1_face_4.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_5.hide()
			cpu_dice_1_face_6.hide()
		5:
			cpu_dice_1_face_5.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_6.hide()
		6:
			cpu_dice_1_face_6.show()
			cpu_dice_1_face_1.hide()
			cpu_dice_1_face_2.hide()
			cpu_dice_1_face_3.hide()
			cpu_dice_1_face_4.hide()
			cpu_dice_1_face_5.hide()
			
	match cpu_die2:
		1:
			cpu_dice_2_face_1.show()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_5.hide()
			cpu_dice_2_face_6.hide()
		2:
			cpu_dice_2_face_2.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_5.hide()
			cpu_dice_2_face_6.hide()
		3:
			cpu_dice_2_face_3.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_5.hide()
			cpu_dice_2_face_6.hide()
		4:
			cpu_dice_2_face_4.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_5.hide()
			cpu_dice_2_face_6.hide()
		5:
			cpu_dice_2_face_5.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_6.hide()
		6:
			cpu_dice_2_face_6.show()
			cpu_dice_2_face_1.hide()
			cpu_dice_2_face_2.hide()
			cpu_dice_2_face_3.hide()
			cpu_dice_2_face_4.hide()
			cpu_dice_2_face_5.hide()
			
	match cpu_die3:
		1:
			cpu_dice_3_face_1.show()
			cpu_dice_3_face_2.hide()
			cpu_dice_3_face_3.hide()
			cpu_dice_3_face_4.hide()
			cpu_dice_3_face_5.hide()
			cpu_dice_3_face_6.hide()
		2:
			cpu_dice_3_face_2.show()
			cpu_dice_3_face_1.hide()
			cpu_dice_3_face_3.hide()
			cpu_dice_3_face_4.hide()
			cpu_dice_3_face_5.hide()
			cpu_dice_3_face_6.hide()
		3:
			cpu_dice_3_face_3.show()
			cpu_dice_3_face_1.hide()
			cpu_dice_3_face_2.hide()
			cpu_dice_3_face_4.hide()
			cpu_dice_3_face_5.hide()
			cpu_dice_3_face_6.hide()
		4:
			cpu_dice_3_face_4.show()
			cpu_dice_3_face_1.hide()
			cpu_dice_3_face_2.hide()
			cpu_dice_3_face_3.hide()
			cpu_dice_3_face_5.hide()
			cpu_dice_3_face_6.hide()
		5:
			cpu_dice_3_face_5.show()
			cpu_dice_3_face_1.hide()
			cpu_dice_3_face_2.hide()
			cpu_dice_3_face_3.hide()
			cpu_dice_3_face_4.hide()
			cpu_dice_3_face_6.hide()
		6:
			cpu_dice_3_face_6.show()
			cpu_dice_3_face_1.hide()
			cpu_dice_3_face_2.hide()
			cpu_dice_3_face_3.hide()
			cpu_dice_3_face_4.hide()
			cpu_dice_3_face_5.hide()
			
	match cpu_die4:
		1:
			cpu_dice_4_face_1.show()
			cpu_dice_4_face_2.hide()
			cpu_dice_4_face_3.hide()
			cpu_dice_4_face_4.hide()
			cpu_dice_4_face_5.hide()
			cpu_dice_4_face_6.hide()
		2:
			cpu_dice_4_face_2.show()
			cpu_dice_4_face_1.hide()
			cpu_dice_4_face_3.hide()
			cpu_dice_4_face_4.hide()
			cpu_dice_4_face_5.hide()
			cpu_dice_4_face_6.hide()
		3:
			cpu_dice_4_face_3.show()
			cpu_dice_4_face_1.hide()
			cpu_dice_4_face_2.hide()
			cpu_dice_4_face_4.hide()
			cpu_dice_4_face_5.hide()
			cpu_dice_4_face_6.hide()
		4:
			cpu_dice_4_face_4.show()
			cpu_dice_4_face_1.hide()
			cpu_dice_4_face_2.hide()
			cpu_dice_4_face_3.hide()
			cpu_dice_4_face_5.hide()
			cpu_dice_4_face_6.hide()
		5:
			cpu_dice_4_face_5.show()
			cpu_dice_4_face_1.hide()
			cpu_dice_4_face_2.hide()
			cpu_dice_4_face_3.hide()
			cpu_dice_4_face_4.hide()
			cpu_dice_4_face_6.hide()
		6:
			cpu_dice_4_face_6.show()
			cpu_dice_4_face_1.hide()
			cpu_dice_4_face_2.hide()
			cpu_dice_4_face_3.hide()
			cpu_dice_4_face_4.hide()
			cpu_dice_4_face_5.hide()
	
	return  die1 + die2 + die3 + die4






