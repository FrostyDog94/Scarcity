extends AudioStreamPlayer

const music = preload("res://Sounds/One Man Symphony - A New Day's Hurry (Free) - 01 A New Day Begins (General Background Music).mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _play_audio(music: AudioStream, volume = 0.0):
	stream = music
	volume_db = volume
	play(0)
	
	
func _play_audio_level():
	_play_audio(music)
