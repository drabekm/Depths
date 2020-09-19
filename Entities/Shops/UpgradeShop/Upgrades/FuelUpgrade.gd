extends "res://Entities/Shops/UpgradeShop/Upgrades/BaseUpgrade.gd"

# Fuel upgrades used in the upgrade shop

func _init():
	 descriptions = [
	"upgrade.fuel.description.type.1",
	"upgrade.fuel.description.type.2",
	"upgrade.fuel.description.type.3",
	"upgrade.fuel.description.type.4",
	"upgrade.fuel.description.type.5"
	]
	
	 upgrade_values = [
	"upgrade.fuel.upgrade_value.type.1",
	"upgrade.fuel.upgrade_value.type.2",
	"upgrade.fuel.upgrade_value.type.3",
	"upgrade.fuel.upgrade_value.type.4",
	"upgrade.fuel.upgrade_value.type.5"
	]
	
	 textures = [
	"res://icon.png",
	"res://icon.png",
	"res://icon.png",
	"res://icon.png",
	"res://icon.png"
	]
	 values = [30, 45, 65, 80, 100]
	 prices = [300, 500, 1000, 1500, 3000]


func _ready():
	get_node("Icon").texture = load(textures[type])
	get_node("Text/Description").text = descriptions[type]
	get_node("Text/UpgradeValue").text = upgrade_values[type]
	_set_buy_button_price(prices[type])
	if type > 0: # All upgrades except the first one are disabled at first
		buy_button.disabled = true

func _buy():
	._buy()
	
	PlayerData.max_fuel = values[type]
	
