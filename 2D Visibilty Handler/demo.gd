extends Node2D

func _process(_delta):
    $Sprite2D.global_position = get_global_mouse_position()
