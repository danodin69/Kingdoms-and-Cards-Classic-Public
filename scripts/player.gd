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

#LABELS

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
	$deck/card/KING/king_card/tomb, 
	$deck/card/SOLDIERS/soldier_card_1/tomb, 
	$deck/card/SOLDIERS/soldier_card_2/tomb, 
	$deck/card/SOLDIERS/soldier_card_3/tomb, 
	$deck/card/SOLDIERS/soldier_card_4/tomb, 
	$deck/card/SOLDIERS/soldier_card_5/tomb, 
	$deck/card/SOLDIERS/soldier_card_6/tomb, 
	$deck/card/CITIZENS/citizen_card_1/tomb, 
	$deck/card/CITIZENS/citizen_card_2/tomb, 
	$deck/card/CITIZENS/citizen_card_3/tomb
	
]
# LUCK MODE --- --- --- -- --- --- ----- --- 
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
	#LABELS
	
	#KING
	king_card_strength_label1.text = str(king_card.strength) 
	king_card_strength_label2.text = str(king_card.strength)
	
	#SOLDIER
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
	
	#CITIZENS
	citizen1_strength_card_label1.text = str(citizen_card_1.strength)
	citizen1_strength_card_label2.text = str(citizen_card_1.strength)
	
	citizen2_strength_card_label1.text = str(citizen_card_2.strength)
	citizen2_strength_card_label2.text = str(citizen_card_2.strength)
	
	citizen3_strength_card_label1.text = str(citizen_card_3.strength)
	citizen3_strength_card_label2.text = str(citizen_card_3.strength)
	

	
""" 
****** CARD TRIGGERS ******
"""
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

""" 
****** CARD PLACEMENTS ******
"""

func place_card(var data):
	arena.placed_card_player.deck_id = data.deck_id
	arena.placed_card_player.type = data.type
	arena.placed_card_player.strength = data.strength
	arena.placed_card_player.validity = data.validity
	arena.place_player_card()
	
#KING
func _on_place_king_card_button_pressed():
	place_card(king_card)
	king_card_ui.set_visible(false)

	

#SOLDIERS
func _on_place_soldier1_card_button_pressed():
	place_card(soldier_card_1)
	soldier_card_ui_1.set_visible(false)

	

func _on_place_soldier2_card_button_pressed():
	place_card(soldier_card_2)
	soldier_card_ui_2.set_visible(false)

	
func _on_place_soldier3_card_button_pressed():
	place_card(soldier_card_3)
	soldier_card_ui_3.set_visible(false)

		
func _on_place_soldier4_card_button_pressed():
	place_card(soldier_card_4)
	soldier_card_ui_4.set_visible(false)

	
func _on_place_soldier5_card_button_pressed():
	place_card(soldier_card_5)
	soldier_card_ui_5.set_visible(false)

	
func _on_place_soldier6_card_button_pressed():
	place_card(soldier_card_6)
	soldier_card_ui_6.set_visible(false)

	
#CITIZENS




func _on_place_citizen1_card_button_pressed():
	place_card(citizen_card_1)
	citizen_card_ui_1.set_visible(false)



func _on_place_citizen2_card_button_pressed():
	place_card(citizen_card_2)
	citizen_card_ui_2.set_visible(false)




func _on_place_citizen3_card_button_pressed():
	place_card(citizen_card_3)
	citizen_card_ui_3.set_visible(false)
	
func check_card_false_validity():

	if king_card.validity == false:
		tombs[0].show()

	if soldier_card_1.validity== false:
		tombs[1].show()

	if soldier_card_2.validity== false:
		tombs[2].show()

	if soldier_card_3.validity== false:
		tombs[3].show()

	if soldier_card_4.validity== false:
		tombs[4].show()

	if soldier_card_5.validity== false:
		tombs[5].show()

	if soldier_card_6.validity== false:
		tombs[6].show()

	if citizen_card_1.validity== false:
		tombs[7].show()

	if citizen_card_2.validity== false:
		tombs[8].show()

	if citizen_card_3.validity== false:
		tombs[9].show()

func check_card_true_validity():
	if king_card.validity== true:
		king_card_ui.show()


	if soldier_card_1.validity== true:
		soldier_card_ui_1.show()


	if soldier_card_2.validity== true:
		soldier_card_ui_2.show()


	if soldier_card_3.validity== true:
		soldier_card_ui_3.show()

	if soldier_card_4.validity== true:
		soldier_card_ui_4.show()


	if soldier_card_5.validity== true:
		soldier_card_ui_5.show()


	if soldier_card_6.validity== true:
		soldier_card_ui_6.show()


	if citizen_card_1.validity== true:
		citizen_card_ui_1.show()


	if citizen_card_2.validity == true:
		citizen_card_ui_2.show()


	if citizen_card_3.validity == true:
		citizen_card_ui_3.show()

func auto_place_card():
	var randomise_card_type_pick =  random_num_gen.randi() % cpu_picker.size() *1
	var pick_card_type = cpu_picker[randomise_card_type_pick]
	
	var data
	if pick_card_type == 1:
		data = king_card
	if pick_card_type == 2:
		data = cpu_deck_soldier[randi()%cpu_deck_soldier.size()*1]
	if pick_card_type == 3:
		data = cpu_deck_citizen[randi()%cpu_deck_citizen.size()*1]
	
	arena.placed_card_player.deck_id = data.deck_id
	arena.placed_card_player.type = data.type
	arena.placed_card_player.strength = data.strength
	arena.placed_card_player.validity = data.validity
	arena.place_player_card()


func _on_place_card_pressed():
	auto_place_card()
