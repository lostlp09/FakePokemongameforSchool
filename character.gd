extends Node

var p1 : Array
var p2 : Array 
var bastard: character = character.new(100, "fire", 5, "fire", 5, "fire", 5, "neutral", "bastard", preload("res://blob.tres"), {"poison1" = true})
var Monkey: character = character.new(100, "water", 30, "water", 20, "neutral", 10, "neutral", "Monkey", preload("res://blob.tres"), {})
var Giraffe: character = character.new(150, "plant", 20, "plant", 0, "plant", 30, "plant", "Giraffe", preload("res://blob.tres"), {"poison2" = true})
var Gambler: character = character.new(500, "ice", 0, "water", 0, "wind", 20, "ice", "Gambler", preload("res://blob.tres"), {"gamble3" = true})
var Gambler2: character = character.new(500, "ice", 0, "water", 0, "wind", 20, "ice", "Gambler2", preload("res://blob.tres"), {"gamble3" = true})
var Gambler3: character = character.new(500, "ice", 0, "water", 0, "wind", 20, "ice", "Gambler3", preload("res://blob.tres"), {"gamble3" = true})
func _ready() ->void:
	p1 = [Monkey, Giraffe, Gambler2]
	p2 = [Gambler, bastard,Gambler3]
