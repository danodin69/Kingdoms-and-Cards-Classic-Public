#scripts/player.gd
extends Control

onready var arena = get_parent()
onready var health = 10
onready var shuffler = get_node("/root/shuffler")


onready var king_card =  {"deck_id" : "p1_kc" , "type" : "KING", "strength" : shuffler.king_card[0] , "validity" : true}

onready var soldier_card_1 =  {"deck_id" : "p1_sc1" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards[0] , "validity" : true}
onready var soldier_card_2 =  {"deck_id" : "p1_sc2" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards[1] , "validity" : true}
onready var soldier_card_3 =  {"deck_id" : "p1_sc3" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards[2] , "validity" : true}
onready var soldier_card_4 =  {"deck_id" : "p1_sc4" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards[3] , "validity" : true}
onready var soldier_card_5 =  {"deck_id" : "p1_sc5" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards[4] , "validity" : true}
onready var soldier_card_6 =  {"deck_id" : "p1_sc6" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards[5] , "validity" : true}

onready var citizen_card_1 =  {"deck_id" : "p1_cc1" , "type" : "CITIZEN", "strength" : shuffler.citizen_cards[0] , "validity" : true}
onready var citizen_card_2 =  {"deck_id" : "p1_cc2" , "type" : "CITIZEN", "strength" : shuffler.citizen_cards[1] , "validity" : true}
onready var citizen_card_3 =  {"deck_id" : "p1_cc3" , "type" : "CITIZEN", "strength" : shuffler.citizen_cards[2] , "validity" : true}


onready var place_king_card_ui = $deck/card/KING/king_card/place_card_trigger/place_card_ui
onready var place_soldier_card_ui_1 = $deck/card/SOLDIERS/soldier_card_1/place_card_trigger/place_card_ui
onready var place_soldier_card_ui_2 = $deck/card/SOLDIERS/soldier_card_2/place_card_trigger/place_card_ui
onready var place_soldier_card_ui_3 = $deck/card/SOLDIERS/soldier_card_3/place_card_trigger/place_card_ui
onready var place_soldier_card_ui_4 = $deck/card/SOLDIERS/soldier_card_4/place_card_trigger/place_card_ui
onready var place_soldier_card_ui_5 = $deck/card/SOLDIERS/soldier_card_5/place_card_trigger/place_card_ui
onready var place_soldier_card_ui_6 = $deck/card/SOLDIERS/soldier_card_6/place_card_trigger/place_card_ui
onready var place_citizen_card_ui_1 = $deck/card/CITIZENS/citizen_card_1/place_card_trigger/place_card_ui
onready var place_citizen_card_ui_2 = $deck/card/CITIZENS/citizen_card_2/place_card_trigger/place_card_ui
onready var place_citizen_card_ui_3 = $deck/card/CITIZENS/citizen_card_3/place_card_trigger/place_card_ui

onready var king_card_strength_label1 = $deck/card/KING/king_card/strength_label_1
onready var king_card_strength_label2 = $deck/card/KING/king_card/strength_label_2
onready var soldier1_strength_card_label1 = $deck/card/SOLDIERS/soldier_card_1/strength_label_1
onready var soldier1_strength_card_label2 = $deck/card/SOLDIERS/soldier_card_1/strength_label_2
onready var soldier2_strength_card_label1 = $deck/card/SOLDIERS/soldier_card_2/strength_label_1
onready var soldier2_strength_card_label2 = $deck/card/SOLDIERS/soldier_card_2/strength_label_2
onready var soldier3_strength_card_label1 = $deck/card/SOLDIERS/soldier_card_3/strength_label_1
onready var soldier3_strength_card_label2 = $deck/card/SOLDIERS/soldier_card_3/strength_label_2
onready var soldier4_strength_card_label1 = $deck/card/SOLDIERS/soldier_card_4/strength_label_1
onready var soldier4_strength_card_label2 = $deck/card/SOLDIERS/soldier_card_4/strength_label_2
onready var soldier5_strength_card_label1 = $deck/card/SOLDIERS/soldier_card_5/strength_label_1
onready var soldier5_strength_card_label2 = $deck/card/SOLDIERS/soldier_card_5/strength_label_2
onready var soldier6_strength_card_label1 = $deck/card/SOLDIERS/soldier_card_6/strength_label_1
onready var soldier6_strength_card_label2 = $deck/card/SOLDIERS/soldier_card_6/strength_label_2
onready var citizen1_strength_card_label1 = $deck/card/CITIZENS/citizen_card_1/strength_label_1
onready var citizen1_strength_card_label2 = $deck/card/CITIZENS/citizen_card_1/strength_label_2
onready var citizen2_strength_card_label1 = $deck/card/CITIZENS/citizen_card_2/strength_label_1
onready var citizen2_strength_card_label2 = $deck/card/CITIZENS/citizen_card_2/strength_label_2
onready var citizen3_strength_card_label1 = $deck/card/CITIZENS/citizen_card_3/strength_label_1
onready var citizen3_strength_card_label2 = $deck/card/CITIZENS/citizen_card_3/strength_label_2

