extends Control

onready var arena = get_parent()
onready var health = 10
onready var shuffler = get_node("/root/shuffler")
var random_num_gen = RandomNumberGenerator.new()


onready var king_card =  {"deck_id" : "c1_kc" , "type" : "KING", "strength" : shuffler.king_card_cpu[0] , "validity" : true}

onready var soldier_card_1 =  {"deck_id" : "c1_sc1" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards_cpu[0] , "validity" : true}
onready var soldier_card_2 =  {"deck_id" : "c1_sc2" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards_cpu[1] , "validity" : true}
onready var soldier_card_3 =  {"deck_id" : "c1_sc3" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards_cpu[2] , "validity" : true}
onready var soldier_card_4 =  {"deck_id" : "c1_sc4" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards_cpu[3] , "validity" : true}
onready var soldier_card_5 =  {"deck_id" : "c1_sc5" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards_cpu[4] , "validity" : true}
onready var soldier_card_6 =  {"deck_id" : "c1_sc6" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards_cpu[5] , "validity" : true}

onready var citizen_card_1 =  {"deck_id" : "c1_cc1" , "type" : "CITIZEN", "strength" : shuffler.citizen_cards_cpu[0] , "validity" : true}
onready var citizen_card_2 =  {"deck_id" : "c1_cc2" , "type" : "CITIZEN", "strength" : shuffler.citizen_cards_cpu[1] , "validity" : true}
onready var citizen_card_3 =  {"deck_id" : "c1_cc3" , "type" : "CITIZEN", "strength" : shuffler.citizen_cards_cpu[2] , "validity" : true}



# CPU MIND

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




func _ready():
	random_num_gen.randomize()
""" 
****** CARD PLACEMENTS ******
"""

#func getRandomCardType():
#	randomize()
#	var randomise_card_type_pick = cpu_picker[randi() % cpu_picker.size()*1]

func place_card():
	random_num_gen.randomize()
	
	var randomise_card_type_pick =  random_num_gen.randi() % cpu_picker.size() *1
	var pick_card_type = cpu_picker[randomise_card_type_pick]
	
	var data
	print("ANOTHER ROUND PICK: ", pick_card_type)
	if pick_card_type == 1:
		data = king_card
	if pick_card_type == 2:
		data = cpu_deck_soldier[randi()%cpu_deck_soldier.size()*1]
	if pick_card_type == 3:
		data = cpu_deck_citizen[randi()%cpu_deck_citizen.size()*1]
	
	arena.placed_card_cpu.deck_id = data.deck_id
	arena.placed_card_cpu.type = data.type
	arena.placed_card_cpu.strength = data.strength
	arena.placed_card_cpu.validity = data.validity
	
	arena.place_cpu_card()
	
#	if data.type == "KING"||data.type == "CITIZEN":
#		arena.roll_dice_standard()
#		print(arena.roll_dice_standard_cpu())
#		print("die1 : ",arena.cpu_die1)
#		print("die2 : ",arena.cpu_die2)
#	else:
#		arena.roll_dice_balanced_cpu()
#		print("die1 : ",arena.cpu_die1)
#		print("die2 : ",arena.cpu_die2)
#		print("die3 : ",arena.cpu_die3)
	
