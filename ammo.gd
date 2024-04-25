extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  position.y -= 80 * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
  queue_free()


func _on_area_2d_area_entered(area):
  if area.name != "AreaPlayer":
    queue_free()
