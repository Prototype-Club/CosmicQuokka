extends CanvasLayer

@onready var distanceLabel = $DistanceLabel
@onready var countdown = $Countdown

func _ready() -> void:
	countdown.start()

func distance_to_earth():
	var time_left = countdown.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left)
	return [second]

func _process(delta: float) -> void:
	distanceLabel.text = "%02d" %distance_to_earth()
