class_name MusicMetadataTools

## Maps the series of preset ID3 genre's to their readable genre name
const ID3_GENRE_IDS:Dictionary = {
	'0' : "Blues",
	'1' : "Classic Rock",
	'2' : "Country",
	'3' : "Dance",
	'4' : "Disco",
	'5' : "Funk",
	'6' : "Grunge",
	'7' : "Hip-Hop",
	'8' : "Jazz",
	'9' : 'Metal',
	'10' : "New Age",
	'11' : "Oldies",
	'12' : "Other",
	'13' : "Pop",
	'14' : "R&B",
	'15' : "Rap",
	'16' : "Reggae",
	'17' : "Rock",
	'18' : "Techno",
	'19': "Industrial",
	'20' : "Alternative",
	'21' : "Ska",
	'22' : "Death Metal",
	'23' : "Pranks",
	'24' : "Soundtrack",
	'25' : "Euro-Techno",
	'26' : "Ambient",
	'27' : "Trip-Hop",
	'28' : "Vocal",
	'29' : "Jazz+Funk",
	'30' : "Fusion",
	'31' : "Trance",
	'32' : "Classical",
	'33' : "Instrumental",
	'34' : "Acid",
	'35' : "House",
	'36' : "Game",
	'37' : "Sound Clip",
	'38' : "Gospel",
	'39' : "Noise",
	'40' : "Alt. Rock",
	'41' : "Bass",
	'42' : "Soul",
	'43' : "Punk",
	'44' : "Space",
	'45' : "Meditative",
	'46' : "Instrumental Pop",
	'47' : "Instrumental Rock",
	'48' : "Ethnic",
	'49' : "Gothic",
	'50' : "Darkwave",
	'51' : "Techno-Industrial",
	'52' : "Electronic",
	'53' : "Pop-Folk",
	'54' : "Eurodance",
	'55' : "Dream",
	'56' : "Southern Rock",
	'57' : "Comedy",
	'58' : "Cult",
	'59' : "Gangsta Rap",
	'60' : "Top 40",
	'61' : "Christian Rap",
	'62' : "Pop/Funk",
	'63' : "Jungle",
	'64' : "Native American",
	'65' : "Cabaret",
	'66' : "New Wave",
	'67' : "Psychedelic",
	'68' : "Rave",
	'69' : "Showtunes",
	'70' : "Trailer",
	'71' : "Lo-Fi",
	'72' : "Tribal",
	'73' : "Acid Punk",
	'74' : "Acid Jazz",
	'75' : "Polka",
	'76' : "Retro",
	'77' : 'Musical',
	'78' : "Rock & Roll",
	'79' : 'Hard Rock',
	'80' : "Folk",
	'81' : "Folk-Rock",
	'82' : 'National Folk',
	'83' : "Swing",
	'84' : 'Fast-Fusion',
	'85' : 'Bebop',
	'86' : 'Latin',
	'87' : 'Revival',
	'88' : 'Celtic',
	'89' : 'Bluegrass',
	'90' : 'Avantgarde',
	'91' : 'Gothic Rock',
	'92' : 'Progressive Rock',
	'93' : 'Psychedelic Rock',
	'94' : 'Symphonic Rock',
	'95' : 'Slow Rock',
	'96' : 'Big Band',
	'97' : 'Chorus',
	'98' : 'Easy Listening',
	'99' : 'Acoustic',
	'100' : 'Humour',
	'101' : 'Speech',
	'102' : 'Chanson',
	'103' : 'Opera',
	'104' : 'Chamber Music',
	'105' : 'Sonata',
	'106' : 'Symphony',
	'107' : 'Booty Bass',
	'108' : 'Primus',
	'109' : 'Porn Groove',
	'110' : 'Satire',
	'111' : 'Slow Jam',
	'112' : 'Club',
	'113' : 'Tango',
	'114' : 'Samba',
	'115' : 'Folklore',
	'116' : 'Ballad',
	'117' : 'Power Ballad',
	'118' : 'Rhythmic Soul',
	'119' : 'Freestyle',
	'120' : 'Duet',
	'121' : 'Punk Rock',
	'122' : 'Drum Solo',
	'123' : 'A Cappella',
	'124' : 'Euro-House',
	'125' : 'Dance Hall',
	'126' : 'Goa',
	'127' : 'Drum & Bass',
	'128' : 'Club-House',
	'129' : 'Hardcore',
	'130' : 'Terror',
	'131' : 'Indie',
	'132' : 'BritPop',
	'133' : 'Afro-Punk',
	'134' : 'Polsk Punk',
	'135' : 'Beat',
	'136' : 'Christian Gangsta Rap',
	'137' : 'Heavy Metal',
	'138' : 'Black Metal',
	'139' : 'Crossover',
	'140' : 'Contemporary Christian',
	'141' : 'Christian Rock',
	'142' : 'Merengue',
	'143' : 'Salsa',
	'144' : 'Thrash Metal',
	'145' : 'Anime',
	'146' : 'JPop',
	'147' : 'Synthpop',
	'148' : 'Abstract',
	'149' : 'Art Rock',
	'150' : 'Baroque',
	'151' : 'Bhangra',
	'152' : 'Big Beat',
	'153' : 'Breakbeat',
	'154' : 'Chillout',
	'155' : 'Downtempo',
	'156' : 'Dub',
	'157' : 'EBM',
	'158' : 'Eclectic',
	'159' : 'Electro',
	'160' : 'Electroclash',
	'161' : 'Emo',
	'162' : 'Experimental',
	'163' : 'Garage',
	'164' : 'Global',
	'165' : 'IDM',
	'166' : 'Illbient',
	'167' : 'Industro-Goth',
	'168' : 'Jam Band',
	'169' : 'Krautrock',
	'170' : 'Leftfield',
	'171' : 'Lounge',
	'172' : 'Math Rock',
	'173' : 'New Romantic',
	'174' : 'Nu-Breakz',
	'175' : 'Post-Punk',
	'176' : 'Post-Rock',
	'177' : 'Psytrance',
	'178' : 'Shoegaze',
	'179' : 'Space Rock',
	'180' : 'Trop Rock',
	'181' : 'World Music',
	'182' : 'Neoclassical',
	'183' : 'Audiobook',
	'184' : 'Audio Theatre',
	'185' : 'Neue Deutsche Welle',
	'186' : 'Podcast',
	'187' : 'Indie Rock',
	'188' : 'G-Funk',
	'189' : 'Dubstep',
	'190' : 'Garage Rock',
	'191' : 'Psybient',
	'CR' : 'Cover',
	'RX' : 'Remix'
}

