@tool
@icon("res://addons/MusicMetadata/icon.svg")
class_name MusicMetadata
extends Resource

## Parses and contains common music file metadata.
##
## This class contains common metadata tags parsed from music files, with the ability to parse
## some formats of metadata from these files. The user may also use this as a means to
## store manually defined metadata about music tracks, as the data contained is not automatically
## linked to any changes made after the parsing of a file.
## See [code] MusicMetadataUIBehave [/code] for a UI implementation example
## (or use it directly).[br][br]
## Tags defined in a [MusicMetadata] instance will also be available as a named property,
## providing that they are an acceptable property name for a GDScript class
## (though still always being available thorough other relevant methods).
## Since all explicitly exported properties (besides the [member tags] property)
## are backed by the same content in the [member tags] [Dictionary],
## the states of these exported properties will always match those in the [member tags dictionary],
## as well as the states retrieved from or modified by the various methods related to tags.
## Any metadata tag with the reserved name of "tags"
## or "_property_name_cache" will always be remapped to a tag with the name plus a
## "_" character appended to the end.
## For example, since "tags" is a reserved tag name,
## "tags" and "tags_" will always refer to the same metadata.

## Seconds per minute, used for internal calculations.
const SEC_PER_MIN = 60

## The track's [i]Beats Per Minute[/i].
@export var bpm:int = 0:
	get:
		return get_tag("bpm", 0)
	set(_value):
		set_tag("bpm", _value)
## The track's [i]Beats Per second[/i].
@export var bps:int:
	get:
		return bpm * SEC_PER_MIN
	set(_value):
		bpm = int(_value / SEC_PER_MIN)
## The track's [i]Title[/i].
@export var title:String:
	get:
		return get_tag("title", "")
	set(_value):
		set_tag("title", _value)
## The track's [i]Album Name[/i].
@export var album:String:
	get:
		return get_tag("album", "")
	set(_value):
		set_tag("album", _value)
## The track's [i]Number[/i].
@export var track_no:int = -1:
	get:
		return get_tag("track_no", -1)
	set(_value):
		set_tag("track_no", _value)
## The track's [i]Artist[/i].
@export var artist:String:
	get:
		return get_tag("artist", "")
	set(_value):
		set_tag("artist", _value)
## The track's [i]Album's Artist[/i]. Sometimes known as the [i]Band Name[/i].
@export var album_artist:String:
	get:
		return get_tag("album_artist", "")
	set(_value):
		set_tag("album_artist", _value)
## The track's [i]Cover Image[/i].
@export var cover:ImageTexture:
	get:
		return get_tag("cover", null)
	set(_value):
		set_tag("cover", _value)
## The album's [i]Cover Image[/i].
@export var album_cover:ImageTexture:
	get:
		return get_tag("album_cover", null)
	set(_value):
		set_tag("album_cover", _value)
## The track's [i]Genre[/i].
@export var genre:String:
	get:
		return get_tag("genre", "")
	set(_value):
		set_tag("genre", _value)
## The track's [i]Year[/i].
@export var year:int:
	get:
		return get_tag("year", 0)
	set(_value):
		set_tag("year", _value)
## The track's [i]Date[/i].
@export var date:String:
	get:
		return get_tag("date", "")
	set(_value):
		set_tag("date", _value)
## The track's [i]Comments[/i].[br]
## Note that other text fields that arn't specifically
## comments will instead be stored in the [member user_defined_texts].
@export_multiline var comments:String:
	get:
		return get_tag("comments", "")
	set(_value):
		set_tag("comments", _value)
## The track's [i]User Defined Text[/i] entries.
## There may be multiple. The order of these will not typically matter,
## unless a specific type of metadata specified otherwise.
## This should only be used when the text in this feild cannot be applied as its own tag,
## and should not apply to other common string based tags,
## such as those in [member urls] or [member comments].
@export_multiline var user_defined_texts:Array[String]:
	get:
		return Array(get_tag("user_defined_texts", []) , TYPE_STRING, "", null)
	set(_value):
		set_tag("user_defined_texts", _value)
## The track's [i]Urls[/i].
## It's keys are of [String]s with the type of url, it's values are of [String]s with the url.
@export var urls:Dictionary:
	get:
		return get_tag("urls", {})
	set(_value):
		set_tag("urls", _value)
## The track's [i]Copyright Message[/i].
## This is a more general string of a copyright message,
## not specifically corelating to any copyright date.
@export var copyright:String:
	get:
		return get_tag("copyright", "")
	set(_value):
		set_tag("copyright", _value)
