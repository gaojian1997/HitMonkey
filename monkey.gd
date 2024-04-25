extends Node2D

var speed = 0
signal gamepass
signal gamefail


# Called when the node enters the scene tree for the first time.
func _ready():
  $AnimatedSprite2D.play("down")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  if position.y < 110:
   position.y += speed * delta

func _on_area_monkey_area_entered(area: Area2D):
  if area.is_in_group("ammo"):
    $AnimatedSprite2D.play("up")
  if area.name == 'AreaBeehive':
    $AnimatedSprite2D.play("die")
    gamepass.emit()

func _on_animated_sprite_2d_animation_finished():
  if $AnimatedSprite2D.animation == "up":
    $AnimatedSprite2D.play("down")


func _on_animated_sprite_2d_frame_changed():
  if $AnimatedSprite2D.animation == "down":
    if $AnimatedSprite2D.frame == 1 or $AnimatedSprite2D.frame == 4:
      speed = 5
  if $AnimatedSprite2D.animation == "up":
    if $AnimatedSprite2D.frame == 1 or $AnimatedSprite2D.frame == 4:
      speed = -7.5
