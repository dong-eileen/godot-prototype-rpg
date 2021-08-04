extends Resource
class_name DialogueTree

# Dictionary<DialogueNode>
export(Dictionary) var dialogue setget set_dialogue
var curr_id = [1] # if there are multiple values, then this is a dialogue option

# Dictionary<DialogueNode>
func set_dialogue(input: Dictionary):
	dialogue = input;
		
func has_next():
	return curr_id.size() > 0;
	
func next():
	if (curr_id.size() == 1):
		var curr_dialogue: DialogueNode = dialogue.get(int(curr_id[0]));
		curr_id = curr_dialogue.next_nodes;
		return [curr_dialogue.text];
	elif (curr_id.size() > 1):
		var text: Array = [];
		for id in curr_id:
			var curr_dialogue: DialogueNode = dialogue.get(int(curr_id[0]));
			text.append(curr_dialogue.text);
		curr_id = [];
		return text;
	else:
		return null;
		
		
#	if (curr_id.size() > 0):
#		var text: Array = [];
#		for id in curr_id:
#			var curr_dialogue: DialogueNode = dialogue.get(int(curr_id[0]));
#			text.append(curr_dialogue.text);
#		return text;
#	else:
#		return null;
		
#	if (curr_id < len(dialogue)):
#		var curr_dialogue: DialogueNode = dialogue[curr_id];
#		curr_id += 1;
#		return curr_dialogue.text;
#	else:
#		return null;

func reset():
	curr_id = [1];
