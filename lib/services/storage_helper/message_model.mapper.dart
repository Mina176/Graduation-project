// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'message_model.dart';

class MessageMapper extends ClassMapperBase<Message> {
  MessageMapper._();

  static MessageMapper? _instance;
  static MessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MessageMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Message';

  static String _$id(Message v) => v.id;
  static const Field<Message, String> _f$id = Field('id', _$id);
  static String _$fileName(Message v) => v.fileName;
  static const Field<Message, String> _f$fileName =
      Field('fileName', _$fileName);
  static String _$content(Message v) => v.content;
  static const Field<Message, String> _f$content = Field('content', _$content);

  @override
  final MappableFields<Message> fields = const {
    #id: _f$id,
    #fileName: _f$fileName,
    #content: _f$content,
  };

  static Message _instantiate(DecodingData data) {
    return Message(
        id: data.dec(_f$id),
        fileName: data.dec(_f$fileName),
        content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static Message fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Message>(map);
  }

  static Message fromJson(String json) {
    return ensureInitialized().decodeJson<Message>(json);
  }
}

mixin MessageMappable {
  String toJson() {
    return MessageMapper.ensureInitialized()
        .encodeJson<Message>(this as Message);
  }

  Map<String, dynamic> toMap() {
    return MessageMapper.ensureInitialized()
        .encodeMap<Message>(this as Message);
  }

  MessageCopyWith<Message, Message, Message> get copyWith =>
      _MessageCopyWithImpl<Message, Message>(
          this as Message, $identity, $identity);
  @override
  String toString() {
    return MessageMapper.ensureInitialized().stringifyValue(this as Message);
  }

  @override
  bool operator ==(Object other) {
    return MessageMapper.ensureInitialized()
        .equalsValue(this as Message, other);
  }

  @override
  int get hashCode {
    return MessageMapper.ensureInitialized().hashValue(this as Message);
  }
}

extension MessageValueCopy<$R, $Out> on ObjectCopyWith<$R, Message, $Out> {
  MessageCopyWith<$R, Message, $Out> get $asMessage =>
      $base.as((v, t, t2) => _MessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MessageCopyWith<$R, $In extends Message, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? fileName, String? content});
  MessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Message, $Out>
    implements MessageCopyWith<$R, Message, $Out> {
  _MessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Message> $mapper =
      MessageMapper.ensureInitialized();
  @override
  $R call({String? id, String? fileName, String? content}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (fileName != null) #fileName: fileName,
        if (content != null) #content: content
      }));
  @override
  Message $make(CopyWithData data) => Message(
      id: data.get(#id, or: $value.id),
      fileName: data.get(#fileName, or: $value.fileName),
      content: data.get(#content, or: $value.content));

  @override
  MessageCopyWith<$R2, Message, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
