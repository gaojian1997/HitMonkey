extends Node2D

signal gameover
@onready var fire_bullets = preload("res://ammo.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  if Input.is_action_pressed("left"):
    position.x -= 100 * delta
    scale.x = 1
    $AnimationPlayer.play("run")
  elif Input.is_action_pressed("right"):
    position.x += 100 * delta
    scale.x = -1
    $AnimationPlayer.play("run")
  else:
    $AnimationPlayer.play("idle")
  position.x = clampf(position.x, 80, 180)
  if Input.is_action_just_pressed("fire"):
    var ammo = fire_bullets.instantiate()
    get_parent().get_node("子弹").add_child(ammo)
    ammo.global_position = $Marker2D.global_position
    
func _on_area_2d_area_entered(area):
  if area.is_in_group("bees") or area.name == "AreaMonkey":
    set_process(false)
    $AnimationPlayer.play("die")

func _on_animation_player_animation_finished(anim_name):
  if anim_name == "die":
    gameover.emit()
    
