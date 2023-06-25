extends Node2D

#   Create new AtlasTexture in a Sprite2D
#   Edit the area of the image thru:
#   Sprite2D node > Texture > Edit Region

func _ready():
    for node in $target_image.get_children():
        if node is Sprite2D:
            node.texture.get_image().save_png(
                "user://" + node.get_name() + ".png" )
                #   The output image is stored in user://
