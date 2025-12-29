extends Node
var Coins = 0
var inventory = []
var pokemons = [Character.basti]

				



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func loaddata()->void:
	var file = FileAccess.open("user://dokimon",FileAccess.READ)
	if file!= null:
		
		var getcontent = file.get_var()
		
		for i in getcontent[1]:
			print(i[3])
			pokemons.append(character.new(i[0],i[1],i[2],i[3],i[4],i[5],i[6],
			i[7],i[8],load(i[9])))
		inventory = getcontent[0]
	
	print("supi")
	
func save():
	var dataindic = []
	for i in pokemons:
		dataindic.append([i.maxhp,i.element,i.damage1,i.n_attack1_element,
		i.damage2,i.n_attack2_element,
		i.damage3,i.n_attack3_element,
		i.Name,i.texture.resource_path
		])
	var allcontent = [inventory,dataindic]
	var file = FileAccess.open("user://dokimon",FileAccess.WRITE)
	file.store_var(allcontent)
	
