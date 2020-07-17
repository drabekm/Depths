extends Control

# The actuall inventory is stored as an array in the PlayerData singleton
# This is a control used to shop the invetory contents

const oreInfo = preload("res://Menus/Inventory/OreInfo.tscn")

var rows


func _ready():
	set_process_input(true)
	
	rows = get_node("CenterContainer/Rows")
	for i in PlayerData.inventory.keys():
		var oreInfoInstance = oreInfo.instance()
		oreInfoInstance.init(i)
		rows.add_child(oreInfoInstance)
	
	# moves button to the bottom of the inventory screen
	rows.move_child(get_node("CenterContainer/Rows/ExitButton"), rows.get_child_count())

func _input(event):
	if event.is_action_pressed("inventory"):
		if self.visible:
			hide()
		else:
			show()

func update_rows():
	get_node("CenterContainer/Rows/Center2/MaxCapacity").text = "Max capacity: " + str(PlayerData.max_capacity)
	get_node("CenterContainer/Rows/Center3/CurCapacity").text = "Currently used: " + str(PlayerData.capacity)
	
	for oreInfo in rows.get_children():
		if oreInfo.is_in_group("OreInfo"):
			oreInfo.update_count()

func show():
	update_rows()
	get_tree().paused = true
	self.visible = true

func hide():
	get_tree().paused = false
	self.visible = false

func _on_ExitButton_pressed():
	hide()
