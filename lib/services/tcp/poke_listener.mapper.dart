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
      MessageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TcpMessage';

  static String _$ipAddress(TcpMessage v) => v.ipAddress;
  static const Field<TcpMessage, String> _f$ipAddress =
      Field('ipAddress', _$ipAddress);
  static Message _$message(TcpMessage v) => v.message;
  static const Field<TcpMessage, Message> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<TcpMessage> fields = const {
    #ipAddress: _f$ipAddress,
    #message: _f$message,
  };

  static TcpMessage _instantiate(DecodingData data) {
    return TcpMessage(
        ipAddress: data.dec(_f$ipAddress), message: data.dec(_f$message));
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
  String toJson() {
    return TcpMessageMapper.ensureInitialized()
        .encodeJson<TcpMessage>(this as TcpMessage);
  }

  Map<String, dynamic> toMap() {
    return TcpMessageMapper.ensureInitialized()
        .encodeMap<TcpMessage>(this as TcpMessage);
  }

  TcpMessageCopyWith<TcpMessage, TcpMessage, TcpMessage> get copyWith =>
      _TcpMessageCopyWithImpl<TcpMessage, TcpMessage>(
          this as TcpMessage, $identity, $identity);
  @override
  String toString() {
    return TcpMessageMapper.ensureInitialized()
        .stringifyValue(this as TcpMessage);
  }

  @override
  bool operator ==(Object other) {
    return TcpMessageMapper.ensureInitialized()
        .equalsValue(this as TcpMessage, other);
  }

  @override
  int get hashCode {
    return TcpMessageMapper.ensureInitialized().hashValue(this as TcpMessage);
  }
}

extension TcpMessageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TcpMessage, $Out> {
  TcpMessageCopyWith<$R, TcpMessage, $Out> get $asTcpMessage =>
      $base.as((v, t, t2) => _TcpMessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TcpMessageCopyWith<$R, $In extends TcpMessage, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MessageCopyWith<$R, Message, Message> get message;
  $R call({String? ipAddress, Message? message});
  TcpMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TcpMessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TcpMessage, $Out>
    implements TcpMessageCopyWith<$R, TcpMessage, $Out> {
  _TcpMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TcpMessage> $mapper =
      TcpMessageMapper.ensureInitialized();
  @override
  MessageCopyWith<$R, Message, Message> get message =>
      $value.message.copyWith.$chain((v) => call(message: v));
  @override
  $R call({String? ipAddress, Message? message}) => $apply(FieldCopyWithData({
        if (ipAddress != null) #ipAddress: ipAddress,
        if (message != null) #message: message
      }));
  @override
  TcpMessage $make(CopyWithData data) => TcpMessage(
      ipAddress: data.get(#ipAddress, or: $value.ipAddress),
      message: data.get(#message, or: $value.message));

  @override
  TcpMessageCopyWith<$R2, TcpMessage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TcpMessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
