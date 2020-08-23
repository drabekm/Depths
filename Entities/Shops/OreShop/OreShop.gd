extends "res://Entities/Shops/BaseShop/BaseShop.gd"

#Shop that buys ores

const oreInfo = preload("res://Entities/Shops/OreShop/OreShopOreInfo.tscn")

var inventory_rows

func _ready():
	inventory_rows = get_node("CanvasLayer/UI/Inventory")
	_load_ores()

func _load_ores():
	for i in PlayerData.inventory.keys():
		var oreInfoInstance = oreInfo.instance()
		oreInfoInstance.connect("has_been_sold", self, "_update_stats")
		oreInfoInstance.init(i)
		inventory_rows.add_child(oreInfoInstance)

func _update_inventory_rows():
	for oreInfo in inventory_rows.get_children():
		if oreInfo.is_in_group("OreInfo"):
			oreInfo.update_count()

func _open_shop():
	._open_shop()
	_update_inventory_rows()
	_update_stats()


func _player_entered():
	get_node("Building").play("player_near")

func _player_left():
	get_node("Building").play("idle")

func _update_stats():
	print("update")
	get_node("CanvasLayer/UI/Stats/Money").text = "Money: " + str(PlayerData.money)
	get_node("CanvasLayer/UI/Stats/Inventory").text = str(PlayerData.capacity) + "/" + str(PlayerData.max_capacity)


func _on_ButtonSellAll_pressed():
	for i in range(len(PlayerData.inventory)):
		PlayerData.money += BlockEnums.mineral_price[i] * PlayerData.inventory[i]
		PlayerData.inventory[i] = 0
		PlayerData.capacity = 0
	_update_inventory_rows()
	_update_stats()

func _on_ButtonExit_pressed():
	._close_shop()
