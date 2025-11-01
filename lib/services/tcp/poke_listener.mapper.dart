// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'poke_listener.dart';

class TcpMessageMapper extends ClassMapperBase<TcpMessage> {
  TcpMessageMapper._();

  static TcpMessageMapper? _instance;
  static TcpMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TcpMessageMapper._());
      TcpFileMessageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TcpMessage';

  static String _$type(TcpMessage v) => v.type;
  static const Field<TcpMessage, String> _f$type = Field('type', _$type);

  @override
  final MappableFields<TcpMessage> fields = const {
    #type: _f$type,
  };

  static TcpMessage _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'TcpMessage', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static TcpMessage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TcpMessage>(map);
  }

  static TcpMessage fromJson(String json) {
    return ensureInitialized().decodeJson<TcpMessage>(json);
  }
}

mixin TcpMessageMappable {
  String toJson();
  Map<String, dynamic> toMap();
  TcpMessageCopyWith<TcpMessage, TcpMessage, TcpMessage> get copyWith;
}

abstract class TcpMessageCopyWith<$R, $In extends TcpMessage, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? type});
  TcpMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class TcpFileMessageMapper extends SubClassMapperBase<TcpFileMessage> {
  TcpFileMessageMapper._();

  static TcpFileMessageMapper? _instance;
  static TcpFileMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TcpFileMessageMapper._());
      TcpMessageMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TcpFileMessage';

  static String _$fileId(TcpFileMessage v) => v.fileId;
  static const Field<TcpFileMessage, String> _f$fileId =
      Field('fileId', _$fileId);
  static String _$content(TcpFileMessage v) => v.content;
  static const Field<TcpFileMessage, String> _f$content =
      Field('content', _$content);
  static String _$type(TcpFileMessage v) => v.type;
  static const Field<TcpFileMessage, String> _f$type =
      Field('type', _$type, opt: true, def: 'file');

  @override
  final MappableFields<TcpFileMessage> fields = const {
    #fileId: _f$fileId,
    #content: _f$content,
    #type: _f$type,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'file';
  @override
  late final ClassMapperBase superMapper = TcpMessageMapper.ensureInitialized();

  static TcpFileMessage _instantiate(DecodingData data) {
    return TcpFileMessage(
        fileId: data.dec(_f$fileId),
        content: data.dec(_f$content),
        type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static TcpFileMessage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TcpFileMessage>(map);
  }

  static TcpFileMessage fromJson(String json) {
    return ensureInitialized().decodeJson<TcpFileMessage>(json);
  }
}

mixin TcpFileMessageMappable {
  String toJson() {
    return TcpFileMessageMapper.ensureInitialized()
        .encodeJson<TcpFileMessage>(this as TcpFileMessage);
  }

  Map<String, dynamic> toMap() {
    return TcpFileMessageMapper.ensureInitialized()
        .encodeMap<TcpFileMessage>(this as TcpFileMessage);
  }

  TcpFileMessageCopyWith<TcpFileMessage, TcpFileMessage, TcpFileMessage>
      get copyWith =>
          _TcpFileMessageCopyWithImpl<TcpFileMessage, TcpFileMessage>(
              this as TcpFileMessage, $identity, $identity);
  @override
  String toString() {
    return TcpFileMessageMapper.ensureInitialized()
        .stringifyValue(this as TcpFileMessage);
  }

  @override
  bool operator ==(Object other) {
    return TcpFileMessageMapper.ensureInitialized()
        .equalsValue(this as TcpFileMessage, other);
  }

  @override
  int get hashCode {
    return TcpFileMessageMapper.ensureInitialized()
        .hashValue(this as TcpFileMessage);
  }
}

extension TcpFileMessageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TcpFileMessage, $Out> {
  TcpFileMessageCopyWith<$R, TcpFileMessage, $Out> get $asTcpFileMessage =>
      $base.as((v, t, t2) => _TcpFileMessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TcpFileMessageCopyWith<$R, $In extends TcpFileMessage, $Out>
    implements TcpMessageCopyWith<$R, $In, $Out> {
  @override
  $R call({String? fileId, String? content, String? type});
  TcpFileMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TcpFileMessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TcpFileMessage, $Out>
    implements TcpFileMessageCopyWith<$R, TcpFileMessage, $Out> {
  _TcpFileMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TcpFileMessage> $mapper =
      TcpFileMessageMapper.ensureInitialized();
  @override
  $R call({String? fileId, String? content, String? type}) =>
      $apply(FieldCopyWithData({
        if (fileId != null) #fileId: fileId,
        if (content != null) #content: content,
        if (type != null) #type: type
      }));
  @override
  TcpFileMessage $make(CopyWithData data) => TcpFileMessage(
      fileId: data.get(#fileId, or: $value.fileId),
      content: data.get(#content, or: $value.content),
      type: data.get(#type, or: $value.type));

  @override
  TcpFileMessageCopyWith<$R2, TcpFileMessage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TcpFileMessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TcpMessageWrapperMapper extends ClassMapperBase<TcpMessageWrapper> {
  TcpMessageWrapperMapper._();

  static TcpMessageWrapperMapper? _instance;
  static TcpMessageWrapperMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TcpMessageWrapperMapper._());
      TcpMessageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TcpMessageWrapper';

  static String _$ipAddress(TcpMessageWrapper v) => v.ipAddress;
  static const Field<TcpMessageWrapper, String> _f$ipAddress =
      Field('ipAddress', _$ipAddress);
  static TcpMessage _$message(TcpMessageWrapper v) => v.message;
  static const Field<TcpMessageWrapper, TcpMessage> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<TcpMessageWrapper> fields = const {
    #ipAddress: _f$ipAddress,
    #message: _f$message,
  };

  static TcpMessageWrapper _instantiate(DecodingData data) {
    return TcpMessageWrapper(
        ipAddress: data.dec(_f$ipAddress), message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static TcpMessageWrapper fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TcpMessageWrapper>(map);
  }

  static TcpMessageWrapper fromJson(String json) {
    return ensureInitialized().decodeJson<TcpMessageWrapper>(json);
  }
}

mixin TcpMessageWrapperMappable {
  String toJson() {
    return TcpMessageWrapperMapper.ensureInitialized()
        .encodeJson<TcpMessageWrapper>(this as TcpMessageWrapper);
  }

  Map<String, dynamic> toMap() {
    return TcpMessageWrapperMapper.ensureInitialized()
        .encodeMap<TcpMessageWrapper>(this as TcpMessageWrapper);
  }

  TcpMessageWrapperCopyWith<TcpMessageWrapper, TcpMessageWrapper,
          TcpMessageWrapper>
      get copyWith =>
          _TcpMessageWrapperCopyWithImpl<TcpMessageWrapper, TcpMessageWrapper>(
              this as TcpMessageWrapper, $identity, $identity);
  @override
  String toString() {
    return TcpMessageWrapperMapper.ensureInitialized()
        .stringifyValue(this as TcpMessageWrapper);
  }

  @override
  bool operator ==(Object other) {
    return TcpMessageWrapperMapper.ensureInitialized()
        .equalsValue(this as TcpMessageWrapper, other);
  }

  @override
  int get hashCode {
    return TcpMessageWrapperMapper.ensureInitialized()
        .hashValue(this as TcpMessageWrapper);
  }
}

extension TcpMessageWrapperValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TcpMessageWrapper, $Out> {
  TcpMessageWrapperCopyWith<$R, TcpMessageWrapper, $Out>
      get $asTcpMessageWrapper => $base
          .as((v, t, t2) => _TcpMessageWrapperCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TcpMessageWrapperCopyWith<$R, $In extends TcpMessageWrapper,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  TcpMessageCopyWith<$R, TcpMessage, TcpMessage> get message;
  $R call({String? ipAddress, TcpMessage? message});
  TcpMessageWrapperCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TcpMessageWrapperCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TcpMessageWrapper, $Out>
    implements TcpMessageWrapperCopyWith<$R, TcpMessageWrapper, $Out> {
  _TcpMessageWrapperCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TcpMessageWrapper> $mapper =
      TcpMessageWrapperMapper.ensureInitialized();
  @override
  TcpMessageCopyWith<$R, TcpMessage, TcpMessage> get message =>
      $value.message.copyWith.$chain((v) => call(message: v));
  @override
  $R call({String? ipAddress, TcpMessage? message}) =>
      $apply(FieldCopyWithData({
        if (ipAddress != null) #ipAddress: ipAddress,
        if (message != null) #message: message
      }));
  @override
  TcpMessageWrapper $make(CopyWithData data) => TcpMessageWrapper(
      ipAddress: data.get(#ipAddress, or: $value.ipAddress),
      message: data.get(#message, or: $value.message));

  @override
  TcpMessageWrapperCopyWith<$R2, TcpMessageWrapper, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TcpMessageWrapperCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
