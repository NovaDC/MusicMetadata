@tool
@icon("res://addons/MusicMetadata/icon.svg")
extends EditorPlugin

const PLUGIN_NAME := "MusicMetadata"

const PLUGIN_ICON := preload("res://addons/MusicMetadata/icon.svg")

const ENSURE_SCRIPT_DOCS:Array[Script] = [
	preload("res://addons/MusicMetadata/MusicMetadata.gd"),
	preload("res://addons/MusicMetadata/MusicMetadataTools.gd"),
]

# Every once ands a while the script docs simply refuse to update properly.
# This nudges the docs into a ensuring that the important scripts added by
# this addon are actually loaded.
func _ensure_script_docs() -> void:
	var edit := get_editor_interface().get_script_editor()
	for scr in ENSURE_SCRIPT_DOCS:
		edit.update_docs_from_script(scr)

func _enter_tree() -> void:
	_ensure_script_docs()
	if EditorInterface.is_plugin_enabled(PLUGIN_NAME):
		_init_plugin()

func _exit_tree() -> void:
	_deinit_plugin()

func _enable_plugin() -> void:
	_ensure_script_docs()
	_init_plugin()

func _disable_plugin() -> void:
	_deinit_plugin()

func _get_plugin_name() -> String:
	return PLUGIN_NAME

func _get_plugin_icon() -> Texture2D:
	return PLUGIN_ICON

func _init_plugin() -> void:
	pass #TODO
func _deinit_plugin() -> void:
	pass #TODO
