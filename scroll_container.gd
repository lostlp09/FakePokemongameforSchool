extends ScrollContainer

@export var is_on = false
@onready var pokemonskizze =  $"../../Storage/pokemonbild"
var isonpokemon = true







# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func ifis_on() ->void:
	print("yo")
	isonpokemon = true	
	var anzahl = 0
	
	var X_pos = 20
	var Y_pos = 20
	
	var Startposplaced =  false
	var oldpos = Vector2(20,20)
	for i in Savestats.pokemons:
		anzahl += 1
		if anzahl == 6:
			anzahl = 1
			Y_pos += 60
			X_pos = 20
			Startposplaced = false
		var clone = pokemonskizze.duplicate()
		clone.visible = true
		clone.name = i.Name
		clone.get_child(0).text = i.Name
		clone.get_child(1).text = "hp: "+ str(i.hp)
		if Startposplaced:
			X_pos += 60
			print("doch")
			clone.position = Vector2(X_pos,Y_pos)
		else:
			print("nochnie")
			Startposplaced = true
			clone.position = Vector2(X_pos,Y_pos)
		print(clone.position)
		self.get_node("VBoxContainer").add_child(clone)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("tab"):
		print("yo")
		if is_on == false:
			self.visible = true
			is_on = true
			ifis_on()
			$"../Button".visible = true
		else:
			is_on = false
			for i in self.get_node("VBoxContainer").get_children():
				if i.name != "Inven":
					i.queue_free()
			self.visible = false
			$"../Button".visible = false
func egg() ->void:
	isonpokemon = false

	
	var anzahl = 0
	
	var X_pos = 20
	var Y_pos = 20
	
	var Startposplaced =  false
	var oldpos = Vector2(20,20)
	for i in Savestats.inventory:
		anzahl += 1
		if anzahl == 6:
			anzahl = 1
			Y_pos += 60
			X_pos = 20
			Startposplaced = false
		var clone = i
		clone.visible = true
		if Startposplaced:
			X_pos += 60
			print("doch")
			clone.position = Vector2(X_pos,Y_pos)
		else:
			print("nochnie")
			Startposplaced = true
			clone.position = Vector2(X_pos,Y_pos)
		print(clone.position)
		self.get_node("VBoxContainer").add_child(clone)

func gambling():
	var pokemon =  Character.allpokemons.pick_random()
	var anzahl = -5
	var schrittmenge = 0.6
	for i in range(1,11):
		var pokemonpicture = 0
		if i != 100 :
			pokemonpicture =  Character.allpokemons.pick_random()
		else:
			pokemonpicture = pokemon	
		while true:
			var smooth = clamp(anzahl ,-3,3)
			var y = clamp( -1 *smooth * smooth +  9  ,0,9 )

			$"../../Icon".scale =Vector2(y,y) * 0.1
			print(y)
		
			if y>8.9 and i == 10:
				
				print("done")
				break
			
			
			if smooth == 3:
				anzahl = -6
				break
			
			anzahl += 1 * schrittmenge
			schrittmenge -=0.002
			await get_tree().create_timer(0.001).timeout
		
		
func _on_button_pressed() -> void:
	if isonpokemon and is_on:
		for i in $VBoxContainer.get_children():
			if i != $VBoxContainer/Inven:
				i.queue_free()
			egg()
	if isonpokemon and is_on:
		for i in $VBoxContainer.get_children():
			if i != $VBoxContainer/Inven:
				i.queue_free()
		ifis_on()	
	
