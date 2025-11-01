extends Node
class_name character
#var attack: Callable
var hp: float
var Name: String
var poisoned: bool = false
var damadge1: float 
var poison1: bool = false
var damadge2: float
var poison2: bool = false

#(prüfen, ob attacke ok ist)
func _init(_hp: float, _damadge1: float, _damadge2: float, _Name: String, _poison2 = false) ->void:
	damadge1 = _damadge1
	damadge2 = _damadge2
	hp = _hp
	Name = _Name
	poison2 = _poison2
	
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


func attack1(target: character)-> void:
	if target == self:
		print("cannot attack yourself")
	else:
		target.hp -= self.damadge1
		if poison1:
			target.poisoned = true
			print(target.Name,)
		print(self.Name," is attacking ", target.Name, " for ", self.damadge1, " damadge")
		print(target.Name, " has ", target.hp, " hp left ")
func attack2(target: character)-> void:
	if target == self:
		print("cannot attack yourself")
	else:
		target.hp -= self.damadge2
		if poison2:
			target.poisoned = true
		print(self.Name, " is attacking ", target.name, " for ", self.damadge2, " damadge")
		print(target.name, " has ", target,hp, " hp left")
	
	
	
	
