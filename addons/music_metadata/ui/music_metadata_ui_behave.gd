@tool
@icon("../icon.svg")
extends Control

## The current [MusicMetadata] object being displayed at this time.
@export var metadata:MusicMetadata:
	get:
		return get_metadata()
	set(_value):
		set_metadata(_value)

## A reference to the [TextureRect] used to display the result of
## [method MusicMetadata.get_most_relevent_cover].
@export var art_display:TextureRect = null
## A reference to the [Label] used to display the [member MusicMetadata.title].
@export var title_display:Label = null
## A reference to the [Label] used to display the result of
## [method MusicMetadata.get_most_relevent_artist].
@export var artist_display:Label = null
## A reference to the [Label] used to display the [member MusicMetadata.album].
@export var album_display:Label = null
## A reference to the [Label] used to display the [member MusicMetadata.comments].
@export var description_display:Label = null
## A reference to the [Label] used to display the [member MusicMetadata.urls].
@export var url_display:Label = null

## Used to format the contents of the [member album_display].
## It's a string only formatted with one value, [member MusicMetadata.album].
@export var album_format:String = "From %s"
## Used to format the contents of the [member artist_display].
## It's a string formatted with two values,
## [member MusicMetadata.artist] and [member MusicMetadata.album_artist].
@export var artist_format:String = "By %s"
## Used to format the contents of the [member description_display].
## It's a string only formatted with one value, [member MusicMetadata.comments].
@export var description_format:String = "%s"
## Used to format the contents of the [member description_display].
## This string is formatted once each with url type and url (in that respective order)
## in [member MusicMetadata.urls]; each of those becoming a new line in
## [member description_display].
@export var url_format:String = "%s link: %s"

# ## This is intended to be private.
# ## A backing variable for [metadata].
var _metadata = null

func _enter_tree() -> void:
	_hook_property_changed()
	update_ui()

func _ready() -> void:
	_hook_property_changed()
	update_ui()

func _exit_tree() -> void:
	_unhook_property_changed()

## Sets the displayed [member metadata] from the given [param metadata].
func set_metadata(metadata:MusicMetadata) -> void:
	_unhook_property_changed()
	_metadata = metadata
	_hook_property_changed()
	update_ui()

## Returns the displayed [member metadata].
func get_metadata() -> MusicMetadata:
	return _metadata

## Updates the UI status form the current state of [member metadata].
## Used internally when [member metadata] is changed or modified.
func update_ui() -> void:
	if art_display != null:
		if metadata != null and metadata.get_most_relevent_cover() != null:
			art_display.visible = true
			art_display.texture = metadata.get_most_relevent_cover()
		else:
			art_display.visible = false

	if title_display != null:
		if metadata != null and metadata.title != "":
			title_display.visible = true
			title_display.text = metadata.title
		else:
			title_display.visible = false

	if artist_display != null:
		if metadata != null and metadata.get_most_relevent_artist() != "":
			artist_display.visible = true
			artist_display.text = artist_format % [metadata.get_most_relevent_artist()]
		else:
			artist_display.visible = false

	if album_display != null:
		if metadata != null and metadata.album != "":
			album_display.visible = true
			album_display.text = album_format % [metadata.album]
		else:
			album_display.visible = false

	if description_display != null:
		if metadata != null and metadata.comments != "":
			description_display.visible = true
			description_display.text = description_format % metadata.comments
		else:
			description_display.visible = false

	if url_display != null:
		if metadata != null and len(metadata.urls) > 0:
			url_display.visible = true
			url_display.text = ""
			for url_type in metadata.urls.keys():
				url_display.text += url_format % [url_type, metadata.urls[url_type]]
		else:
			url_display.visible = false

# ## This method is intended to be private.
# ## Used to hook [method update_ui] to [member metadata]'s [signal MusicMetadata.changed] signal.
func _hook_property_changed() -> void:
	if metadata != null and not metadata.changed.is_connected(update_ui):
		metadata.changed.connect(update_ui)

# ## This method is intended to be private.
# ## Used to unhook [method update_ui] to [member metadata]'s [signal MusicMetadata.changed] signal.
func _unhook_property_changed() -> void:
	if metadata != null and metadata.changed.is_connected(update_ui):
		metadata.changed.disconnect(update_ui)
