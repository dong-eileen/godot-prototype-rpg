extends Resource
class_name DialogueStructure

export(Array) var dialogue setget ,get_dialogue;


func _ready():
	pass # Replace with function body.

# TODO: maybe have this class figure out which dialogue to look at next...?
# because otherwise, we're relying on this object's specific data representation
func get_dialogue():
	return dialogue
