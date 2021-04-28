extends Resource
class_name DialogueTree

# array<DialogueNode>
export(Array) var dialogue setget set_dialogue
var curr_position = 0

# array<DialogueNode>
func set_dialogue(input: Array):
	dialogue = input;
		
func has_next():
	return curr_position < len(dialogue);
	
func next():
	if (curr_position < len(dialogue)):
		var curr_dialogue: DialogueNode = dialogue[curr_position];
		curr_position += 1;
		return curr_dialogue.text;
	else:
		return null;

func reset():
	curr_position = 0;