## Maps some ID3 frame names to a more formal english name
const ID3_FRAME_ID_TO_URL_NAME:Dictionary = {
	"WCOM" : "Commercial",
	'WCOP' : "Copyright",
	'WFED' : "Podcast",
	'WOAF' : "File",
	'WOAR' : "Artist",
	'WOAS' : "Source",
	'WORS' : "InternetRadioStation",
	'WPAY' : "Payment",
	'WPUB' : "Publisher",
	'WXXX' : "Custom",
	'WAF' : "File",
	'WAR' : "Artist",
	'WAS' : "Source",
	'WCM' : "Commercial",
	'WCP' : "Copyright",
	'WPB' : "Publisher",
	'WXX' : "UserDefined"
}

## The initial 3 ASCII characters of a ID3 tagged file. Used for data validation.
const ID3_PREFIX_STR := "ID3"

## The first 3 bytes of a USC string declaration. Stored in a Array of ints,
## as Godot will not allow for [PackedByteArray]s created from a constant array
## to be treated as a constant.
const USC_STRING_PREFIX:Array[int] = [1, 0xff, 0xfe]

# ## This method is intended to be private.
# ## Gets a string from the given ID3 formatted [param data]. Accounts for USC formatted strings.
# ## When [param null_replacement] is set to the null_character ([code]"\u0000"[\code])
# ## or an empty string, the null character will be stripped from the entire string.
# ## This is to avoid encoding errors in godot.
# ## [param null_replacement] cannot be longer than a single character.
static func _get_string_from_id3_data(data:PackedByteArray, null_replacement := "\n") -> String:
	assert(null_replacement.length() < 2)
	var ret = ""

	if data.size() > 3 and data.slice(0, 3) == PackedByteArray(USC_STRING_PREFIX):
		# Null-terminated string of ucs2 chars
		ret = _get_string_from_ucs2(data.slice(3), null_replacement)

	if ret == "" and data[0] == 0:
		# Simple utf8 string
		data = data.slice(1)
		if null_replacement.is_empty() or null_replacement.unicode_at(0) == 0:
			data = data.duplicate()
			var had := data.erase(0)
			while had:
				had = data.erase(0)
		else:
			data = _byte_array_replace(data, 0, null_replacement.to_ascii_buffer()[0])
		ret = data.get_string_from_utf8()

	return ret

