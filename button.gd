extends Button

func _pressed() -> void:
	self.get_parent().get_parent().get_parent().Gambling.call()
	
	self.queue_free()
