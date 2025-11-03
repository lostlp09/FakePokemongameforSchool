extends CharacterBody2D


const SPEED = 2500
const JUMP_VELOCITY = -400.0
var left = -1

func _ready() -> void: 
	funcrandom()

func _physics_process(delta: float) -> void:
	
	self.velocity.x = left * delta * SPEED 
	
	move_and_slide()
	
func funcrandom()->void:
	while true:
		var random = randi_range(0,1)
		if random == 0:
			left = -1
		else:
			left = 1
		await get_tree().create_timer(1).timeout
	
	
