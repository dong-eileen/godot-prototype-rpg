extends Node

const DialogueGui = preload("res://dialogue/dialogue.tscn");

signal message_finished;

var dialogue: DialogueTree;
var is_open = false;
var dialogue_gui_instance: Node;

func _ready():
	set_process_input(true);
	
func close():
	#get_tree().set_pause(false);
	#set_process_input(false);
	dialogue_gui_instance.queue_free()
	dialogue_gui_instance = null;
	is_open = false;
	dialogue.reset();
	emit_signal('message_finished')
	
func show_message():
	#get_tree().set_pause(true);
	#set_process_input(true);
	dialogue_gui_instance.set_text(dialogue.next());
	is_open = true;
	
func _input(event):
	if event.is_action_pressed("ui_accept") and is_open:
		if (dialogue.has_next()):
			show_message();
		else:
			close();
		get_tree().set_input_as_handled();

func _on_message_requested(dialogue_tree: DialogueTree, position: Vector2):
	dialogue = dialogue_tree;
	dialogue_gui_instance = DialogueGui.instance();
	get_tree().get_root().add_child(dialogue_gui_instance);
	dialogue_gui_instance.rect_global_position = position;
	show_message();
