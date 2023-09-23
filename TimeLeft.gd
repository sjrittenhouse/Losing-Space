extends RichTextLabel


@onready var timer = $"../../Timer"
var timeLeft : int


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeLeft = int(timer.get_time_left())
	self.set_text(str("[right]",timeLeft,"[/right]"))

	
