extends Area2D

var isinarea = false

func _on_area_entered(area: Area2D) -> void:
	
	if area.name == "player Area":
		$"../interact".visible = true
		$"../interact".position = self.position
		$"../interact".z_index= 300
		isinarea = true

	print("yo")


func _on_area_exited(area: Area2D) -> void:
	if area.name == "player Area":
		$"../interact".visible = false
		isinarea = false
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and isinarea:
		self.queue_free()
		Savestats.inventory.append("eggs")
