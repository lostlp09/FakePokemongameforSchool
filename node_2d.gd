extends  Node
var characterlistcommon  = ["Dog","cat","hamster"]
var characterlistuncomon = ["elephant","Giraffe","zebra"]
var characterlistrare = ["crocodile","eagle","tiger"]
var characterlistepic = ["aligator","lion"]
var characterlistlegendary = ["Dinosour","Cheetah"]
@onready var pressforgambling = $Button 
var randomnumer = RandomNumberGenerator.new()
var result = randomnumer.randf_range(1,1000)
func ongambling() -> void:
	var result = randomnumer.randf_range(1,100)
	
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
	
		
		
		
	
	
func _ready() -> void:
	pressforgambling.pressed.connect(ongambling)
	


	
	
	
	
	
	
	
	
	
