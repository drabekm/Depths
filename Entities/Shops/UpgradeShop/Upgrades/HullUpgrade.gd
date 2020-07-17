extends "res://Entities/Shops/UpgradeShop/Upgrades/BaseUpgrade.gd"



func _init():
	descriptions = [
	"upgrade.hull.descriptiopn.type.1",
	"upgrade.hull.descriptiopn.type.2",
	"upgrade.hull.descriptiopn.type.3",
	"upgrade.hull.descriptiopn.type.4",
	"upgrade.hull.descriptiopn.type.5"
	]
	
	upgrade_values = [
	"upgrade.hull.upgrade_value.type.1",
	"upgrade.hull.upgrade_value.type.2",
	"upgrade.hull.upgrade_value.type.3",
	"upgrade.hull.upgrade_value.type.4",
	"upgrade.hull.upgrade_value.type.5"
	]
	
	textures = [
	"res://icon.png",
	"res://icon.png",
	"res://icon.png",
	"res://icon.png",
	"res://icon.png"
	]
	
	values = [120, 150, 170, 190, 250]
	prices = [200, 400, 900, 1200, 2000]

func _ready():
	get_node("Icon").texture = load(textures[type])
	get_node("Text/Description").text = descriptions[type]
	get_node("Text/UpgradeValue").text = upgrade_values[type]
	_set_buy_button_price(prices[type])
	if type > 0:
		buy_button.disabled = true

func _buy():
	._buy()
	PlayerData.max_health = values[type]
	buy_button.disabled = true
