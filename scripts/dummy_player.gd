# scripts/dummy_player.gd
extends Control


var health = 10
onready var shuffler = get_node("/root/shuffler")


onready var king_card =  {"deck_id" : "p1_kc" , "type" : "KING", "strength" : shuffler.king_card[0] , "validity" : true}

onready var soldier_card_1 =  {"deck_id" : "p1_sc1" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards[0] , "validity" : true}
onready var soldier_card_2 =  {"deck_id" : "p1_sc2" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards[1] , "validity" : true}
onready var soldier_card_3 =  {"deck_id" : "p1_sc3" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards[2] , "validity" : true}
onready var soldier_card_4 =  {"deck_id" : "p1_sc4" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards[3] , "validity" : true}
onready var soldier_card_5 =  {"deck_id" : "p1_sc5" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards[4] , "validity" : true}
onready var soldier_card_6 =  {"deck_id" : "p1_sc6" , "type" : "SOLDIER", "strength" : shuffler.soldier_cards[5] , "validity" : true}

onready var citizen_card_1 =  {"deck_id" : "p1_cc1" , "type" : "CITIZEN", "strength" : shuffler.citizen[0] , "validity" : true}
onready var citizen_card_2 =  {"deck_id" : "p1_cc2" , "type" : "CITIZEN", "strength" : shuffler.citizen[0] , "validity" : true}
onready var citizen_card_3 =  {"deck_id" : "p1_cc3" , "type" : "CITIZEN", "strength" : shuffler.citizen[0] , "validity" : true}

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


func _ready():
	pass
	
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
