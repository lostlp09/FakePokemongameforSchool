extends CharacterBody2D

@onready var camera: Camera2D = $"../Camera2D"
@onready var playerarea = $"player Area"
@onready var interact = $"../interact"
func _ready() -> void:
	pass

	
func _physics_process(delta: float) -> void:


	
	

	
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("forward"):
		self.velocity.y  = -20000 * delta

	
	if Input.is_action_pressed("bachward"):
		self.velocity.y =  20000 *  delta

	if Input.is_action_pressed("left"):
		self.velocity.x = -20000 *delta

	if Input.is_action_pressed("right"):
	
		self.velocity.x = 20000* delta
		
	move_and_slide()
	
	camera.position = self.position
	
	





func _on_player_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("talkandinteractNpc"):
		interact.visible = false
		
		

func _on_player_area_area_entered(area: Area2D) -> void:
	print("hello")
	if area.is_in_group("talkandinteractNpc"):
		var npcname = area.get_parent()
		interact.visible = true
		interact.position = npcname.position
	
		
		
		
		
		
