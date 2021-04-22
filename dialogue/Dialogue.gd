extends PopupDialog


func set_text(dialogue: String):
	get_node("TextBox/Dialogue").text = dialogue;
	open();
	
func open():
	popup();
	
func close():
	hide();
