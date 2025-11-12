@tool
@icon("./icon.svg")
extends EditorPlugin

const PLUGIN_NAME := "music_metadata"

const PLUGIN_ICON := preload("./icon.svg")

const ENSURE_SCRIPT_DOCS:Array[Script] = [
	preload("./music_metadata.gd"),
	preload("./music_metadata_tools.gd"),
	preload("./music_metadata_importer.gd"),
]

var _importer:ResourceImporterMusicMetadata = null

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
	if _importer == null:
		_importer = ResourceImporterMusicMetadata.new()
		add_import_plugin(_importer)

func _deinit_plugin() -> void:
	if _importer != null:
		remove_import_plugin(_importer)
		_importer = null
