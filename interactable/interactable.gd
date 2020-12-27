extends StaticBody2D

signal openDialogue

export(SpriteFrames) var sprite;
export(String) var dialogue;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func interact():
	emit_signal('openDialogue', dialogue)
