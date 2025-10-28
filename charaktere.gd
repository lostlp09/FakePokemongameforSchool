extends Node
class_name character

var hp: float
var attack: Callable
#prüfen, ob attacke ok ist
func _init(func_ref: Callable, HP: float) ->void:
	#ist func_ref ein Callable?
	assert(func_ref is Callable, "übergebener Parameter ist kein Callable")
	
	#existiert func_ref?
	assert(func_ref.is_valid, "Callable ist ungültig, verweist auf nicht existente Methode")
	
	#ist func_ref func_ref in attacks
	var obj = func_ref.get_object()
	assert(obj is attacks, "Callable keine Funktion von attacks")
	
	#ist HP float?
	assert(HP is float, "HP muss float sein")
	
	#alles stimmt
	attack = func_ref
	print("charakter erfolgreich erstellt")
	
	
	
	
