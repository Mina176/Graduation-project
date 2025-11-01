// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'files_screen.dart';

class FilesProviderStateMapper extends ClassMapperBase<FilesProviderState> {
  FilesProviderStateMapper._();

  static FilesProviderStateMapper? _instance;
  static FilesProviderStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilesProviderStateMapper._());
      FileModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FilesProviderState';

  static List<FileModel> _$files(FilesProviderState v) => v.files;
  static const Field<FilesProviderState, List<FileModel>> _f$files =
      Field('files', _$files);

  @override
  final MappableFields<FilesProviderState> fields = const {
    #files: _f$files,
  };

  static FilesProviderState _instantiate(DecodingData data) {
    return FilesProviderState(files: data.dec(_f$files));
  }

  @override
  final Function instantiate = _instantiate;

  static FilesProviderState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilesProviderState>(map);
  }

  static FilesProviderState fromJson(String json) {
    return ensureInitialized().decodeJson<FilesProviderState>(json);
  }
}

mixin FilesProviderStateMappable {
  String toJson() {
    return FilesProviderStateMapper.ensureInitialized()
        .encodeJson<FilesProviderState>(this as FilesProviderState);
  }

  Map<String, dynamic> toMap() {
    return FilesProviderStateMapper.ensureInitialized()
        .encodeMap<FilesProviderState>(this as FilesProviderState);
  }

  FilesProviderStateCopyWith<FilesProviderState, FilesProviderState,
          FilesProviderState>
      get copyWith => _FilesProviderStateCopyWithImpl<FilesProviderState,
          FilesProviderState>(this as FilesProviderState, $identity, $identity);
  @override
  String toString() {
    return FilesProviderStateMapper.ensureInitialized()
        .stringifyValue(this as FilesProviderState);
  }

  @override
  bool operator ==(Object other) {
    return FilesProviderStateMapper.ensureInitialized()
        .equalsValue(this as FilesProviderState, other);
  }

  @override
  int get hashCode {
    return FilesProviderStateMapper.ensureInitialized()
        .hashValue(this as FilesProviderState);
  }
}

extension FilesProviderStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilesProviderState, $Out> {
  FilesProviderStateCopyWith<$R, FilesProviderState, $Out>
      get $asFilesProviderState => $base.as(
          (v, t, t2) => _FilesProviderStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FilesProviderStateCopyWith<$R, $In extends FilesProviderState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, FileModel, FileModelCopyWith<$R, FileModel, FileModel>>
      get files;
  $R call({List<FileModel>? files});
  FilesProviderStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FilesProviderStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilesProviderState, $Out>
    implements FilesProviderStateCopyWith<$R, FilesProviderState, $Out> {
  _FilesProviderStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilesProviderState> $mapper =
      FilesProviderStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, FileModel, FileModelCopyWith<$R, FileModel, FileModel>>
      get files => ListCopyWith(
          $value.files, (v, t) => v.copyWith.$chain(t), (v) => call(files: v));
  @override
  $R call({List<FileModel>? files}) =>
      $apply(FieldCopyWithData({if (files != null) #files: files}));
  @override
  FilesProviderState $make(CopyWithData data) =>
      FilesProviderState(files: data.get(#files, or: $value.files));

  @override
  FilesProviderStateCopyWith<$R2, FilesProviderState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FilesProviderStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FileModelMapper extends ClassMapperBase<FileModel> {
  FileModelMapper._();

  static FileModelMapper? _instance;
  static FileModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FileModel';

  static String _$id(FileModel v) => v.id;
  static const Field<FileModel, String> _f$id = Field('id', _$id);
  static String _$fileName(FileModel v) => v.fileName;
  static const Field<FileModel, String> _f$fileName =
      Field('fileName', _$fileName);
  static FileContent _$content(FileModel v) => v.content;
  static const Field<FileModel, FileContent> _f$content =
      Field('content', _$content);

  @override
  final MappableFields<FileModel> fields = const {
    #id: _f$id,
    #fileName: _f$fileName,
    #content: _f$content,
  };

  static FileModel _instantiate(DecodingData data) {
    return FileModel(
        id: data.dec(_f$id),
        fileName: data.dec(_f$fileName),
        content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static FileModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileModel>(map);
  }

  static FileModel fromJson(String json) {
    return ensureInitialized().decodeJson<FileModel>(json);
  }
}

mixin FileModelMappable {
  String toJson() {
    return FileModelMapper.ensureInitialized()
        .encodeJson<FileModel>(this as FileModel);
  }

  Map<String, dynamic> toMap() {
    return FileModelMapper.ensureInitialized()
        .encodeMap<FileModel>(this as FileModel);
  }

  FileModelCopyWith<FileModel, FileModel, FileModel> get copyWith =>
      _FileModelCopyWithImpl<FileModel, FileModel>(
          this as FileModel, $identity, $identity);
  @override
  String toString() {
    return FileModelMapper.ensureInitialized()
        .stringifyValue(this as FileModel);
  }

  @override
  bool operator ==(Object other) {
    return FileModelMapper.ensureInitialized()
        .equalsValue(this as FileModel, other);
  }

  @override
  int get hashCode {
    return FileModelMapper.ensureInitialized().hashValue(this as FileModel);
  }
}

extension FileModelValueCopy<$R, $Out> on ObjectCopyWith<$R, FileModel, $Out> {
  FileModelCopyWith<$R, FileModel, $Out> get $asFileModel =>
      $base.as((v, t, t2) => _FileModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FileModelCopyWith<$R, $In extends FileModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? fileName, FileContent? content});
  FileModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FileModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileModel, $Out>
    implements FileModelCopyWith<$R, FileModel, $Out> {
  _FileModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileModel> $mapper =
      FileModelMapper.ensureInitialized();
  @override
  $R call({String? id, String? fileName, FileContent? content}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (fileName != null) #fileName: fileName,
        if (content != null) #content: content
      }));
  @override
  FileModel $make(CopyWithData data) => FileModel(
      id: data.get(#id, or: $value.id),
      fileName: data.get(#fileName, or: $value.fileName),
      content: data.get(#content, or: $value.content));

  @override
  FileModelCopyWith<$R2, FileModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FileModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
