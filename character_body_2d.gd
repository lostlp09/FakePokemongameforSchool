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
var fishuiisactive= null
var skipped = null
var jumping = false
signal  fishing1
var fishui = preload("res://test.tscn")
@onready var  skipbutton = $"../Pixil-frame-0/Button"
var isonfloor = true
var x = 0
var otherx = 4
var savepos = Vector2(0,0)
var gameloaded = false
func textbotchanged() -> void:
	if textbox.visible == true:
		allowwalking = false
	else:
		allowwalking = true
func skipbuttonreleased() -> void:

	textbox.visible = false
	gamblernpc_interaction = true
	textbox.get_node("Label").text = ""
	skipped = true	
	
func _ready() -> void:
	fishing1.connect(whileisifishing)
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
		if gamblernpc_interaction == true and (skipped== true or skipped == null):
			skipped = false

			textbox.get_node("Label").text = ""
			textbox.visible = true
			skipbutton.disabled = false
			textbox.position = Vector2(self.position.x,self.position.y + 199)
			gamblernpc_interaction = false
			var text =Npc.get_meta("npctext")
			
			for i in text:
				if skipped == false:
					textbox.get_node("Label").text = textbox.get_node("Label").text + i
					await get_tree().create_timer(0.01).timeout
				else:
					textbox.get_node("Label").text = ""
					break
		elif fishing == true and fishuiisactive == null:
			var fishstart = fishui.instantiate()
			fishuiisactive = fishstart
			fishstart.position = Vector2(self.position.x  ,self.position.y )
			self.get_parent().add_child(fishstart)
			fishing1.emit()
			
			
			isfishing = true
			allowwalking = false
		
	if Input.is_action_just_pressed("jump"):
		isonfloor = false
		jumping = true          
	
	if jumping == true:
		x += 10 * delta 
		var y =  -1 * x*x +4*x +2.5 
			
		y = clamp(y,0,6.5)
		self.scale = Vector2(y,y)
		if x >= 4.5:
			self.scale =Vector2(2.5,2.5)
			self.position = savepos
			isonfloor = true
			jumping = false
			x = 0
			wait()
		if  x >= 4 and $"../Map/floor".has_overlapping_bodies():
			self.scale =Vector2(2.5,2.5)
			isonfloor = true
			jumping = false
			x = 0
	elif not $"../Map/floor".has_overlapping_bodies():
		if gameloaded:
			otherx += 10* delta
			var y =  -1 * otherx*otherx +4*otherx +2.5 
			y = clamp(y,0,6.5)
			self.scale = Vector2(y,y)
			if y == 0:
				wait()
				self.position = savepos
				self.scale =  Vector2(2.5,2.5)
				otherx = 4
				gameloaded = false
			

				
	move_and_slide()
	if fishing == true:
		interact.position  = self.position
	
	camera.position = self.position
	gameloaded = true
func _on_player_area_area_exited(area: Area2D) -> void:

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



func whileisifishing()->void:
	while true:
		if fishuiisactive == null:
			allowwalking = true
			break
	
		
		
		await  get_tree().create_timer(0.1).timeout
	
	

	
func wait():
	await  get_tree().process_frame
	gameloaded =   false
		
		
		
		
