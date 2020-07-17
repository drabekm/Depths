extends "res://Menus/Inventory/OreInfo.gd"

# Basicaly just like OreInfo node, but has buttons for selling the
# specific mineral

signal has_been_sold

func _on_ButtonSellOne_pressed():
	if PlayerData.inventory[ore_type] > 0:
		PlayerData.inventory[ore_type] -= 1
		PlayerData.money += BlockEnums.mineral_price[ore_type]
		PlayerData.capacity -= 1
		.update_count()
		emit_signal("has_been_sold")


func _on_ButtonSellAll_pressed():
	if PlayerData.inventory[ore_type] > 0:
		PlayerData.money += BlockEnums.mineral_price[ore_type] * PlayerData.inventory[ore_type]
		PlayerData.inventory[ore_type] = 0
		PlayerData.capacity = 0
		.update_count()
		emit_signal("has_been_sold")