# ## This method is intended to be private.
# ## Gets a [String] from a USC formatted [Array] of bytes.
# ## Assumes that the given [param bytes] are USC formatted (does not check).
# ## When [param null_replacement] is set to the null_character ([code]"\u0000"[\code])
# ## or an empty string, the null character will be stripped from the entire string.
# ## This is to avoid encoding errors in godot.
static func _get_string_from_ucs2(bytes:PackedByteArray, null_replacement := "\n") -> String:
	var s:String = ""
	var idx:int = 0
	while idx < (bytes.size() - 1):
		var c = bytes[idx] + 256 * bytes[idx + 1]
		if c == 0:
			if null_replacement.is_empty() or null_replacement.unicode_at(0) == 0:
				continue
			else:
				c = null_replacement
		else:
			c = char(c)
		s += c
		idx += 2
	return s

# ## This method is intended to be private.
# ## Replaces a instance of byte '[param this]' with the byte '[param with]' in the byte array.
# ## Instead of modifying the original [param byte_array], this returns a modified copy.
static func _byte_array_replace(byte_array:PackedByteArray, this:int, with:int) -> PackedByteArray:
	byte_array = byte_array.duplicate()
	var ind = byte_array.find(this)
	while ind >= 0:
		byte_array[ind] = with
		ind = byte_array.find(this)
	return byte_array

# ## This method is intended to be private.
# ## Converts a given [Array] of [param bytes] into a [int],
# ## also accounting for a syncsafe formatted int when [param is_syncsafe] is set.
static func _bytes_to_int(bytes: Array, is_syncsafe = true) -> int:
	# Syncsafe uses 0x80 multiplier otherwise use 0x100 multiplier
	var mult:int = 0x80 if is_syncsafe else 0x100
	var n:int = 0
	for byte in bytes:
		n *= mult
		n += byte
	return n

## Returns up to a 3 element [PackedByteArray]
## (expected to be treated as unsigned 8 bit ints, as stored in the file's data itself),
## matching the ID3 version parsed from the starting [param raw_data] of a ID3 tagged file,
## with the first entry being the major, the second the minor, and the 3rd the patch
## (aka. v[0].[1].[2])
## or empty when no id3 version is found
## (where the data likely isn't id3 tagged),
## or encountering a parsing error.
## When there is less than the maximal amount of bytes for a full version number,
## it will still attempt to parse everything it was provided.
## This should typically be supplied with about the first 5 bytes of a id3v2 tagged file.
## This currently doesn't support parsing any other ID3 major version except v2.x.x.
## An empty returned array will indicate wether or not a file can be parsed as a ID3
## tagged file using this script.
static func parse_id3_version(raw_data:PackedByteArray) -> PackedByteArray:
	raw_data = raw_data.slice(0, 5) #we only need so much data...

	if raw_data.slice(0, 3) != ID3_PREFIX_STR.to_ascii_buffer():
		#not ID3v2, so not currently supported by this function
		return PackedByteArray()
	var parsed := PackedByteArray([2])
	if raw_data.size() > 3:
		parsed += raw_data.slice(3, min(5, raw_data.size()))
	return parsed

## Parses the given [param raw_data], saving successfully parsed tags into
## the [Dictionary] referenced in [param save_into],
## with the key being a string defining the type of tag,
## and the value corelating to some [Variant] type of value associated with it.
## When [param fail_on_tag_error] is set (as by default),
## this function will return an [enum Error] value, stopping at the first error
## encountered. Otherwise this function will skip any errors encountered when parsing any tags,
## not returning any of them.
## When a non-empty [param id3_version] is provided,
## it will override that version used when parsing the [param raw_data],
## however, the first 5 bytes of data (typically used to hold the id3 version and magic number)
## cannot be truncated. These inital 5 bytes of a file will only be referenced when
## a empty [param id3_version] is provided. Note that this will also
## override a inital validation of weather or not the [param raw_data] is at all id3 tagged,
## so overriding this is only suggested in scenarios where it is strictly necessary.
## [param null_to_newline] specifies how a null string character will be transformed when
## parsing string data. It's suggested to leave this as an appropriate newline character,
## though setting this to an empty string or a string containing the null character
## will result in all null characters being removed.
static func parse_id3_tags(raw_data:PackedByteArray,
							save_into:Dictionary,
							id3_version := PackedByteArray(),
							fail_on_tag_error := false,
							null_to_newline := "\n"
							) -> int:
	if id3_version.is_empty():
		id3_version = parse_id3_version(raw_data)
	if id3_version.is_empty() or id3_version[0] != 2:
		return ERR_FILE_UNRECOGNIZED

	var null_as_separator:bool = false
	if id3_version.size() >= 2:
		null_as_separator = id3_version[0] == 2 and id3_version[1] in [3,4]
	var flags:int = raw_data[5]
	var unsync:bool = flags & 0x80 > 0
	var extended:bool = flags & 0x40 > 0
	# var experimental:bool = flags & 0x20 > 0 #unused
	# var has_footer:bool = flags & 0x10 > 0 #unused

	var idx:int = 10
	var end:int = idx + _bytes_to_int(raw_data.slice(6, 10))
	end = min(end, raw_data.size())
	if extended:
		idx += _bytes_to_int(raw_data.slice(idx, idx + 4))

	while idx < end:
		var frame_id := raw_data.slice(idx, idx + 4).get_string_from_ascii()
		var size = _bytes_to_int(raw_data.slice(idx + 4, idx + 8), frame_id != "APIC")
		if size > 0x7f: #(0b01111111 -> 0x7f)
			# then its never stored as a sync safe number
			size = _bytes_to_int(raw_data.slice(idx + 4, idx + 8), false)
		idx += 10 # pass the frame id and size bytes

		var frame_data := raw_data.slice(idx, idx+size)
		if frame_data.size() > 0:
			var err:int = parse_id3_v2_tag(frame_id,
											frame_data,
											save_into,
											"" if (not null_as_separator) else null_to_newline
											)
			if err != OK and fail_on_tag_error:
				return err

		idx += size
	return OK

