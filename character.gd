extends Node

var p1 : Array
var p2 : Array 
var allpokemons:Array
var allpokimages:Array
var basti: character = character.new(100, "fire", 5, "fire", 5, "fire", 5, "neutral", "basti", {"poison1" = true})
var Monkey: character = character.new(100, "water", 30, "water", 20, "neutral", 10, "neutral", "Monkey", {})
var Giraffe: character = character.new(150, "plant", 20, "plant", 0, "plant", 30, "plant", "Giraffe", {"poison2" = true})
var Gambler: character = character.new(500, "ice", 0, "water", 0, "wind", 20, "ice", "Gambler", {"gamble3" = true})
var Gambler2: character = character.new(500, "ice", 0, "water", 0, "wind", 20, "ice", "Gambler2", {"gamble3" = true})
var Gambler3: character = character.new(500, "ice", 0, "water", 0, "wind", 20, "ice", "Gambler3", {"gamble3" = true})
func _ready() ->void:
	allpokemons =[basti,Monkey,Giraffe,Gambler,Gambler2]
	allpokimages =[preload("res://testimages/basti.png"),preload("res://testimages/Monkey.png"),preload("res://testimages/Frame 1.png"),preload("res://gambler1(1).png"),preload("res://testimages/g2.png")]
	p1 = [self.Monkey, self.Giraffe, self.Gambler2]
	p2 = [self.Gambler, self.basti, self.Gambler3]
