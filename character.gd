extends Node

var p1 : Array
var p2 : Array 
var allpokemons:Array
var allpokimages:Array
var basti: character = character.new(100, "fire", 100, "fire", 5, "fire", 500, "neutral", "basti", preload("res://blob.tres"))
var Monkey: character = character.new(100, "water", 30, "water", 20, "neutral", 500, "neutral", "blob", preload("res://blob.tres"))
var Giraffe: character = character.new(150, "plant", 20, "plant", 30, "plant", 500, "plant", "Giraffe", preload("res://blob.tres"))
var Sporal: character = character.new(500, "ice", 100, "water", 30, "wind", 500, "ice", "sporal",preload("res://blob.tres"))
var Gambler2: character = character.new(500, "ice", 20, "water", 30, "wind", 500, "ice", "Gambler2", preload("res://blob.tres"))
var Gambler3: character = character.new(100, "ice", 40, "water", 30, "wind", 500, "ice", "Gambler3", preload("res://blob.tres"))
func _ready() ->void:
	allpokemons =[basti,Monkey,Sporal]
	allpokimages =[preload("res://testimages/basti.png"),preload("res://testimages/Monkey.png"),preload("res://testimages/Frame 1.png"),preload("res://gambler1(1).png"),preload("res://testimages/g2.png")]
	p1 = [self.Monkey, self.Giraffe, self.Gambler2]
	p2 = [self.Sporal, self.basti, self.Gambler3]
