extends KinematicBody2D

# Variables
var velocity = Vector2.ZERO 


# Called when the node enters the scene tree for the first time.
func _ready():
	print ("Hello World")
	

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		print ("Pressed Right Arrow Key")
		velocity.x = 10
	if Input.is_action_pressed("ui_left"):
		print ("Pressed Left Arrow Key")
		velocity.x = -10
	if Input.is_action_pressed("ui_up"):
		print ("Pressed Up Arrow Key")
		velocity.y = -10
	if Input.is_action_pressed("ui_down"):
		print ("Pressed Down Arrow Key")
		velocity.y = 10
	move_and_collide(velocity)




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
