extends Node2D

@onready var fail_img = preload("res://assets/失败.png")
@onready var success_img = preload("res://assets/胜利.png")
@onready var bee = preload("res://bee.tscn")
var bee_pos

func gameover(img):
  get_tree().paused = true
  $TipSprite2D.texture = img
  $TipSprite2D.show()

# Called when the node enters the scene tree for the first time.
func _ready():
  $TipSprite2D.texture = null
  $Timer.start(0.75)
  bee_pos = [$LeftMarker2D.position, $RightMarker2D.position]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass

func _on_player_gameover():
  gameover(fail_img)

func _on_monkey_gamefail():
  gameover(fail_img)

func _on_monkey_gamepass():
  gameover(success_img)

func _on_timer_timeout():
  var new_bee = bee.instantiate()
  $Bee.add_child(new_bee)
  new_bee.attack_player(bee_pos.pick_random(), $Player.global_position)
