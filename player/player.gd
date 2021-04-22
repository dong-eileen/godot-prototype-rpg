extends KinematicBody2D

var speed = 200

var velocity = Vector2()

func get_movement():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
func _input(event):
	if(event.is_action_pressed("ui_accept")):
		var target = $RayCast2D.get_collider();
		if (target != null && target.is_in_group("NPCs")):
			print("We found a vulnerable NPC!");
			target.interact();
			get_tree().set_input_as_handled();
		else:
			print("You're a dum dum.")

func _physics_process(_delta):
	get_movement()
	velocity = move_and_slide(velocity)
	
func _on_message_requested():
	set_process_input(false);
	set_physics_process(false)

func _on_message_finished():
	set_process_input(true);
	set_physics_process(true)
