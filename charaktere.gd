extends Node
class_name character
#var attack: Callable
var maxhp: float
var Name: String
var damage1: float 
var attack1_element: Callable
var damage2: float
var attack2_element: Callable
var damage3: float 
var attack3_element: Callable
var element: String

var optional_ = {}
var hp: float
var actual_damage: float
var calculation_damage: float
var shield: float = 0
var poisoned: bool = false
var burned: bool = false
var lvl: int = 1
var lvl_mult : float 

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

var shield1: int = 0
var shield2: int = 0
var shield3: int = 0


#(prüfen, ob attacke ok ist)
func _init(_maxhp: float,
 _element: String,
 _damage1: float,
 _attack1_element: Callable,
 _damage2: float,
 _attack2_element: Callable,
 _damage3:float,
 _attack3_element: Callable,
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
 "lifesteal3" : 0,
 "shield1" : 0,
 "shield2" : 0,
 "shield3" : 0}) ->void:
	element = _element
	damage1 = _damage1
	attack1_element = _attack1_element
	damage2 = _damage2
	attack2_element = _attack2_element
	damage3 = _damage3
	attack3_element = _attack3_element
	maxhp = _maxhp
	Name = _Name
	hp = maxhp
	optional_ = optional 
	lvl_mult = 1 * pow(1.1, lvl - 1)
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
func fire (target_element: String):
	if target_element == "water" or "wind" or "fire":
		return(false)
	if target_element == "plant" or "ice":
		return(true)
		
func water (target_element: String):
	if target_element == "wind" or "plant" or "water":
		return(false)
	if target_element == "ice" or "fire":
		return(true)
	
func plant (target_element: String):
	if target_element == "fire" or "plant" or "ice":
		return(false)
	if target_element == "water" or "wind":
		return(true)
		
func ice (target_element: String):
	if target_element == "water" or "fire" or "ice":
		return(false)
	if target_element == "wind" or "plant":
		return(true)
		
func wind (target_element: String):
	if target_element == "wind" or "plant" or "ice":
		return(false)
	if target_element == "water" or "fire":
		return(true)


func attack1(target: character)-> void:
	if target == self:
		print("cannot attack yourself")
	else:
		self.actual_damage = self.damage1
		if attack1_element.call(target.element):
			self.actual_damage  *= 1.5
			
		if attack1_element.call(target.element) == false:
			self.actual_damage *= 0.66
			
		if gamble1:
			self.actual_damage *= randf()
			
		if shield1 != 0:
			self.shield += self.shield1
			print(self.Name, " gained a shield of ", self.shield1)
			
		if target.shield > 0:
			if actual_damage >= target.shield:
				self.actual_damage -= target.shield
				target.shield = 0
			else:
				target.shield -= self.actual_damage
				actual_damage = 0
			
		target.hp -= self.actual_damage
		
		if lifesteal1 != 0:
			self.hp += actual_damage * lifesteal1	
			
		if poison1:
			target.poisoned = true
			print(target.Name, " is now poisoned")
			
		if burn1:
			target.burned = true
			print(target.Name, "is now burned")
			
		print(self.Name," is attacking ", target.Name, " for ", self.actual_damage, " damage")
		print(target.Name, " has ", target.hp, " hp left ")
		
func attack2(target: character)-> void:
	if target == self:
		print("cannot attack yourself")
	else:
		self.actual_damage = self.damage2
		if attack2_element.call(target.element):
			self.actual_damage  *= 1.5
			
		if attack2_element.call(target.element) == false:
			self.actual_damage *= 0.66
			
		if gamble2:
			self.actual_damage *= randf()
			
		if shield2 != 0:
			self.shield += self.shield2
			print(self.Name, " gained a shield of ", self.shield1)
			
		if target.shield > 0:
			if actual_damage >= target.shield:
				self.actual_damage -= target.shield
				target.shield = 0
			else:
				target.shield -= self.actual_damage
				actual_damage = 0
				
		target.hp -= self.actual_damage
		
		if lifesteal2 != 0:
			self.hp += actual_damage * lifesteal2
			
		if poison2:
			target.poisoned = true
			print(target.name, " is now poisoned")
			
		if burn2:
			target.burned = true
			print(target.Name, "is now burned")
			
		print(self.Name, " is attacking ", target.name, " for ", self.actual_damage, " damage")
		print(target.Name, " has ", target.hp, " hp left")
		
func attack3(target: character)-> void:
	if target == self:
		print("cannot attack yourself")
	else:
		self.actual_damage = self.damage3
		
		if attack3_element.call(target.element):
			self.actual_damage  *= 1.5
			
		if attack3_element.call(target.element) == false:
			self.actual_damage *= 0.66
			
		if gamble3:
			self.actual_damage *= randf()
			
		if shield3 != 0:
			self.shield += self.shield3
			print(self.Name, " gained a shield of ", self.shield1)
			
		if target.shield > 0:
			if actual_damage >= target.shield:
				self.actual_damage -= target.shield
				target.shield = 0
			else:
				target.shield -= self.actual_damage
				actual_damage = 0
				
		target.hp -= self.actual_damage
		
		if lifesteal3 != 0:
			self.hp += actual_damage * lifesteal3
			
		if poison3:
			target.poisoned = true
			print(target.name, " is now poisoned")
			
		if burn1:
			target.burned = true
			print(target.Name, "is now burned")
			
		print(self.Name, " is attacking ", target.name, " for ", self.actual_damage, " damage")
		print(target.Name, " has ", target.hp, " hp left")

	
	
	
	
	
	
	
	
	
