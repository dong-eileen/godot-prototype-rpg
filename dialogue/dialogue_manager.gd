extends Node

const DialogueGui = preload("res://dialogue/dialogue.tscn");

signal message_finished;

var dialogue = ["this", "is", "default", "dialogue"];
var is_open = false;
var current_progress = 0;
var dialogue_gui_instance;

func _ready():
	set_process_input(true);
	
func close():
	#get_tree().set_pause(false);
	#set_process_input(false);
	dialogue_gui_instance.queue_free()
	dialogue_gui_instance = null;
	is_open = false;
	current_progress = 0;
	emit_signal('message_finished')
	
func show_message():
	#get_tree().set_pause(true);
	#set_process_input(true);
	dialogue_gui_instance.set_text(dialogue[current_progress]);
	is_open = true;
	
func _input(event):
	if event.is_action_pressed("ui_accept") and is_open:
		if (current_progress < len(dialogue)  -1):
			current_progress += 1;
			show_message();
		else:
			close();
		get_tree().set_input_as_handled();

func _on_message_requested(dialogue_tree: DialogueStructure, position: Vector2):
	dialogue = dialogue_tree.dialogue;
	dialogue_gui_instance = DialogueGui.instance();
	get_tree().get_root().add_child(dialogue_gui_instance);
	dialogue_gui_instance.rect_global_position = position;
	show_message();
