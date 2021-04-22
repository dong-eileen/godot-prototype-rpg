extends StaticBody2D

signal message_requested;

export(SpriteFrames) var sprite;
export(Resource) var dialogue;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func interact():
	emit_signal('message_requested', get_node("DialoguePosition").position) #TODO: refactor this baby so the Player logic is less confusing
