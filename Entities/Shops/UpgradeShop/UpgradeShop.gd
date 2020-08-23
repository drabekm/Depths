extends "res://Entities/Shops/BaseShop/BaseShop.gd"

var door_sprite: AnimatedSprite
# Shop with upgrades

func _on_ready():
	door_sprite = get_node("Building/Door")
	var upgrades = get_node("CanvasLayer/UI/CategoryUpgrades/FuelUpgrades/Upgrades").get_children()
	upgrades += get_node("CanvasLayer/UI/CategoryUpgrades/HullUpgrades/Upgrades").get_children()
	
	
	for upgrade_item in upgrades:
		upgrade_item.connect("not_enough_money", self, "_show_not_enough_money_dialog")

func _show_not_enough_money_dialog(description):
	get_node("CanvasLayer/UI/NotEnoughMoneyDialog").show()

func _close_shop():
	._close_shop()
	get_node("CanvasLayer/UI/NotEnoughMoneyDialog").hide()

func _hide_all_upgrades():
	var upgrade_lists = get_node("CanvasLayer/UI/CategoryUpgrades").get_children()
	for upgrade_list in upgrade_lists:
		upgrade_list.visible = false

func _player_entered():
	door_sprite.play("open")

func _player_left():
	door_sprite.play("close")

func _on_ButtonFuel_pressed():
	_hide_all_upgrades()
	get_node("CanvasLayer/UI/CategoryUpgrades/FuelUpgrades").visible = true

func _on_ButtonHull_pressed():
	_hide_all_upgrades()
	get_node("CanvasLayer/UI/CategoryUpgrades/HullUpgrades").visible = true

func _on_ButtonEngine_pressed():
	_hide_all_upgrades()

func _on_ButtonCargo_pressed():
	_hide_all_upgrades()

func _on_ButtonDrill_pressed():
	_hide_all_upgrades()

func _on_ButtonCooling_pressed():
	_hide_all_upgrades()
