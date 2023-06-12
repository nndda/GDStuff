extends Node

#--------------------------------------------
#   this script convert plain *.txt file
#   to Array[Dictionary].
#   so that it can be iterated.
#--------------------------------------------

var characters  := {
    Hero        = "John",
    Villain     = "Jeff",
    Player      = "Player_Name",
    "_" = "" }

func txt2dlg(
    dialogue_chr : Dictionary,
    dialogue_file : String,
    remove_empty_attr : bool = true
    ) -> Array[Dictionary]:

#   Set structure:
#   Dialogue sets: Array[Dictionary]
#   [ set1, set2, set3, set4 ]
#
#   Set:
#   {   data                = {
#           chr_name        : String,
#           expression      : String,
#           attributes      : Dictionary,
#           function_calls  : PackedStringArray }
#       dialogue        : String
#   }

    var output : Array[Dictionary] = []

    var dlg_raw = FileAccess.get_file_as_string( dialogue_file ).split( "\n", false )

    for n in dlg_raw.size():
        if n % 2 == 0:

            var dlg_set         := {}
            var data            := {
                chr_name        = "",
                expression      = "",
                attributes      = {},
                function_calls  = [] }
            var dialogue        := ""

            for d in dlg_raw[n].split( " ", false ):

                if d.begins_with("-"):
                    data.expression = d.right(-1)

                elif d.ends_with("()"):
                    data.function_calls.append(d.left(-2))

                elif d.contains("="):
                    var attr := d.split( "=", false )
                    for a in attr.size() * .5:
                        data.attributes[attr[a]] = attr[a+1]

                else:
                    data.chr_name = ("{"+d+"}").format(dialogue_chr)

            if remove_empty_attr:
                if data.attributes.is_empty()       : data.erase("attributes")
                if data.function_calls.is_empty()   : data.erase("function_calls")

            dialogue            = dlg_raw[n+1].format(dialogue_chr)
            dlg_set["data"]     = data
            dlg_set["dialogue"] = dialogue

            output.append(dlg_set)

    for i in output: print(i)

    return output

func _on_ready(): txt2dlg( characters, "res://Text to Dialogue/dialogue_demo.txt" )
