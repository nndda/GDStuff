extends CanvasLayer

var variables : Array = []

func set_vars() -> void:

    if $List.get_child_count() < variables.size() * .5:
        for vars in variables.size() * .5:

            var label := $"List/0".duplicate()
            label.get_node("Label").text = str( variables[ vars * 2 ] )
            label.get_node("Value").text = str( variables[ vars * 2 + 1 ] )

            $List.add_child( label )
        $"List/0".queue_free()

    elif $List.get_child_count() == variables.size() * .5:
        mon_vars()


func mon_vars() -> void:
    for c in $List.get_children():

        c.get_node("Label").text = str( variables[ c.get_index() * 2 ] )
        c.get_node("Value").text = str( variables[ c.get_index() * 2 + 1 ] )
