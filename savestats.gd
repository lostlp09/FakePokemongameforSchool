extends Node
var Coins = 0
var inventory = []
var pokemons = [Character.Monkey]

				



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func loaddata()->void:
	var getcontent = FileAccess.open("./dokimon",FileAccess.READ)
	if getcontent != null:
		getcontent = getcontent.get_var()
		inventory = getcontent[0]
		pokemons = getcontent[1]
		
	
	print("supi")
	
func save():
	var allcontent = [inventory,pokemons]
	var file = FileAccess.open("./dokimon",FileAccess.WRITE)
	file.store_var(allcontent)
	
