extends CharacterBody2D

var acc = 0.5
var clicked = false
var timer = 0
var addtime = 0
@onready var prog = $"../../ProgressBar"
@onready var fish = $"../fish"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if prog.value >= 100:
		queue_free()
	var distance =  self.position.distance_to(fish.position)
	if distance >= 3.5:
		addtime = 0
		if timer >= 0.3:
			prog.value -=2
			
			timer = 0
	else:
		
		timer = 0
		addtime += delta
		if addtime >= 0.3:
			prog.value +=2
			
			
			addtime = 0
		
		
	print (distance)
	timer += delta
	if Input.is_action_pressed("mousekey"):
	

			
		if clicked == false:
			acc = 0.5
			clicked = true
		acc += 0.05 * delta
	else:
		if clicked == true:
			acc =0.5
			clicked = false
		acc += 0.05 * delta	
	if clicked == false:
		self.velocity.x -=   3 * acc
	else:
		self.velocity.x +=   3 * acc
	move_and_slide()

		
