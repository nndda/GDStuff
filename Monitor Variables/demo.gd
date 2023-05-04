extends Node2D

func _process(_delta):
    $MonitorVariables.variables = [
    "Engine.get_frames_per_second",         Engine.get_frames_per_second(),
    "Engine.get_frames_drawn",              Engine.get_frames_drawn(),
    "get_viewport().get_mouse_position()",  get_viewport().get_mouse_position(),
    "Time.get_datetime_string_from_system", Time.get_datetime_string_from_system(),
    "Time.get_ticks_msec",                  Time.get_ticks_usec(),
    "Time.get_ticks_msec",                  Time.get_ticks_msec() ]
    $MonitorVariables.set_vars()
