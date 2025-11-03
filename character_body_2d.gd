extends CharacterBody2D
@onready  var textbox = $"../Pixil-frame-0"
@onready var camera: Camera2D = $"../Camera2D"
@onready var playerarea = $"player Area"
@onready var interact = $"../interact"
var gamblernpc_interaction
var allowwalking = true	
var Npc = null
var fishing = false
var isfishing = false
@onready var  skipbutton = $"../Pixil-frame-0/Button"
func textbotchanged() -> void:
	if textbox.visible == true:
		allowwalking = false
	else:
		allowwalking = true
func skipbuttonreleased() -> void:
	print("hallo")
	textbox.visible = false
	
func _ready() -> void:
	textbox.visibility_changed.connect(textbotchanged)
	skipbutton.pressed.connect(skipbuttonreleased)
	
func _physics_process(delta: float) -> void:
	
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("forward") && allowwalking:
		self.velocity.y  = -20000 * delta
	if Input.is_action_pressed("bachward") && allowwalking:
		self.velocity.y =  20000 *  delta

	if Input.is_action_pressed("left") && allowwalking:
		self.velocity.x = -20000 *delta

	if Input.is_action_pressed("right") && allowwalking:
	
		self.velocity.x = 20000* delta
		
	if Input.is_action_just_pressed("interact") :
		if gamblernpc_interaction == true:
			print("hello")
			textbox.get_node("Label").text = ""
			textbox.visible = true
			skipbutton.disabled = false
			textbox.position = Vector2(self.position.x,self.position.y + 199)
			gamblernpc_interaction = false
			var text =Npc.get_meta("npctext")
			for i in text:
				textbox.get_node("Label").text = textbox.get_node("Label").text + i
				await get_tree().create_timer(0.01).timeout
		elif fishing == true:
			pass
			
			
			
			
		
	move_and_slide()
	if fishing == true:
		interact.position  = self.position
	
	camera.position = self.position
func _on_player_area_area_exited(area: Area2D) -> void:
	print("hello")
	if area.is_in_group("talkandinteractNpc"):
		interact.visible = false
		gamblernpc_interaction = false
	if area.get_parent().is_in_group("fishing"):
		interact.visible = false
		fishing = false
		
	
func _on_player_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("talkandinteractNpc"):
		Npc = area.get_parent()
		interact.visible = true
		gamblernpc_interaction = true
		interact.position = Npc.position
	if area.get_parent().is_in_group("fishing"):
		interact.visible = true
		interact.position =self.position
		fishing = true




	
		
		
		
		
		
