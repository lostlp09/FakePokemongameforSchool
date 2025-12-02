extends Node

var p1 : Array
var p2 : Array 
var allpokemons:Array
var bastard: character = character.new(100, "fire", 5, "fire", 5, "fire", 5, "neutral", "bastard", {"poison1" = true})
var Monkey: character = character.new(100, "water", 30, "water", 20, "neutral", 10, "neutral", "Monkey", {})
var Giraffe: character = character.new(150, "plant", 20, "plant", 0, "plant", 30, "plant", "Giraffe", {"poison2" = true})
var Gambler: character = character.new(500, "ice", 0, "water", 0, "wind", 20, "ice", "Gambler", {"gamble3" = true})
var Gambler2: character = character.new(500, "ice", 0, "water", 0, "wind", 20, "ice", "Gambler2", {"gamble3" = true})
var Gambler3: character = character.new(500, "ice", 0, "water", 0, "wind", 20, "ice", "Gambler3", {"gamble3" = true})
func _ready() ->void:
	allpokemons =[bastard,Monkey,Giraffe,Gambler,Gambler2,Gambler3]
	p1 = [self.Monkey, self.Giraffe, self.Gambler2]
	p2 = [self.Gambler, self.bastard, self.Gambler3]
