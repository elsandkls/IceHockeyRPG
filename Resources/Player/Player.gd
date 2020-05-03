extends KinematicBody2D

# Constants
const MAX_SPEED = 100
const ACCELERATION = 200
const FRICTION = 400

# Variables
var velocity = Vector2.ZERO 
var input_vector = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	print ("Hello World")
	

func _physics_process(delta):
	
	# Lesson 2
	# analog dpad or stick control - includes diagonals
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
	else:
		velocity = Vector2.ZERO
		
	# Lesson 1
	# Basic Keyboard action control - no diagonals	
	#if Input.is_action_pressed("ui_right"):
	#	print ("Pressed Right Arrow Key")
	#	velocity.x = 4
	#elif Input.is_action_pressed("ui_left"):
	#	print ("Pressed Left Arrow Key")
	#	velocity.x = -4
	#else:
	#	print ("No Left or Right Key Pressed")
	#	velocity.x = 0	
		
	#if Input.is_action_pressed("ui_up"):
	#	print ("Pressed Up Arrow Key")
	#	velocity.y = -4
	#elif Input.is_action_pressed("ui_down"):
	#	print ("Pressed Down Arrow Key")
	#	velocity.y = 4
	#else:
	#	print ("No Up or Down Key Pressed")
	#	velocity.y = 0
		
	move_and_collide(velocity * delta)




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass