extends Node

const TRANSLATION_FILE_PATH = "res://Data/translations.json"

enum Language_indexes {CZECH, ENGLISH, FRENCH}
var selected_language = Language_indexes.CZECH
var _translation_dict = {"text.hovno" : ["Hovno", "Shit", "Merde"], "text.test" : ["AA", "BB", "CC"]}

func _ready():
	Translator.selected_language = ProjectSettings.get_setting("application/config/language")
	_load_translations()

func _load_translations():
	var translation_file = File.new()
	translation_file.open(TRANSLATION_FILE_PATH, translation_file.READ)
	var json_string = translation_file.get_as_text()
	_translation_dict = JSON.parse(json_string).result

func translate(var code_name):
	if _translation_dict.has(code_name.to_lower()):
		return _translation_dict[code_name.to_lower()][selected_language]
	
	return code_name