## The track's [i]Terms Of Use[/i].
## This may also be contained in something like the copyright or other user defined texts,
## but when its specifically labeled, independent of other forms of string messages,
## a feild that corelates to the terms of use of a track should be specified here.
@export var terms_of_use:String = "":
	get:
		return get_tag("terms_of_use", "")
	set(_value):
		set_tag("terms_of_use", _value)

# ## This property is intended to be private.
# ## The backing variable used to store all metadata tags in a instance.
# ## This is only exported the sake of serialization, not for inspector use.
# ## Use the relevant [code]*_tag[/code] methods instead.
@export var _tags := {}

## A [b]read only copy[/b] of all tags stored internally in this class.
## To modify this dictionary, the relevant [code]*_tag[/code] methods instead.
## This property is not settable.
var tags:Dictionary:
	get:
		var ret := _tags.duplicate()
		ret.make_read_only()
		return ret

# ## This property is intended to be private.
# ## A cache used to store the specifically defined export names from this script,
# ## when possible.
# ## This is inly to be modified or used in the [method _get_property_list] override
# ## defined later in this script.
# ## Accidental modification of this variable will likely result
# ## in recursion errors when retreving the property list of instances of this object.
var _property_name_cache := PackedStringArray()

# ## This method is intended to be private.
# ## Takes a string and normalizes it into the from used for keys in the internal
# ## [member _tags] [Dictionary].
# ## This also handles the edge case of a metadata tag named itself "tags",
# ## normalizing it to always avoid a name that would conflict with the property
## of [member tags] defined on this object.
func _normalize_tag_name(tag_name:String) -> String:
	tag_name = tag_name.to_lower().strip_edges().replace_chars("- ", "_".unicode_at(0))
	if tag_name in ["tags", "_property_name_cache"]:
		tag_name += "_"
	return tag_name

## Returns the associated metadata with the tag named [param tag_name], falling back to
## [param default] if the tag is not defined.
func get_tag(tag_name:String, default:Variant = null) -> Variant:
	return _tags.get(_normalize_tag_name(tag_name), default)

## Sets the associated metadata to the tag named [param tag_name] to the value
## of [param value].
func set_tag(tag_name:String, value:Variant = null) -> void:
	_tags.set(_normalize_tag_name(tag_name), value)

## Erases tag named [param tag_name],
## returning weather or not that tag was defined in the first place.
func erase_tag(tag_name:String) -> bool:
	return _tags.erase(_normalize_tag_name(tag_name))

## Returns weather or not a tag has been defined in this instance.
func has_tag(tag_name:String) -> bool:
	return _normalize_tag_name(tag_name) in _tags

## Gets all defined tags for this instance.
func get_defined_tags() -> Array[String]:
	return Array(_tags.keys(), TYPE_STRING, "", null)

func _get(property: StringName) -> Variant:
	return get_tag(property, null)

func _set(property: StringName, value: Variant) -> bool:
	if has_tag(property):
		set_tag(property, value)
		return true
	return false

func _get_property_list() -> Array[Dictionary]:
	var ret:Array[Dictionary] = []
	if _property_name_cache.is_empty() and get_script() != null:
		var names:Array = get_script().get_script_property_list().map(func(p:Dictionary): return p.name)
		_property_name_cache = PackedStringArray(names)
	var tags := get_defined_tags()
	for tag in tags.filter(func (p:String): return p not in _property_name_cache):
		var current_val := get_tag(tag)
		ret.append({
			"name":"other_tags/" + tag,
			"type":typeof(current_val),
			"class_name":("" if typeof(current_val) != TYPE_OBJECT else current_val.get_class()),
			"usage":PROPERTY_USAGE_READ_ONLY,
		})
	return ret

func _validate_property(property: Dictionary) -> void:
	match (property.name):
		"_tags":
			property.usage &= ~PROPERTY_USAGE_EDITOR
		"tags":
			property.usage |= PROPERTY_USAGE_READ_ONLY

## Retrieves the most relevant artist, returning [member artist] when its not empty,
## or falling back to [member album_artist] otherwise.
func get_most_relevent_artist() -> String:
	if not artist.is_empty():
		return artist
	return album_artist

## Retrieves the most relevant cover art, returning [member cover] when its not null,
## or falling back to [member album_cover] otherwise.
func get_most_relevent_cover() -> ImageTexture:
	if cover != null:
		return cover
	return album_cover

## This static method handles unwrapping common types of meta-[AudioStreams],
## creating an instance of [MusicMetadata] for any stream that would
## originally contain supported audio file data,
## recursing through potentially nested meta-[AudioStreams].
## For more information on what is consitered an meta-[AudioStreams]
## and how these are unpacked, see [member MusicMetadataTools.flatten_meta_streams].
static func from_audio_stream_unpacked(stream:AudioStream) -> Array[MusicMetadata]:
	return MusicMetadataTools.flatten_meta_streams(stream).map(MusicMetadata.new)