## Parses a ID3v2 [param frame]'s [param sliced_frame_data]
## into the [Dictionary] referenced in the [param save_into].
## This returns a [enum Error] value, corelating to possible error
## encountered when parsing that frame's data.
## When parsing a files entire data, use [method parse_id3_tags] instead,
## as this requires the frame name to be know and the frame's data to be presliced.
## [param null_to_newline] specifies how a null string character will be transformed when
## parsing string data. It's suggested to leave this as an appropriate newline character,
## though setting this to an empty string or a string containing the null character
## will result in all null characters being removed.
static func parse_id3_v2_tag(frame:String,
							sliced_frame_data:PackedByteArray,
							save_into:Dictionary,
							null_to_newline := "\n"
							) -> int:
	match (frame):
		"TBPM", 'TBP':
			save_into["bpm"] = int(_get_string_from_id3_data(sliced_frame_data))
		"TIT2", 'TT2':
			save_into["title"] = _get_string_from_id3_data(sliced_frame_data, null_to_newline)
		"TALB", 'TAL':
			save_into["album"] = _get_string_from_id3_data(sliced_frame_data, null_to_newline)
		"COMM", "COM":
			save_into["comments"] = _get_string_from_id3_data(sliced_frame_data, null_to_newline)
		"TXXX", "TXX":
			if "user_defined_text" not in save_into:
				save_into["user_defined_text"] = ""
			save_into["user_defined_text"] += _get_string_from_id3_data(sliced_frame_data, null_to_newline)
		"TCOP", "TCR":
			if "copyright" not in save_into:
				save_into["copyright"] = ""
			save_into["copyright"] += _get_string_from_id3_data(sliced_frame_data, null_to_newline)
		"TDAT", "TDA":
			save_into["date"] = _get_string_from_id3_data(sliced_frame_data, null_to_newline)
		"TYER", "TYE":
			save_into["year"] = int(_get_string_from_id3_data(sliced_frame_data))
		"TPE1", 'TP1':
			save_into["artist"] = _get_string_from_id3_data(sliced_frame_data, null_to_newline)
		"TPE2", 'TP2':
			save_into["album_artist"] = _get_string_from_id3_data(sliced_frame_data, null_to_newline)
		"TRCK", 'TRK':
			save_into["track_no"] = int(_get_string_from_id3_data(sliced_frame_data))
		"USER":
			save_into["terms_of_use"] = _get_string_from_id3_data(sliced_frame_data, null_to_newline)
		"TCON", 'TCO':
			var gen_key = _get_string_from_id3_data(sliced_frame_data, null_to_newline)
			gen_key = gen_key.strip_escapes().strip_edges()
			while gen_key[0] == "(" and gen_key[-1] == ")":
				gen_key = gen_key.substr(1,gen_key.length()-2)
			if gen_key.is_valid_int():
				gen_key = str(int(gen_key))
			if gen_key in ID3_GENRE_IDS:
				save_into["genre"] = ID3_GENRE_IDS[gen_key]
			else:
				save_into["genre"] = gen_key # manually specified genre
		"APIC", 'PIC':
			sliced_frame_data = sliced_frame_data.slice(1)
			var zero1 = sliced_frame_data.find(0)

			if zero1 <= 0:
				assert(false, "bad cover photo")
				return ERR_INVALID_DATA

			var mime_type = sliced_frame_data.slice(0, zero1).get_string_from_ascii()

			zero1 += 1 # Picture type
			if zero1 >= sliced_frame_data.size():
				return ERR_INVALID_DATA

			zero1 += 1
			if zero1 >= sliced_frame_data.size():
				return ERR_INVALID_DATA

			var zero2 = sliced_frame_data.find(0, zero1)
			var image_bytes = sliced_frame_data.slice(zero2 + 1)

			var img = Image.new()
			match mime_type:
				"image/png":
					img.load_png_from_buffer(image_bytes)
				"image/jpeg", "image/pjpeg":
					img.load_jpg_from_buffer(image_bytes)
				"image/bmp", "image/x-bmp", "image/x-ms-bmp":
					img.load_bmp_from_buffer(image_bytes)
				_:
					return ERR_FILE_UNRECOGNIZED
			save_into["cover"] = ImageTexture.create_from_image(img)
		var fr_id when fr_id in ID3_FRAME_ID_TO_URL_NAME.keys():
			if "urls" not in save_into:
				save_into["urls"] = {}
			save_into["urls"][ID3_FRAME_ID_TO_URL_NAME[fr_id]] = _get_string_from_id3_data(sliced_frame_data)
	return OK

