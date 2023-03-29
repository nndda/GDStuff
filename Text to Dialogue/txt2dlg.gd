extends Node



#	this script convert plain *.txt file
#	to PackedStringArray.
#	so that it can be iterated.



var characters = {
	Hero		= "John",
	Villain		= "Jeff",
	Player		= "Player_Name",
	"_" = "" }

@export_file( "*.txt" )
var dialogue_file	: String
var dialogue_set	: Array[ PackedStringArray ]


func txt2dlg() -> void:

	var dialogue_set_raw : PackedStringArray =\
		FileAccess.get_file_as_string( dialogue_file ).split( "\n{" )

	for l in dialogue_set_raw.size():

		var line_raw	: String =\
			dialogue_set_raw[ l ]

		var character	: String =\
			line_raw.left( line_raw.find( "\n\t" ) )

		var dialogue	: String =\
			line_raw.trim_prefix( character ).strip_escapes()

		dialogue_set.append( PackedStringArray( [
			( "{" + character )	.format( characters ),
			dialogue			.format( characters )
			] ) )

	dialogue_set.remove_at( 0 ) # idk y :\

	for d in dialogue_set: print( d[ 0 ] + "\n\t" + d[ 1 ] )


func _on_ready(): txt2dlg()
