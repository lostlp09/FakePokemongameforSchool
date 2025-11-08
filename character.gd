extends Node

var p1 : character
var p2 : character
var bastard = character.new(100,5,"fire",5,"a",5,"a","bastard",{"poison" = true})
var Monkey: character = character.new(100, 30, 20, 10, "Monkey", {})
var Giraffe: character = character.new(150, 20, 0, 30, "Giraffe", {"poison2" = true})
var Gambler: character = character.new(500, 0, 0, 20, "Gambler", {"gamble3" = true})
func _ready() ->void:
	p1 = self.Monkey
	p2 = self.Gambler
