extends Node

var king = [15, 10, 12]
var soldier = [9, 7, 5]
var citizen = [11, 9, 8]

var king_cpu = [15, 10, 12]
var soldier_cpu = [9, 7, 5]
var citizen_cpu = [11, 9, 8]



var random_num_gen = RandomNumberGenerator.new()

var king_card = []
var soldier_cards = []
var citizen_cards = []

var king_card_cpu = []
var soldier_cards_cpu = []
var citizen_cards_cpu = []


func reshuffle_deck(deck: Array, maxCount: int) -> Array:
	random_num_gen.randomize()
	
	
	var new_deck = []
	var counts = {}
	
	for card in deck:
		counts[card] = 0

	for _i in range(maxCount):
		var card = deck[random_num_gen.randi() % deck.size()]
		if counts[card] < get_max_allowed_count(card):
			new_deck.append(card)
			counts[card] += 1
		else:
			var other_cards = []
			for x in deck:
				if x != card:
					other_cards.append(x)
			var other_card = other_cards[random_num_gen.randi() % other_cards.size()]
			new_deck.append(other_card)
			counts[other_card] += 1

	return new_deck

func get_max_allowed_count(card: int) -> int:
	match card:
		9:
			return 2
		7:
			return 3
		5:
			return 4
		15:
			return 1
		12:
			return 1
		10:
			return 1
		8:
			return 3
		11:
			return 3
		_:
			return 0

func _ready() -> void:
	
	shuffle_and_distribute_cards()
	
func shuffle_and_distribute_cards():
	var soldier_deck = reshuffle_deck(soldier, 6)
	var king_deck = reshuffle_deck(king, 1)
	var citizen_deck = reshuffle_deck(citizen, 3)
	
	var soldier_deck_cpu = reshuffle_deck(soldier_cpu, 6)
	var king_deck_cpu = reshuffle_deck(king_cpu, 1)
	var citizen_deck_cpu = reshuffle_deck(citizen_cpu, 3)
	
	
	king_card.clear()
	soldier_cards.clear()
	citizen_cards.clear()
	
	king_card_cpu.clear()
	soldier_cards_cpu.clear()
	citizen_cards_cpu.clear()
	
	for card in king_deck:
		king_card.append(card)
		
	
	for card in soldier_deck:
		soldier_cards.append(card)

	
	for card in citizen_deck:
		citizen_cards.append(card)
		
	for card in king_deck_cpu:
		king_card_cpu.append(card)
		
	
	for card in soldier_deck_cpu:
		soldier_cards_cpu.append(card)

	
	for card in citizen_deck_cpu:
		citizen_cards_cpu.append(card)
	
#	print('player- Cards and Strength')
#	print('KING ', king_card)
#	print('SOLDIERS ', soldier_cards)
#	print('CITIZENS ', citizen_cards)
#
	print('cpu- Cards and Strength')
	print('KING ', king_card_cpu)
	print('SOLDIERS ', soldier_cards_cpu)
	print('CITIZENS ', citizen_cards_cpu)
