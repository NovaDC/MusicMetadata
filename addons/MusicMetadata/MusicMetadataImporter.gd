@tool
@icon("res://addons/MusicMetadata/icon.svg")
class_name ResourceImporterMusicMetadata
extends EditorImportPlugin

func _get_importer_name() -> String:
    return "novadc.music_metadata"

func _get_format_version() -> int:
    return 2

func _get_priority() -> float:
    return -INF

func _get_visible_name() -> String:
    return "Metadata"

func _get_recognized_extensions() -> PackedStringArray:
    return PackedStringArray(["mp3", "wav", "ogg", "mp4"])

func _get_save_extension() -> String:
    return "tres"

func _get_resource_type() -> String:
    return "Resource"

func _get_preset_count() -> int:
    return 1

func _get_preset_name(_preset_index:int = 0) -> String:
    return "Default"

func _get_import_options(_path:String, _preset_index:int = 0) -> Array[Dictionary]:
    return []

func _import(source_file:String,
                save_path:String,
                _options := {},
                _platform_variants:Array[String] = [],
                _gen_files:Array[String] = []
                ) -> int:
    var buff := FileAccess.get_file_as_bytes(source_file)
    var err := FileAccess.get_open_error()
    if err != OK:
        return err
    if buff.is_empty():
        return ERR_FILE_EOF

    var audio_res:AudioStream = null
    match source_file.get_extension():
        "mp3", "mp4":
            audio_res = AudioStreamMP3.load_from_buffer(buff)
        "wav":
            audio_res = AudioStreamWAV.load_from_buffer(buff)
        "ogg":
            audio_res = AudioStreamOggVorbis.load_from_buffer(buff)
        _:
            return ERR_FILE_UNRECOGNIZED

    var meta_res := MusicMetadata.new()
    err = meta_res.update_from_bytes(buff)
    if err != OK:
        return err

    if audio_res != null:
        err = meta_res.update_from_stream(audio_res)
        if err != OK:
            return err

    return ResourceSaver.save(meta_res, save_path+"."+_get_save_extension())
