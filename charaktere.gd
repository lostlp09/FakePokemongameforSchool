extends Node
class_name character

var hp: float
var damadge: float
var poison: bool
var Name: String
#var attack: Callable
#prüfen, ob attacke ok ist
func _init(_hp: float, _damadge:float, _Name:String) ->void:
	hp = _hp
	damadge = _damadge
	Name = _Name
	#ist func_ref ein Callable?
	#assert(func_ref is Callable, "übergebener Parameter ist kein Callable")
	
	#existiert func_ref?
	#assert(func_ref.is_valid, "Callable ist ungültig, verweist auf nicht existente Methode")
	
	#ist func_ref func_ref in attacks
	#var obj = func_ref.get_object()
	#assert(obj is attacks, "Callable keine Funktion von attacks")
	
	#ist HP float?
	#assert(HP is float, "HP muss float sein")
	
	#alles stimmt
	#attack = func_ref
	#print("charakter erfolgreich erstellt")
func attack(target: character)->void:
	if target == self:
		print("cannot attack yourself")
		pass
	else:
		print(self.Name, " is attacking ", target.Name, " for ", self.damadge, " damadge")
		target.hp -= damadge
	
	
	
	
	
	
	
	
	
