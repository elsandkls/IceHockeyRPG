extends KinematicBody2D

# Constants
const MAX_SPEED = 80
const ACCELERATION = 500
const FRICTION = 500

# Variables
var velocity = Vector2.ZERO 
var input_vector = Vector2.ZERO 
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	print ("Begin Game") 

# note to self delta is 1/60th of a second.
func _physics_process(delta):
	# Lesson 2
	# analog dpad or stick control - includes diagonals
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	#Lesson 5 - Using AnimationTree
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		print(velocity)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = velocity.clamped(MAX_SPEED)
	velocity = move_and_slide(velocity)
			
			
