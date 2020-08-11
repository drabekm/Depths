extends CenterContainer

# Stores information about one type of ore in players inventory
# It's used in the inventory controll and it's inherited by the OreShopOreInfo
# node

const ore_icons = ["res://Entities/Block/Textures/copper.png",
				"res://Entities/Block/Textures/iron.png",
				"res://Entities/Block/Textures/diamonds.png"]

const ore_names = ["ore.copper", "ore.iron", "ore.diamond"]

var ore_type: int

func init(ore_type: int):
	get_node("InfoColumns/Icon").texture = load(ore_icons[ore_type])
	get_node("InfoColumns/Text").text = ore_names[ore_type] + ": " + str(PlayerData.inventory[ore_type])
	self.ore_type = ore_type
	# TODO: ore_name resHelper

func update_count():
	get_node("InfoColumns/Text").text = ore_names[ore_type] + ": " + str(PlayerData.inventory[ore_type])
