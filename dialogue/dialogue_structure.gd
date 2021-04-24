extends Resource
class_name DialogueStructure

export(Array) var dialogue setget set_dialogue
var curr_position = 0

func _ready():
	pass # Replace with function body.

# TODO: maybe have this class figure out which dialogue to look at next...?
# because otherwise, we're relying on this object's specific data representation
func set_dialogue(input: Array):
	dialogue = input;

func get_curr_dialogue():
	if (curr_position < len(dialogue)):
		return dialogue[curr_position];
	else:
		return null;
		
func has_next():
	return curr_position < len(dialogue);
	
func next():
	curr_position += 1;

func reset():
	curr_position = 0;
