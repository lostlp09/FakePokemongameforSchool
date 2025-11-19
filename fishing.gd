extends CharacterBody2D

var acc = 0.5
var clicked = false
var timer = 0
var addtime = 0
@onready var prog = $"../ProgressBar"
@onready var fish = $"../fish"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(self.position.distance_to(fish.position))
	if prog.value >= 100:
		ongambling()
		
		self.get_parent().get_parent().queue_free()
	var distance =  self.position.distance_to(fish.position)
	if distance >= 120:
		addtime = 0
		if timer >= 0.3:
			prog.value -=2
			
			timer = 0
	else:
		timer = 0
		addtime += delta
		if addtime >= 0.3:
			prog.value +=3
			addtime = 0

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
		self.velocity.x -=   600* acc * delta
	else:
		self.velocity.x +=   600 * acc * delta
	move_and_slide()
var characterlistcommon  = ["Dog","cat","hamster"]
var characterlistuncomon = ["elephant","Giraffe","zebra"]
var characterlistrare = ["crocodile","eagle","tiger"]
var characterlistepic = ["aligator","lion"]
var characterlistlegendary = ["Dinosour","Cheetah"]
func ongambling() -> void:
	var result = randi_range(0,100)
	
	if  result <= 50:
		var value = characterlistcommon.pick_random()
		print("you got a " + value)
	elif   result <=75:
		var value = characterlistuncomon.pick_random()
		print("you got a " + value)
	elif  result <= 90:
		var value = characterlistrare.pick_random()
		print("you got a " + value)
	elif  result <= 99:
		var value = characterlistepic.pick_random()
		print("you got a " + value)
	elif result <= 100:
		var value = characterlistlegendary.pick_random()
		print("you got a " + value)		
