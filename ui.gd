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
	while true:
		if Character.p1 and Character and $"../player container/player 1" and $"../player container/player 2" and $"../player container/player 3" and $"../enemy container/enemy 1 area/AnimatedSprite2D" and $"../enemy container/enemy 2 area/AnimatedSprite2D" and $"../enemy container/enemy 3 area/AnimatedSprite2D":
			break
		await get_tree().process_frame
	p1_sprites = [$"../player container/player 1".sprite_frames, $"../player container/player 2".sprite_frames, $"../player container/player 3".sprite_frames]
	p2_sprites = [$"../enemy container/enemy 1 area/AnimatedSprite2D".sprite_frames, $"../enemy container/enemy 2 area/AnimatedSprite2D".sprite_frames, $"../enemy container/enemy 3 area/AnimatedSprite2D".sprite_frames]
	for x in range(3):
		print(get_node("../player container/player %d/AnimatedSprite2D" % (x+1)).sprite_frames, Character.p1[x].texture)
		get_node("../player container/player %d/AnimatedSprite2D" % (x+1)).sprite_frames = Character.p1[x].texture
	for x in range(3):
		print(get_node("../enemy container/enemy %d area/AnimatedSprite2D" % (x+1)).sprite_frames, Character.p2[x].texture)
		get_node("../enemy container/enemy %d area/AnimatedSprite2D" % (x+1)).sprite_frames = Character.p2[x].texture
func _process(delta)->void:
	text1.text = "attack 1"
	text2.text = "attack 2"
	text3.text = "attack 3"
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
	if $"../enemy container/enemy 1 area/enemy 1/HP 1" and $"../enemy container/enemy 2 area/enemy 2/HP 2" and $"../enemy container/enemy 3 area/enemy 3/HP 3":
		$"../enemy container/enemy 1 area/enemy 1/HP 1".text = var_to_str(roundf(Character.p2[0].hp))
		$"../enemy container/enemy 2 area/enemy 2/HP 2".text = var_to_str(round(Character.p2[1].hp))
		$"../enemy container/enemy 3 area/enemy 3/HP 3".text = var_to_str(round(Character.p2[2].hp))
