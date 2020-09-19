extends HBoxContainer

# Base upgrade node for other upgrade nodes to inherit from
# Upgrade nodes are only used in the upgrade shop
# Each inherited upgrade node set's it's own values/prices/textures etc.

var buy_button
var info_button

export(int, 0, 4) var type

var is_bought = false

var values = []
var prices = []

var descriptions = []
var upgrade_values = []
var textures = []

signal not_enough_money(upgrade_name)

func _ready():
	buy_button = get_node("ButtonBuy")
	info_button = get_node("ButtonInfo")
	_translate_labels_and_buttons()
	buy_button.text = Translator.translate(buy_button.text)

func _translate_labels_and_buttons():
	var nodes = get_tree().get_nodes_in_group("translate")
	for node in nodes:
		if node is Label or node is Button:
			node.text = Translator.translate(node.text)

func _set_buy_button_price(price: int):
	buy_button.text += "[" + str(price) + "]"

func _on_ButtonBuy_pressed():
	_buy()

func _on_ButtonInfo_pressed():
	_showInfo()

func _buy():
	if prices[type] > PlayerData.money:
		emit_signal("not_enough_money", descriptions[type])
	else:
		buy_button.disabled = true
		PlayerData.money -= prices[type]
		_unlock_next_upgrade()

# All upgrades except the first one are initialy locked
# buying the previous upgrade unlocks the next
func _unlock_next_upgrade():
	var other_upgrades = get_parent().get_children()
	for other_upgrade in other_upgrades:
		if other_upgrade.type > self.type:
			other_upgrade.enable_buy_button()
			break

func enable_buy_button():
	buy_button.disabled = false

func _showInfo():
	pass

