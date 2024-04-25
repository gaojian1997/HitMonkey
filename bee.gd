extends Node2D

var dir

func attack_player(pos, player):
  position = pos
  dir = position.direction_to(player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  if dir:
    position += 75 * dir * delta

func _on_bee_area_2d_area_entered(area):
  if area.is_in_group("ammo"):
    queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
  queue_free()
