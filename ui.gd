extends Node

@onready var text1 = $"attack 1/button1 text"
@onready var text2 = $"attack 2/button2 text"
@onready var text3 = $"attack 3/button3 text"

var current_attacker
var elements
var texts : Array
var icons : Array
var p1_textures : Array
var p2_textures : Array
var p1_sprites : Array
var p2_sprites : Array
func _ready():
	icons = [$"attack 1/button1 icons", $"attack 2/button2 icons", $"attack 3/button3 icons"]
	while not Character.p1 and Character.p2:
		await get_tree().process_frame
	p1_textures = [Character.p1[0].texture, Character.p1[1].texture, Character.p1[2].texture]
	p2_textures = [Character.p2[0].texture, Character.p2[1].texture, Character.p2[2].texture]
	p1_sprites = [$"../player container/player 1".sprite_frames, $"../player container/player 2".sprite_frames, $"../player container/player 3".sprite_frames]
	p2_sprites = [$"../enemy container/enemy 1/AnimatedSprite2D".sprite_frames, $"../enemy container/enemy 2/AnimatedSprite2D".sprite_frames, $"../enemy container/enemy 3/AnimatedSprite2D".sprite_frames]
func _process(delta)->void:
	text1.text = "attack 1"
	text2.text = "attack 2"
	text3.text = "attack 3"
	if p1_textures and p2_textures:
		for x in range(0,3):
			print(p1_sprites[x], p1_textures[x])
			p1_sprites[x] = p1_textures[x] 
	if $"..".current_attacker:
		current_attacker = $"..".current_attacker
		elements = [current_attacker.n_attack1_element,
	 	current_attacker.n_attack2_element,
	 	current_attacker.n_attack3_element]
		for i in range(0,3):
			var icon = icons[i]
			var element = elements[i]
			var x
			match element:
				"neutral" : x = 0
				"fire" : x = 1
				"water" : x = 2
				"ice" : x = 3
				"wind" : x = 4
				"plant" : x = 5
			icon.frame = x
		
		
