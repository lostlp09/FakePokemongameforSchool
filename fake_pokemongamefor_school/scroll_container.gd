extends ScrollContainer

@export var is_on = false
@onready var pokemonskizze =  $"../../Storage/pokemonbild"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func ifis_on() ->void:
	
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
		if is_on == false:
			self.visible = true
			is_on = true
			ifis_on()
		else:
			is_on = false
			for i in self.get_node("VBoxContainer").get_children():
				if i.name != "Inven":
					i.queue_free()
			self.visible = false
