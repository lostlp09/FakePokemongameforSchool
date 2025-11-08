extends Node

class_name character


#var attack: Callable
var optional1 = {}
var maxhp: float
var hp: float
var Name: String
var poisoned: bool = false
var burned: bool = false
var actual_damage: float
var damage1: float 
var damage2: float
var damage3: float
var poison1: bool = false
var poison2: bool = false
var poison3: bool = false
var burn1: bool = false
var burn2: bool = false
var burn3: bool = false
var gamble1: bool = false
var gamble2: bool = false
var gamble3: bool = false
var lifesteal1: int = 0 
var lifesteal2: int = 0 
var lifesteal3: int = 0 


#(prüfen, ob attacke ok ist)
func _init(_maxhp: float,
 _damage1: float,
 _damage2: float,
 _damage3:float,
 _Name: String,
 optional := {
 "poison1" : false, 
 "poison2" : false,
 "poison3" : false,
 "burn1" : false,
 "burn2" : false,
 "burn3" : false,
 "gamble1" : false,
 "gamble2" : false,
 "gamble3" : false,
 "lifesteal1" : 0,
 "lifesteal2" : 0,
 "lifesteal3" : 0}
) ->void:
	damage1 = _damage1
	damage2 = _damage2
	damage3 = _damage3
	maxhp = _maxhp
	Name = _Name
	hp = maxhp
	optional1 = optional 
	
	for key in optional:
		if key in self:
			set(key, optional[key])

	
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
		if gamble1 == false:
			target.hp -= self.damage1
			self.actual_damage = self.damage1
		if gamble1:
			target.hp -= self.damage1 * randf()
			self.actual_damage = self.damage1 * randf()
		if (lifesteal1 == 0) == false:
			self.hp += actual_damage * lifesteal1
		if poison1:
			target.poisoned = true
			print(target.Name, " is now poisoned")
		if burn1:
			target.burned = true
			print(target.Name, "is now poisoned")
		print(self.Name," is attacking ", target.Name, " for ", self.actual_damage, " damage")
		print(target.Name, " has ", target.hp, " hp left ")
		
func attack2(target: character)-> void:
	if target == self:
		print("cannot attack yourself")
	else:
		if gamble2 == false:
			target.hp -= self.damage2
			self.actual_damage = self.damage2
		if gamble2:
			target.hp -= self.damage2 * randf()
			self.actual_damage = self.damage2 * randf()
		if (lifesteal2 == 0) == false:
			self.hp += actual_damage * lifesteal2
		if poison2:
			target.poisoned = true
			print(target.name, " is now poisoned")
		if burn2:
			target.burned = true
			print(target.Name, "is now poisoned")
		print(self.Name, " is attacking ", target.name, " for ", self.actual_damage, " damage")
		print(target.Name, " has ", target.hp, " hp left")
		
func attack3(target: character)-> void:
	if target == self:
		print("cannot attack yourself")
	else:
		if gamble3 == false:
			target.hp -= self.damage3
			self.actual_damage = self.damage3
		if gamble3:
			target.hp -= self.damage3 * randf()
			self.actual_damage = self.damage3 * randf()
		if (lifesteal3 == 0) == false:
			self.hp += actual_damage * lifesteal3
		if poison3:
			target.poisoned = true
			print(target.name, " is now poisoned")
		if burn1:
			target.burned = true
			print(target.Name, "is now poisoned")
		print(self.Name, " is attacking ", target.name, " for ", self.actual_damage, " damage")
		print(target.Name, " has ", target.hp, " hp left")

	
	
	
	
	
	
	
	
	
