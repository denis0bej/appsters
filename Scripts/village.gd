extends Node2D

var fade := false
var fading_out := false  # true = fading to black, false = fading back in
var cnt := 0.0

func _ready() -> void:
	$Player.still = true
	$FadeToBlack.visible = true
	$AnimationPlayer/Knight2.z_index = 0
	$FadeToBlack.modulate.a = 0.0  # Start transparent
	$FadeToBlack.z_index = 999  # Make sure it's in front

	$AnimationPlayer.play("prince_greeting")
	await get_tree().create_timer(0.5).timeout
	$"Camera2D/Dialogue".show_dialogue("Mommy is so annoyingg!! Arghh..")
	await get_tree().create_timer(3.5).timeout
	$"Camera2D/Dialogue".show_dialogue("HUH?!")
	await get_tree().create_timer(1).timeout
	$"Camera2D/Dialogue".show_dialogue("WHAT IS THIS PEASEANT DOING IN MY GARDEN?!")
	await get_tree().create_timer(3).timeout
	$"Camera2D/Dialogue".show_dialogue("Guards, get him!!")
	await get_tree().create_timer(1.5).timeout
	$"Camera2D/Dialogue".show_dialogue("But KEEP the doggo, I like doggo...")

	fade = true
	fading_out = true  # start fading to black

	await get_tree().create_timer(5).timeout
	$"Camera2D/Dialogue".hide()

func _physics_process(delta: float) -> void:
	if fade:
		if fading_out:
			cnt = clamp(cnt + delta * 0.25, 0.0, 1.0)
			$FadeToBlack.modulate.a = cnt
			if cnt >= 1.0:
				await get_tree().create_timer(1.5).timeout  # Optional pause while black
				fading_out = false  # Start fading back in
		else:
			cnt = clamp(cnt - delta * 0.25, 0.0, 1.0)
			$FadeToBlack.modulate.a = cnt
			if cnt <= 0.0:
				fade = false  # Fade complete
				sec_anim()


func sec_anim():
	$AnimationPlayer/Prince.visible = false
	$AnimationPlayer/Knight.visible = false
	$AnimationPlayer/Knight2.visible = false
	$doggy.visible = false
	$"Camera2D/Dialogue".show()
	await get_tree().create_timer(1).timeout
	$"Camera2D/Dialogue".show_dialogue("Hii, sorry about my brother, he's a douchebag")
	await get_tree().create_timer(3).timeout
	$"Camera2D/Dialogue".show_dialogue("That rock looks just like the one my grandpa\nfound this morning! You should really talk to him.")
	await get_tree().create_timer(7).timeout
	$"Camera2D/Dialogue".show_dialogue("He will most likely sell or trade it to you if you\ngive him what he wants")
	await get_tree().create_timer(6).timeout
	$"Camera2D/Dialogue".show_dialogue("Sorry but I have to go, Mommy's gonna be mad")
	await get_tree().create_timer(7).timeout
	$"Camera2D/Dialogue".hide()
	await get_tree().create_timer(1.5).timeout
	$Camera2D/Control/Slot1/Item1.texture = $AnimationPlayer/ArtefactBw.texture
	$Player.still = false