onready var king_card_ui = $deck/card/KING/king_card
onready var soldier_card_ui_1 = $deck/card/SOLDIERS/soldier_card_1
onready var soldier_card_ui_2 = $deck/card/SOLDIERS/soldier_card_2
onready var soldier_card_ui_3 = $deck/card/SOLDIERS/soldier_card_3
onready var soldier_card_ui_4 = $deck/card/SOLDIERS/soldier_card_4
onready var soldier_card_ui_5 = $deck/card/SOLDIERS/soldier_card_5
onready var soldier_card_ui_6 = $deck/card/SOLDIERS/soldier_card_6
onready var citizen_card_ui_1 = $deck/card/CITIZENS/citizen_card_1
onready var citizen_card_ui_2 = $deck/card/CITIZENS/citizen_card_2
onready var citizen_card_ui_3 = $deck/card/CITIZENS/citizen_card_3

onready var tombs = [
	$deck/tomb/tomb,    # Index 0 King
	$deck/tomb/tomb2,   # Index 1 Soldier Card 1
	$deck/tomb/tomb3,   # Index 2 Soldier Card 2
	$deck/tomb/tomb4,   # Index 3 Soldier Card 3
	$deck/tomb/tomb5,   # Index 4 Soldier Card 4
	$deck/tomb/tomb6,   # Index 5 Soldier Card 6
	$deck/tomb/tomb7,   # Index 6 Soldier Card 5
	$deck/tomb/tomb8,   # Index 7 Citzen 1
	$deck/tomb/tomb9,   # Index 8 Citzen 2
	$deck/tomb/tomb10   # Index 9 Citzen 3
]



onready var cpu_picker = [1, 2, 3] 
onready var cpu_deck_king = [king_card]
onready var cpu_deck_soldier = [
	soldier_card_1,
	soldier_card_2,
	soldier_card_3,
	soldier_card_4,
	soldier_card_5,
	soldier_card_6,
]
onready var cpu_deck_citizen = [
	citizen_card_1,
	citizen_card_2,
	citizen_card_3
]

onready var random_num_gen = RandomNumberGenerator.new()

func _ready():
	random_num_gen.randomize()


	king_card_strength_label1.text = str(king_card.strength)
	king_card_strength_label2.text = str(king_card.strength)

	soldier1_strength_card_label1.text = str(soldier_card_1.strength)
	soldier1_strength_card_label2.text = str(soldier_card_1.strength)

	soldier2_strength_card_label1.text = str(soldier_card_2.strength)
	soldier2_strength_card_label2.text = str(soldier_card_2.strength)

	soldier3_strength_card_label1.text = str(soldier_card_3.strength)
	soldier3_strength_card_label2.text = str(soldier_card_3.strength)

	soldier4_strength_card_label1.text = str(soldier_card_4.strength)
	soldier4_strength_card_label2.text = str(soldier_card_4.strength)

	soldier5_strength_card_label1.text = str(soldier_card_5.strength)
	soldier5_strength_card_label2.text = str(soldier_card_5.strength)

	soldier6_strength_card_label1.text = str(soldier_card_6.strength)
	soldier6_strength_card_label2.text = str(soldier_card_6.strength)

	citizen1_strength_card_label1.text = str(citizen_card_1.strength)
	citizen1_strength_card_label2.text = str(citizen_card_1.strength)

	citizen2_strength_card_label1.text = str(citizen_card_2.strength)
	citizen2_strength_card_label2.text = str(citizen_card_2.strength)

	citizen3_strength_card_label1.text = str(citizen_card_3.strength)
	citizen3_strength_card_label2.text = str(citizen_card_3.strength)


func _on_place_card_trigger_pressed():
	place_king_card_ui.show()

func _on_cancel_card_button_pressed():
	place_king_card_ui.hide()

func _on_place_card_trigger_soldier_card_1_pressed():
	place_soldier_card_ui_1.show()

func _on_cancel_card_button_soldier_1_pressed():
	place_soldier_card_ui_1.hide()

func _on_place_card_trigger_soldier_card_2_pressed():
	place_soldier_card_ui_2.show()

func _on_cancel_card_button_soldier_2_pressed():
	place_soldier_card_ui_2.hide()

func _on_place_card_trigger_soldier_card_3_pressed():
	place_soldier_card_ui_3.show()

func _on_cancel_card_button_soldier_3_pressed():
	place_soldier_card_ui_3.hide()

func _on_place_card_trigger_soldier_card_4_pressed():
	place_soldier_card_ui_4.show()

