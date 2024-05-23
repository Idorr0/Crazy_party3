extends Node

@onready var objects_container = $Objects

const COLHER = preload("res://Scenes/colher.tscn")
const COXINHA = preload("res://Scenes/coxinha.tscn")
const FACA = preload("res://Scenes/faca.tscn")
const GARFO = preload("res://Scenes/garfo.tscn")
const GARRAFA = preload("res://Scenes/garrafa.tscn")
const HAMBURGER = preload("res://Scenes/hamburguer.tscn")
const ISQUEIRO = preload("res://Scenes/isqueiro.tscn")

var objects_list = [
	COLHER,
	COXINHA,
	FACA,
	GARFO,
	GARRAFA,
	HAMBURGER,
	ISQUEIRO
]

var last_object_index = -1


func _ready():
	spawn_objects()

func _on_timer_timeout():
	spawn_objects()

func spawn_objects():
	var index1 = get_objeto_aleatorio()
	var object1 = objects_list[index1].instantiate()
	object1.global_position = Vector2(30, 0)
	objects_container.add_child(object1)

	var index2 = get_objeto_aleatorio(index1)
	var object2 = objects_list[index2].instantiate()
	object2.global_position = Vector2(80, 0)
	objects_container.add_child(object2)

	var index3 = get_objeto_aleatorio(index1, index2)
	var object3 = objects_list[index3].instantiate()
	object3.global_position = Vector2(130, 0)
	objects_container.add_child(object3)

func get_objeto_aleatorio(item1 = -1, item2 = -1):
	var index = randi_range(0, objects_list.size() -1)
	while index == item1 or index == item2:
		index = randi_range(0, objects_list.size() -1)
	last_object_index = index
	return index
