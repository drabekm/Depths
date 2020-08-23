extends CanvasLayer

var health_bar: TextureProgress
var fuel_bar: TextureProgress
var capacity_bar: TextureProgress

var depth_label: Label
var score_label: Label
var money_label: Label

func _ready():
	health_bar = get_node("HUDRoot/TopValueSliders/Health/HealthBar")
	fuel_bar = get_node("HUDRoot/TopValueSliders/Fuel/FuelBar")
	capacity_bar = get_node("HUDRoot/CapacitySlider/CapacityBar")
	
	depth_label = get_node("HUDRoot/TopValueTexts/DepthLabelPair/Depth")
	score_label = get_node("HUDRoot/ScoreLabelPair/Score")
	money_label = get_node("HUDRoot/TopValueTexts/MoneyLabelPair/Money")
	set_process(true)

func _process(delta):
	print(MenuStatus.shop_opened)
	if MenuStatus.shop_opened or MenuStatus.inventory_opened or MenuStatus.pause_menu_opened or MenuStatus.game_over_opened:
		get_node("HUDRoot").visible = false
		print("not visible")
	else:
		get_node("HUDRoot").visible = true
		print("visible")
	
	health_bar.value = PlayerData.health
	health_bar.max_value = PlayerData.max_health
	
	fuel_bar.value = PlayerData.fuel
	fuel_bar.max_value = PlayerData.max_fuel
	
	capacity_bar.value = PlayerData.capacity
	capacity_bar.max_value = PlayerData.max_capacity
	
#	get_node("HUDRoot/ValueTexts").set_size(get_node("HUDRoot/ValueTexts").get_minimum_size())
	depth_label.text = str(floor((PlayerData.position.y) / (GlobalMapData.BLOCK_SIZE * 2)) + 1) + " m"
	score_label.text = str(PlayerData.score)
	money_label.text = str(PlayerData.money)
	
