extends Control

var selectedEnglish: bool = true
var main_menu 
var exit = false

func _ready():
	$Transitioner.open()
	$AnimationPlayer.play("Text")
	main_menu = load("res://Menus/MainMenu/MainMenu.tscn")

func _on_EnglishButton_button_down():
	$AudioStreamPlayer.play()
	$MarginContainer/VBoxContainer/LanguageSelect/Buttons/Czech/CzechButton.pressed = false
	selectedEnglish = true
	$MarginContainer/VBoxContainer/WelcomeMessage.text = "Welcome to Depths!\nI made this game because I enjoyed playing games like Mars Miner as a kid. I loved the destructable terrain, this was in a time before minecraft so something like that felt really unique.  So I decied to make my own version of it. It's probably not the best, but I had fun while making it\n\nWhen I started  I felt really confident that I would finish it and be able to put in all the features I wanted. I keep telling myself this lie and every time I start to believe it. In fact I feel like this is just about 60 % finished. Maybe I'll finish it before the next summer competition start.\n\nEnjoy!"
	$MarginContainer/VBoxContainer/LanguageSelect/Buttons/Czech/CzechLable.text = "Czech"
	$MarginContainer/VBoxContainer/LanguageSelect/Buttons/English/EnglishLabel.text = "English"
	$MarginContainer/VBoxContainer/LanguageSelect/LanguageLabel.text = "Select language"
	$MarginContainer/VBoxContainer/Button.text = "Start the game"


func _on_CzechButton_button_down():
	$AudioStreamPlayer.play()
	$MarginContainer/VBoxContainer/LanguageSelect/Buttons/English/EnglishButton.pressed = false
	selectedEnglish = false 
	$MarginContainer/VBoxContainer/WelcomeMessage.text = "Vítejte ve hře Depths!\nTuhle hřu jsem vytvořil, protože jako malého mě hrozně bavili hry jako Mars Miner a podobné. Moc se mi líbilo ničitelné prostřední což mi v době před minecraftem přišlo celkem unikátní. Takže jsem se rozhodl udělat vlastní verzi, rozhodně není nejlepší ale tady šlo spíš o zábavu z toho ji vytvářet.\n\nZezačátku jsem věřil, že všechno stihnu, a že přidám každou věc co jsem plánoval. Tuhle lež si říkám pokaždé když něco dělám a skoro vždy to nějak selže. Hra je hotová možná tak ze 60 % třeba ji dodělám než začne další letní soutěž.\n\nTak si to užijte!"
	$MarginContainer/VBoxContainer/LanguageSelect/Buttons/Czech/CzechLable.text = "Česky"
	$MarginContainer/VBoxContainer/LanguageSelect/Buttons/English/EnglishLabel.text = "Anglicky"
	$MarginContainer/VBoxContainer/LanguageSelect/LanguageLabel.text = "Vyberte jazyk"
	$MarginContainer/VBoxContainer/Button.text = "Začít hru"


func _on_Button_pressed():
	exit = true
	$AudioStreamPlayer.play()
	if selectedEnglish:
		Translator.selected_language = Translator.Language_indexes.ENGLISH
		ProjectSettings.set_setting("application/config/language", Translator.Language_indexes.ENGLISH)
	else:
		Translator.selected_language = Translator.Language_indexes.CZECH
		ProjectSettings.set_setting("application/config/language", Translator.Language_indexes.CZECH)
	$Transitioner.close()
	


func _on_Transitioner_transition_finished():
	if exit:
		ProjectSettings.set_setting("application/config/firststart", false)
		get_tree().change_scene_to(main_menu)
