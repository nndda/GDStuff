extends ReferenceRect

@export_node_path( "Node2D" ) var root_node : NodePath
@export var following : bool = true
@export_enum( "VisibleOnScreenNotifier2D", "VisibleOnScreenEnabler2D" ) var mode : int = 1
@onready var init_pos : Vector2 = global_position

@onready var node : Node = Node.new()
var visible_on_screen_node : VisibleOnScreenNotifier2D

func _ready():
    match mode:
        0: visible_on_screen_node = VisibleOnScreenNotifier2D.new()
        1: visible_on_screen_node = VisibleOnScreenEnabler2D.new()

    visible_on_screen_node.rect = Rect2( Vector2.ZERO, size )
    call_deferred( "add_child", node )
    node.add_child( visible_on_screen_node )

    visible_on_screen_node.connect( "screen_entered", Callable( get_node( root_node ), "show" ) )
    visible_on_screen_node.connect( "screen_exited", Callable( get_node( root_node ), "hide" ) )

    visible_on_screen_node.global_position = get_node( root_node ).global_position

func _process(_delta): if following:
    visible_on_screen_node.global_position = global_position
