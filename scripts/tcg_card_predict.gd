extends Control
class_name TCGCardPredict

@export var monster_card_amount : int = 0
@export var magic_card_amount : int = 0

@export var monster_percentage_number_progress_bar : TextureProgressBar
@export var magic_percentage_number_progress_bar : TextureProgressBar
@export var monster_percentage_number_label : Label
@export var magic_percentage_number_label : Label
@export var monster_spin_box : SpinBox
@export var magic_spin_box : SpinBox

func calculate_probabilities(monster_cards : int, magic_cards : int) -> Array:

	var total : int = monster_cards + magic_cards

	var monster_prob : float = float(monster_cards) / total
	monster_prob = snapped(monster_prob * 100, 0.1)
	var magic_prob : float = float(magic_cards) / total
	magic_prob = snapped(magic_prob * 100, 0.1)
	
	print_debug('PROBABILITIES: ', monster_prob, ' ', magic_prob)
	return [monster_prob, magic_prob]


func _on_calculate_button_pressed():
	var probabilities : Array = calculate_probabilities(monster_card_amount, magic_card_amount)
	monster_percentage_number_progress_bar.value = probabilities[0]
	magic_percentage_number_progress_bar.value = probabilities[1]
	
	monster_percentage_number_label.text = "%s" % probabilities[0] + ' %'
	magic_percentage_number_label.text = "%s" % probabilities[1] + ' %'
	


func _on_monster_spin_box_value_changed(value):
	monster_card_amount = int(value)
	_on_calculate_button_pressed()


func _on_magic_spin_box_value_changed(value):
	magic_card_amount = int(value)
	_on_calculate_button_pressed()


func _on_draw_monster_button_pressed():
	monster_spin_box.value -= 1


func _on_draw_magic_button_pressed():
	magic_spin_box.value -= 1