func _on_cancel_card_button_soldier_4_pressed():
	place_soldier_card_ui_4.hide()

func _on_place_card_trigger_soldier_card_5_pressed():
	place_soldier_card_ui_5.show()

func _on_cancel_card_button_soldier_5_pressed():
	place_soldier_card_ui_5.hide()

func _on_place_card_trigger_soldier_card_6_pressed():
	place_soldier_card_ui_6.show()

func _on_cancel_card_button_soldier_6_pressed():
	place_soldier_card_ui_6.hide()

func _on_place_card_trigger_civilian_card_1_pressed():
	place_citizen_card_ui_1.show()

func _on_cancel_card_button_civilian_1_pressed():
	place_citizen_card_ui_1.hide()

func _on_place_card_trigger_civilian_card_2_pressed():
	place_citizen_card_ui_2.show()

func _on_cancel_card_button_civilian_2_pressed():
	place_citizen_card_ui_2.hide()

func _on_place_card_trigger_civilian_card_3_pressed():
	place_citizen_card_ui_3.show()

func _on_cancel_card_button_civilian_3_pressed():
	place_citizen_card_ui_3.hide()


func place_card(data):

	if data.deck_id == king_card.deck_id:
		king_card.validity = false
	elif data.deck_id == soldier_card_1.deck_id:
		soldier_card_1.validity = false
	elif data.deck_id == soldier_card_2.deck_id:
		soldier_card_2.validity = false
	elif data.deck_id == soldier_card_3.deck_id:
		soldier_card_3.validity = false
	elif data.deck_id == soldier_card_4.deck_id:
		soldier_card_4.validity = false
	elif data.deck_id == soldier_card_5.deck_id:
		soldier_card_5.validity = false
	elif data.deck_id == soldier_card_6.deck_id:
		soldier_card_6.validity = false
	elif data.deck_id == citizen_card_1.deck_id:
		citizen_card_1.validity = false
	elif data.deck_id == citizen_card_2.deck_id:
		citizen_card_2.validity = false
	elif data.deck_id == citizen_card_3.deck_id:
		citizen_card_3.validity = false

	arena.placed_card_player.deck_id = data.deck_id
	arena.placed_card_player.type = data.type
	arena.placed_card_player.strength = data.strength

	if data.deck_id == king_card.deck_id:
		arena.placed_card_player.validity = king_card.validity
	elif data.deck_id == soldier_card_1.deck_id:
		arena.placed_card_player.validity = soldier_card_1.validity
	elif data.deck_id == soldier_card_2.deck_id:
		arena.placed_card_player.validity = soldier_card_2.validity
	elif data.deck_id == soldier_card_3.deck_id:
		arena.placed_card_player.validity = soldier_card_3.validity
	elif data.deck_id == soldier_card_4.deck_id:
		arena.placed_card_player.validity = soldier_card_4.validity
	elif data.deck_id == soldier_card_5.deck_id:
		arena.placed_card_player.validity = soldier_card_5.validity
	elif data.deck_id == soldier_card_6.deck_id:
		arena.placed_card_player.validity = soldier_card_6.validity
	elif data.deck_id == citizen_card_1.deck_id:
		arena.placed_card_player.validity = citizen_card_1.validity
	elif data.deck_id == citizen_card_2.deck_id:
		arena.placed_card_player.validity = citizen_card_2.validity
	elif data.deck_id == citizen_card_3.deck_id:
		arena.placed_card_player.validity = citizen_card_3.validity

	arena.place_player_card()

	
	var ui_to_hide = null
	if data.deck_id == king_card.deck_id:
		ui_to_hide = king_card_ui
	elif data.deck_id == soldier_card_1.deck_id:
		ui_to_hide = soldier_card_ui_1
	elif data.deck_id == soldier_card_2.deck_id:
		ui_to_hide = soldier_card_ui_2
	elif data.deck_id == soldier_card_3.deck_id:
		ui_to_hide = soldier_card_ui_3
	elif data.deck_id == soldier_card_4.deck_id:
		ui_to_hide = soldier_card_ui_4
	elif data.deck_id == soldier_card_5.deck_id:
		ui_to_hide = soldier_card_ui_5
	elif data.deck_id == soldier_card_6.deck_id:
		ui_to_hide = soldier_card_ui_6
	elif data.deck_id == citizen_card_1.deck_id:
		ui_to_hide = citizen_card_ui_1
	elif data.deck_id == citizen_card_2.deck_id:
		ui_to_hide = citizen_card_ui_2
	elif data.deck_id == citizen_card_3.deck_id:
		ui_to_hide = citizen_card_ui_3

	if ui_to_hide:
		ui_to_hide.set_visible(false)

func _on_place_king_card_button_pressed():
	place_card(king_card)
	place_king_card_ui.hide() 

