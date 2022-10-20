extends Object
class_name Atsumaru

# https://atsumaru.github.io/api-references/


static func is_available():
	if !OS.has_feature("JavaScript"): return false
	return JavaScript.eval("window.RPGAtsumaru !== undefined;")


static func scoreboards__set_record(boardId: int, score: int):
	JavaScript.eval("window.RPGAtsumaru.scoreboards.setRecord(%d, %d);" % boardId % score)

static func scoreboards__display(boardId: int):
	JavaScript.eval("window.RPGAtsumaru.scoreboards.display(%d);" % boardId)


static func popups__display_thanks_modal():
	JavaScript.eval("window.RPGAtsumaru.popups.displayThanksModal();")

static func popups__set_thanks_settings(setting):
	var setting_json := to_json(setting)
	JavaScript.eval("window.RPGAtsumaru.popups.setThanksSettings(JSON.parse(\"%s\"));" % setting_json)


static func user__get_self_information(obj, callback) :
	# Promiseの処理方法はコールバックを使う必要がある
	# 上手いことラップする方法はないだろうか？
	var cb = JavaScript.create_callback(obj, callback)
	var window = JavaScript.get_interface("window")
	window.RPGAtsumaru.user.getSelfInformation().then(cb)


static func comment__change_scene(scene: String):
	JavaScript.eval("window.RPGAtsumaru.comment.changeScene(%s);" % scene)

static func comment__reset_and_change_scene(scene: String):
	JavaScript.eval("window.RPGAtsumaru.comment.resetAndChangeScene(%s);" % scene)

static func comment__set_context(context: String):
	JavaScript.eval("window.RPGAtsumaru.comment.setContext(%s);" % context);


