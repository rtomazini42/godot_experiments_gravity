extends Node

@export var object_templates: Array[PackedScene]
@export var deleting: PackedScene  # Alterado para ser apenas um PackedScene

func _input(event):
	# Checar se o evento é click
	if event is InputEventMouseButton:
		if event.button_index == 1:  # Clique esquerdo
			if event.pressed:
				spawn_object(event.position)
				print(event)
		elif event.button_index == 2:  # Clique direito
			if event.pressed:
				del_object(event.position)
				print(event)
	pass

func spawn_object(position: Vector2) -> void:
	var index: int = randi_range(0, object_templates.size() - 1)
	var object_template = object_templates[index]
	var object = object_template.instantiate()
	object.position = position
	add_child(object)

func del_object(position: Vector2) -> void:
	var object = deleting.instantiate()  # Corrigido para usar 'deleting'
	object.position = position
	add_child(object)
