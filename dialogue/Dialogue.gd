extends PopupDialog


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(false);
	
func open():
	get_tree().set_pause(true);
	popup();
	set_process_input(true);

func close():
	get_tree().set_pause(false);
	set_process_input(false);
	hide();
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		print('Don\'t leave me!');
		close();
		get_tree().set_input_as_handled();

func _on_openDialogue():
	open();
	