## Create a [MusicMetadata] [Resource].
## If not [code]null[/code], [param source] will update the new [MusicMetadata] [Resource]
## with any appropriate data found. This data could be a form of integer array, interprited as
## a representation of the original bytes of a audio file,
## a [AudioStream] instance, imported from the audio file that metadata
## should be attempted to be retrieved from,
## or a [Dictionary] or another [MusicMetadata] instance,
## which will have it contents merged into the [member tags] stored in this class.
func _init(source:Variant = null):
	if source == null:
		return
	match (typeof(source)):
		TYPE_OBJECT:
			if source is AudioStream:
				update_from_stream(source)
			elif source is MusicMetadata:
				update_from_meta(source)
			else:
				assert(false, "Bad Object Type")
		TYPE_ARRAY, TYPE_PACKED_BYTE_ARRAY, TYPE_PACKED_INT32_ARRAY, TYPE_PACKED_INT64_ARRAY:
			update_from_bytes(PackedByteArray(source))
		TYPE_DICTIONARY:
			update_from_dict(source)

## Updates this object to include tags from the provided [AudioStream] [param stream].
## This included properties relates to the bpm and beat counts, as set when importing, as well
## as the potential [code]tags[/code] property that may occur in certain subclasses
## of [AudioStream] (such as [AudioStreamWAV]).
## This will abort when it first encounters an error when parsing returning that error,
## otherwise returning OK.
## Note that due to many factors resulting in the importing process of certain audio formats,
## as well as the many formats of embedding metadata in music files, ther may likely be
## situations where this method may return nothing.
## Also not that, when at all possible, this method will attempt to also
## use [member update_from_bytes] when a section or the entirely of the
## original file's data could be found via the resource it was imported as.
func update_from_stream(stream:AudioStream) -> int:
	var err:int = OK

	var bytes := MusicMetadataTools.bytes_from_audio(stream)
	if not bytes.is_empty():
		err = update_from_bytes(bytes)
		if err != OK:
			return err

	var update := {}
	err = MusicMetadataTools.parse_godot_properties(stream, update)
	if err != OK:
		return err

	return update_from_dict(update)

## Updates this object to include tags from the provided [MusicMetadata] [param meta].
## THis will not modify or erase any tags not already defined in the provided [param meta].
## This will abort when it first encounters an error when parsing returning that error,
## otherwise returning OK.
func update_from_meta(meta:MusicMetadata) -> int:
	return update_from_dict(meta.tags)

## Updates this object to include tags from the [PackedByteArray] data [param bytes]
## expecting that these bytes are a large enough section of an audio file that
## to allow for the parsing of any available metadata content.
## This will abort when it first encounters an error when parsing returning that error,
## otherwise returning OK.
func update_from_bytes(bytes:PackedByteArray) -> int:
	var err:int = OK

	var update := {}
	err = MusicMetadataTools.parse_id3_tags(bytes, update, PackedByteArray(), true)
	if err != OK:
		return err

	return update_from_dict(update)

## Updates this object to include tags from the provided [Dictionary] [param dict].
## This will not modify or erase any tags not already defined in the provided [param dict].
## This will abort when it first encounters an error when parsing returning that error,
## otherwise returning OK.
func update_from_dict(dict:Dictionary) -> int:
	for tag in dict.keys():
		set_tag(tag, dict[tag])
	return OK

## This updates the [code]tags[/code] member provided [AudioStream] [param stream]
## to the same values defined in this instances's [member tags].
## If [param stream]s does not provide a [code]tags[/code] property,
## this will silently be skipped.
## This will not remove tags already defined in the [param stream]'s [code]tags[/code]
## that are not defined in this instance.
## When [param include_timings] is set, the [member AudioStream.bar_beats],
## [member AudioStream.beat_count], and [member AudioStream.bpm]
## properties of the [param stream] will be set to a tag of the same name in this instance,
## provided that a tag of that name is defined. Note that this does not exclude that tag
## from also being stored in the updated [code]tags[/code]
func save_into_stream_meta(stream:AudioStream, include_timings := false) -> int:
	if include_timings:
		for prop in ["bar_beats", "beat_count", "bpm"]:
			if prop in tags:
				stream.set(prop, get_tag(prop))

	if "tags" in stream:
		stream.tags.merge(tags, true)

	return OK

## Prints some of the metadata info to the output.
## This will not include all tags, only a specifically defined few.
func print_common_info() -> void:
	print("title: ", title)
	print("artist: ", artist)
	print("album: ", album)
	print("genre: ", genre)
	print("bpm: ", bpm)
	print("year: ", year)