#TODO LONGTERM RIFF INFO LIST chunks would be a nice next step for raw parsing...

## Parses a given [param audio_stream]'s various types of metadata
## (including the potential [code]tags[/code] property,
## as defined on certain stream types, or the bpm and associated properties,
## typically set when importing)
## into the [Dictionary] referenced in [param save_into].
## This returns a [enum Error] value when an error occurs.
static func parse_godot_properties(audio_stream:AudioStream, save_into:Dictionary) -> int:
	var len := audio_stream.get_length()
	if len > 0.0 and len < INF:
		save_into["duration"] = len

	for prop in ["bar_beats", "beat_count", "bpm"]:
		save_into[prop] = audio_stream.get(prop)

	if "tags" in audio_stream:
		save_into.merge(audio_stream.tags, true)

	return OK

## Attempts to get the most relevant and accurate [PackedByteArray] of
## the file data that a given [AudioStream] (as provided in [param audio])
## was imported from.
## Note that this is not guaranteed to always be possible,
## as some imported assets may not include their original files,
## and and while godot also stores some of the original file's data
## for some formates of imported audio, these may be truncated or reparsed in some way.
## It's suggested only to use this function in situation where receiving truncated
## or modified versions are also allowable.
## When a file's data could not be retrieved in any way, and empty [PackedByteArray] is returned.
static func bytes_from_audio(audio:AudioStream) -> PackedByteArray:
	if audio == null:
		return PackedByteArray()
	if audio is AudioStreamMP3:
		# mp3 stream's data property contain the whole stream's data untimed,
		# unlike the other audio stream formats that have a data field.
		# So this feild is actually the best primary source.
		return audio.data
	if (not audio.local_to_scene) and FileAccess.file_exists(audio.resource_path):
		return FileAccess.get_file_as_bytes(audio.resource_path)
	if "data" in audio:
		# Welp, try to work with what there is left in the data feild, even if it is truncated...
		return audio.data
	return PackedByteArray()

## Takes a given [AudioStream] and when it encounters certain types of [AudioStream]s
## that encapsulates other streams (specifically [AudioStreamPlaylist], [AudioStreamSynchronized]
## [AudioStreamInteractive], and [AudioStreamRandomizer]s), it will recursively
## extract the streams that those specific streams contain, returning them, in order, in an array.
static func flatten_meta_streams(stream:AudioStream) -> Array[AudioStream]:
	var ret:Array[AudioStream] = []
	if stream is AudioStreamPlaylist:
		for i in range(stream.stream_count):
			ret.append_array(flatten_meta_streams(stream.get_list_stream(i)))
	elif stream is AudioStreamSynchronized:
		for i in range(stream.stream_count):
			ret.append_array(flatten_meta_streams(stream.get_sync_stream(i)))
	elif stream is AudioStreamInteractive:
		for i in range(stream.clip_count):
			ret.append_array(flatten_meta_streams(stream.get_clip_stream(i)))
	elif stream is AudioStreamRandomizer:
		for i in range(stream.streams_count):
			ret.append_array(flatten_meta_streams(stream.get_stream(i)))
	else:
		ret.append(stream)
	return ret
