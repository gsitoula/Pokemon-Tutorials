
extends Area2D

var current_page
var player

func set_page(page):
	current_page = page

func _ready():
	player=Globals.get("player")
	if (get_node("pages").get_child_count() > 0):
		current_page = get_node("pages").get_child(0)

func exec():
	if (current_page == null):
		return
	player.can_interact = false
	current_page.run()
	yield(current_page, "finished")
	player.can_interact = true

func exec_this_page(page):
	if (page<0 or page>=get_node("pages").get_child_count()):
		return
	var p = get_node("pages").get_child(page)
	player.can_interact = false
	p.run()
	yield(p, "finished")
	player.can_interact = true
