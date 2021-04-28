extends Resource
class_name DialogueNode

export(int) var id
export(String) var speaker
export(String) var text
export(Array) var next_nodes
export(String) var action

func _init(new_id: int, new_speaker: String, new_text: String, new_next_nodes: Array, new_action: String):
	id = new_id
	speaker = new_speaker
	text = new_text
	next_nodes = new_next_nodes
	action = new_action
