extends ScrollContainer

@export var is_on = false
@onready var pokemonskizze =  $"../../Storage/pokemonbild"
var isonpokemon = true
var isgambling = false

@export var Gambling:Callable 
@onready var player =$"../../CharacterBody2D"





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Gambling = gambling
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func ifis_on() ->void:
	isonpokemon = true
	print("yo")
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
		
			clone.position = Vector2(X_pos,Y_pos)
		else:
	
			Startposplaced = true
			clone.position = Vector2(X_pos,Y_pos)

		self.get_node("VBoxContainer").add_child(clone)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("tab"):

		if is_on == false:
			get_tree().paused = true
			self.visible = true
			is_on = true
			ifis_on()
			$"../Button".visible = true
		else:
			get_tree().paused = false
			is_on = false
			for i in self.get_node("VBoxContainer").get_children():
				if i.name != "Inven":
					i.queue_free()
			self.visible = false
			$"../Button".visible = false
func egg() ->void:
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
		var clone = $"../../Storage/gachaegg".duplicate()
		clone.visible = true
		if Startposplaced:
			X_pos += 60
	
			clone.position = Vector2(X_pos,Y_pos)
		else:
	
			Startposplaced = true
			clone.position = Vector2(X_pos,Y_pos)

		self.get_node("VBoxContainer").add_child(clone)

func gambling():
	
	$"../../Icon".visible = true
	Savestats.inventory.remove_at(0)
	for i in $VBoxContainer.get_children():
		if i != $VBoxContainer/Inven:
			i.queue_free()
	$"../../Icon".position = player.position
	var randomnumber = randi_range(0,Character.allpokemons.size() -1)
	var pokemon =  Character.allpokemons[randomnumber]
	var image =  Character.allpokimages[randomnumber]
	print(pokemon.Name)
	var anzahl = -5	
	var schrittmenge = 0.6
	for i in range(1,11):
		var fakeimages = Character.allpokimages.pick_random()
		var pokemonpicture = 0
		if i != 10 :

			pokemonpicture = fakeimages
		elif  i == 10:
			Savestats.pokemons.append(pokemon)
			pokemonpicture = image
		print("SET:", pokemonpicture.resource_path)
		await get_tree().process_frame
		$"../../Icon".texture = pokemonpicture
		while true:

			var smooth = clamp(anzahl ,-3,3)
			var y = clamp( -1 *smooth * smooth +  9  ,0,9 )

			$"../../Icon".scale =Vector2(y,y) * 0.1
			if y>8.9 and i == 10:
				await get_tree().create_timer(1).timeout
				egg()
				$"../../Icon".visible = false
				break
			if smooth == 3:
				anzahl = -6
				break
			anzahl += 1 * schrittmenge
			schrittmenge -=0.002
			await get_tree().create_timer(0.001).timeout
		
		
func _on_button_pressed() -> void:
	if isonpokemon == true and is_on:
		print(isonpokemon)
		for i in $VBoxContainer.get_children():
			if i != $VBoxContainer/Inven:
				i.queue_free()
		egg()
		isonpokemon = false
	elif isonpokemon == false and is_on:
		for i in $VBoxContainer.get_children():
			if i != $VBoxContainer/Inven:
				i.queue_free()
		ifis_on()	
		isonpokemon = true
