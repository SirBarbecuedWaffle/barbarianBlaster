extends MarginContainer
@export var startingGold:=150
@onready var label: Label = $Label
@export var gold:=150:
	set(new_gold):
		gold=max(0,new_gold)
		label.text="Gold: "+str(gold)