func _on_place_soldier1_card_button_pressed():
	place_card(soldier_card_1)
	place_soldier_card_ui_1.hide() 

func _on_place_soldier2_card_button_pressed():
	place_card(soldier_card_2)
	place_soldier_card_ui_2.hide() 

func _on_place_soldier3_card_button_pressed():
	place_card(soldier_card_3)
	place_soldier_card_ui_3.hide() 

func _on_place_soldier4_card_button_pressed():
	place_card(soldier_card_4)
	place_soldier_card_ui_4.hide() 

func _on_place_soldier5_card_button_pressed():
	place_card(soldier_card_5)
	place_soldier_card_ui_5.hide() 

func _on_place_soldier6_card_button_pressed():
	place_card(soldier_card_6)
	place_soldier_card_ui_6.hide() 

func _on_place_citizen1_card_button_pressed():
	place_card(citizen_card_1)
	place_citizen_card_ui_1.hide() 

func _on_place_citizen2_card_button_pressed():
	place_card(citizen_card_2)
	place_citizen_card_ui_2.hide() 

func _on_place_citizen3_card_button_pressed():
	place_card(citizen_card_3)
	place_citizen_card_ui_3.hide() 


func check_card_false_validity():
	if king_card.validity == false:
		tombs[0].show() # King
	if soldier_card_1.validity == false:
		tombs[1].show() # Soldier Card 1
	if soldier_card_2.validity == false:
		tombs[2].show() # Soldier Card 2
	if soldier_card_3.validity == false:
		tombs[3].show() # Soldier Card 3
	if soldier_card_4.validity == false:
		tombs[4].show() # Soldier Card 4
	if soldier_card_6.validity == false:
		tombs[5].show()
	if soldier_card_5.validity == false: 
		tombs[6].show()
	if citizen_card_1.validity == false:
		tombs[7].show() # Citizen Card 1
	if citizen_card_2.validity == false:
		tombs[8].show() # Citizen Card 2
	if citizen_card_3.validity == false:
		tombs[9].show() # Citizen Card 3

func check_card_true_validity():
	if king_card.validity == true:
		king_card_ui.show()
	if soldier_card_1.validity == true:
		soldier_card_ui_1.show()
	if soldier_card_2.validity == true:
		soldier_card_ui_2.show()
	if soldier_card_3.validity == true:
		soldier_card_ui_3.show()
	if soldier_card_4.validity == true:
		soldier_card_ui_4.show()
	if soldier_card_5.validity == true:
		soldier_card_ui_5.show()
	if soldier_card_6.validity == true:
		soldier_card_ui_6.show()
	if citizen_card_1.validity == true:
		citizen_card_ui_1.show()
	if citizen_card_2.validity == true:
		citizen_card_ui_2.show()
	if citizen_card_3.validity == true:
		citizen_card_ui_3.show()



func auto_place_card():

	var available_king_cards = []
	var available_soldier_cards = []
	var available_citizen_cards = []


	if king_card.validity:
		available_king_cards.append(king_card)
	if soldier_card_1.validity:
		available_soldier_cards.append(soldier_card_1)
	if soldier_card_2.validity:
		available_soldier_cards.append(soldier_card_2)
	if soldier_card_3.validity:
		available_soldier_cards.append(soldier_card_3)
	if soldier_card_4.validity:
		available_soldier_cards.append(soldier_card_4)
	if soldier_card_5.validity:
		available_soldier_cards.append(soldier_card_5)
	if soldier_card_6.validity:
		available_soldier_cards.append(soldier_card_6)
	if citizen_card_1.validity:
		available_citizen_cards.append(citizen_card_1)
	if citizen_card_2.validity:
		available_citizen_cards.append(citizen_card_2)
	if citizen_card_3.validity:
		available_citizen_cards.append(citizen_card_3)

	
	var available_types = []
	if not available_king_cards.empty():
		available_types.append(0) 
	if not available_soldier_cards.empty():
		available_types.append(1) 
	if not available_citizen_cards.empty():
		available_types.append(2) 

	if available_types.empty():
		print("Error: No valid cards left for auto placement!")
		return 

	var chosen_type_index = available_types[random_num_gen.randi() % available_types.size()]


	var chosen_card_data = null
	if chosen_type_index == 0 and not available_king_cards.empty():
		chosen_card_data = available_king_cards[randi() % available_king_cards.size()]
	elif chosen_type_index == 1 and not available_soldier_cards.empty():
		chosen_card_data = available_soldier_cards[randi() % available_soldier_cards.size()]
	elif chosen_type_index == 2 and not available_citizen_cards.empty():
		chosen_card_data = available_citizen_cards[randi() % available_citizen_cards.size()]


	if chosen_card_data:
		place_card(chosen_card_data) 



func _on_place_card_pressed():
	auto_place_card()
