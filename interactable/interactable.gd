extends StaticBody2D

signal message_requested;

# Constants to hold identifiers from the input JSON
const ID: String = "id"
const SPEAKER: String = "speaker"
const TEXT: String = "text"
const NEXT_NODES: String = "nextNodes"
const ACTION: String = "action"

const DialogueNode = preload("res://dialogue/dialogue_node.gd");
const DialogueTree = preload("res://dialogue/dialogue_tree.gd");

# File should be formatted like a JSON with fields: id, speaker, text, nextNodes, action
# Each piece of dialogue should be crammed onto one line for ease of parsing
# Empty values should either be [] or "", not null
export(String) var dialogue_file_path;
export(SpriteFrames) var sprite; # Not used?

var dialogue_tree: DialogueTree;

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	dialogue_tree = DialogueTree.new()
	parse_dialogue_file()

# Order of fields is not enforced but highly recommended for sanity
func parse_dialogue_file() -> void:
	var file = File.new()
	file.open(dialogue_file_path, File.READ)
	var all_dialogue: Dictionary #<DialogueNode>
	while (not file.eof_reached()):
		var line: String = file.get_line();
		if (line.empty()):
			continue;
		var parsed_line: Dictionary = JSON.parse(line).result
		var dialogue_node: DialogueNode = DialogueNode.new(parsed_line.get(ID), parsed_line.get(SPEAKER), parsed_line.get(TEXT), parsed_line.get(NEXT_NODES), parsed_line.get(ACTION))
		all_dialogue[dialogue_node.id] = dialogue_node
	dialogue_tree.dialogue = all_dialogue
	file.close();

func interact() -> void:
	emit_signal('message_requested', dialogue_tree, get_node("DialoguePosition").position) #TODO: refactor this baby so the Player logic is less confusing
