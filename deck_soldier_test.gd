extends Node2D

var soldier = [9, 7, 5]
var random_num_gen = RandomNumberGenerator.new()

func reshuffle_soldier_deck() -> Array:
	random_num_gen.randomize()
	var new_deck = []
	var counts = {9: 0, 7: 0, 5: 0}

	for i in range(6):
		var card = soldier[random_num_gen.randi() % soldier.size()]
		if counts[card] < get_max_allowed_count(card):
			new_deck.append(card)
			counts[card] += 1
		else:
			var other_cards = []
			for x in soldier:
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
		_:
			return 0

func _ready() -> void:
	var soldier_deck = reshuffle_soldier_deck()

	var soldier_card_final = ""
	var index = 1
	for card in soldier_deck:
		soldier_card_final += "SOLDIERS CARD " + str(index) + ": " + str(card) + "\n"
		index += 1

	print(soldier_card_final)
