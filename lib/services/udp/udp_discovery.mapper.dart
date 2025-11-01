// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'udp_discovery.dart';

class UserStreamStateMapper extends ClassMapperBase<UserStreamState> {
  UserStreamStateMapper._();

  static UserStreamStateMapper? _instance;
  static UserStreamStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserStreamStateMapper._());
      UserModelWrapperMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserStreamState';

  static Set<UserModelWrapper> _$users(UserStreamState v) => v.users;
  static const Field<UserStreamState, Set<UserModelWrapper>> _f$users =
      Field('users', _$users);
  static DateTime _$lastUpdated(UserStreamState v) => v.lastUpdated;
  static const Field<UserStreamState, DateTime> _f$lastUpdated =
      Field('lastUpdated', _$lastUpdated);

  @override
  final MappableFields<UserStreamState> fields = const {
    #users: _f$users,
    #lastUpdated: _f$lastUpdated,
  };

  static UserStreamState _instantiate(DecodingData data) {
    return UserStreamState(
        users: data.dec(_f$users), lastUpdated: data.dec(_f$lastUpdated));
  }

  @override
  final Function instantiate = _instantiate;

  static UserStreamState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserStreamState>(map);
  }

  static UserStreamState fromJson(String json) {
    return ensureInitialized().decodeJson<UserStreamState>(json);
  }
}

mixin UserStreamStateMappable {
  String toJson() {
    return UserStreamStateMapper.ensureInitialized()
        .encodeJson<UserStreamState>(this as UserStreamState);
  }

  Map<String, dynamic> toMap() {
    return UserStreamStateMapper.ensureInitialized()
        .encodeMap<UserStreamState>(this as UserStreamState);
  }

  UserStreamStateCopyWith<UserStreamState, UserStreamState, UserStreamState>
      get copyWith =>
          _UserStreamStateCopyWithImpl<UserStreamState, UserStreamState>(
              this as UserStreamState, $identity, $identity);
  @override
  String toString() {
    return UserStreamStateMapper.ensureInitialized()
        .stringifyValue(this as UserStreamState);
  }

  @override
  bool operator ==(Object other) {
    return UserStreamStateMapper.ensureInitialized()
        .equalsValue(this as UserStreamState, other);
  }

  @override
  int get hashCode {
    return UserStreamStateMapper.ensureInitialized()
        .hashValue(this as UserStreamState);
  }
}

extension UserStreamStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserStreamState, $Out> {
  UserStreamStateCopyWith<$R, UserStreamState, $Out> get $asUserStreamState =>
      $base.as((v, t, t2) => _UserStreamStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserStreamStateCopyWith<$R, $In extends UserStreamState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({Set<UserModelWrapper>? users, DateTime? lastUpdated});
  UserStreamStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserStreamStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserStreamState, $Out>
    implements UserStreamStateCopyWith<$R, UserStreamState, $Out> {
  _UserStreamStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserStreamState> $mapper =
      UserStreamStateMapper.ensureInitialized();
  @override
  $R call({Set<UserModelWrapper>? users, DateTime? lastUpdated}) =>
      $apply(FieldCopyWithData({
        if (users != null) #users: users,
        if (lastUpdated != null) #lastUpdated: lastUpdated
      }));
  @override
  UserStreamState $make(CopyWithData data) => UserStreamState(
      users: data.get(#users, or: $value.users),
      lastUpdated: data.get(#lastUpdated, or: $value.lastUpdated));

  @override
  UserStreamStateCopyWith<$R2, UserStreamState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserStreamStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserModelWrapperMapper extends ClassMapperBase<UserModelWrapper> {
  UserModelWrapperMapper._();

  static UserModelWrapperMapper? _instance;
  static UserModelWrapperMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserModelWrapperMapper._());
      UserModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserModelWrapper';

  static String _$ipAddress(UserModelWrapper v) => v.ipAddress;
  static const Field<UserModelWrapper, String> _f$ipAddress =
      Field('ipAddress', _$ipAddress);
  static UserModel _$user(UserModelWrapper v) => v.user;
  static const Field<UserModelWrapper, UserModel> _f$user =
      Field('user', _$user);
  static DateTime _$timestamp(UserModelWrapper v) => v.timestamp;
  static const Field<UserModelWrapper, DateTime> _f$timestamp =
      Field('timestamp', _$timestamp);

  @override
  final MappableFields<UserModelWrapper> fields = const {
    #ipAddress: _f$ipAddress,
    #user: _f$user,
    #timestamp: _f$timestamp,
  };

  static UserModelWrapper _instantiate(DecodingData data) {
    return UserModelWrapper(
        ipAddress: data.dec(_f$ipAddress),
        user: data.dec(_f$user),
        timestamp: data.dec(_f$timestamp));
  }

  @override
  final Function instantiate = _instantiate;

  static UserModelWrapper fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserModelWrapper>(map);
  }

  static UserModelWrapper fromJson(String json) {
    return ensureInitialized().decodeJson<UserModelWrapper>(json);
  }
}

mixin UserModelWrapperMappable {
  String toJson() {
    return UserModelWrapperMapper.ensureInitialized()
        .encodeJson<UserModelWrapper>(this as UserModelWrapper);
  }

  Map<String, dynamic> toMap() {
    return UserModelWrapperMapper.ensureInitialized()
        .encodeMap<UserModelWrapper>(this as UserModelWrapper);
  }

  UserModelWrapperCopyWith<UserModelWrapper, UserModelWrapper, UserModelWrapper>
      get copyWith =>
          _UserModelWrapperCopyWithImpl<UserModelWrapper, UserModelWrapper>(
              this as UserModelWrapper, $identity, $identity);
  @override
  String toString() {
    return UserModelWrapperMapper.ensureInitialized()
        .stringifyValue(this as UserModelWrapper);
  }

  @override
  bool operator ==(Object other) {
    return UserModelWrapperMapper.ensureInitialized()
        .equalsValue(this as UserModelWrapper, other);
  }

  @override
  int get hashCode {
    return UserModelWrapperMapper.ensureInitialized()
        .hashValue(this as UserModelWrapper);
  }
}

extension UserModelWrapperValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserModelWrapper, $Out> {
  UserModelWrapperCopyWith<$R, UserModelWrapper, $Out>
      get $asUserModelWrapper => $base
          .as((v, t, t2) => _UserModelWrapperCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserModelWrapperCopyWith<$R, $In extends UserModelWrapper, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserModelCopyWith<$R, UserModel, UserModel> get user;
  $R call({String? ipAddress, UserModel? user, DateTime? timestamp});
  UserModelWrapperCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserModelWrapperCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserModelWrapper, $Out>
    implements UserModelWrapperCopyWith<$R, UserModelWrapper, $Out> {
  _UserModelWrapperCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserModelWrapper> $mapper =
      UserModelWrapperMapper.ensureInitialized();
  @override
  UserModelCopyWith<$R, UserModel, UserModel> get user =>
      $value.user.copyWith.$chain((v) => call(user: v));
  @override
  $R call({String? ipAddress, UserModel? user, DateTime? timestamp}) =>
      $apply(FieldCopyWithData({
        if (ipAddress != null) #ipAddress: ipAddress,
        if (user != null) #user: user,
        if (timestamp != null) #timestamp: timestamp
      }));
  @override
  UserModelWrapper $make(CopyWithData data) => UserModelWrapper(
      ipAddress: data.get(#ipAddress, or: $value.ipAddress),
      user: data.get(#user, or: $value.user),
      timestamp: data.get(#timestamp, or: $value.timestamp));

  @override
  UserModelWrapperCopyWith<$R2, UserModelWrapper, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserModelWrapperCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserModelMapper extends ClassMapperBase<UserModel> {
  UserModelMapper._();

  static UserModelMapper? _instance;
  static UserModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserModel';

  static String _$name(UserModel v) => v.name;
  static const Field<UserModel, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<UserModel> fields = const {
    #name: _f$name,
  };

  static UserModel _instantiate(DecodingData data) {
    return UserModel(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static UserModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserModel>(map);
  }

  static UserModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserModel>(json);
  }
}

mixin UserModelMappable {
  String toJson() {
    return UserModelMapper.ensureInitialized()
        .encodeJson<UserModel>(this as UserModel);
  }

  Map<String, dynamic> toMap() {
    return UserModelMapper.ensureInitialized()
        .encodeMap<UserModel>(this as UserModel);
  }

  UserModelCopyWith<UserModel, UserModel, UserModel> get copyWith =>
      _UserModelCopyWithImpl<UserModel, UserModel>(
          this as UserModel, $identity, $identity);
  @override
  String toString() {
    return UserModelMapper.ensureInitialized()
        .stringifyValue(this as UserModel);
  }

  @override
  bool operator ==(Object other) {
    return UserModelMapper.ensureInitialized()
        .equalsValue(this as UserModel, other);
  }

  @override
  int get hashCode {
    return UserModelMapper.ensureInitialized().hashValue(this as UserModel);
  }
}

extension UserModelValueCopy<$R, $Out> on ObjectCopyWith<$R, UserModel, $Out> {
  UserModelCopyWith<$R, UserModel, $Out> get $asUserModel =>
      $base.as((v, t, t2) => _UserModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserModelCopyWith<$R, $In extends UserModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  UserModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserModel, $Out>
    implements UserModelCopyWith<$R, UserModel, $Out> {
  _UserModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserModel> $mapper =
      UserModelMapper.ensureInitialized();
  @override
  $R call({String? name}) =>
      $apply(FieldCopyWithData({if (name != null) #name: name}));
  @override
  UserModel $make(CopyWithData data) =>
      UserModel(name: data.get(#name, or: $value.name));

  @override
  UserModelCopyWith<$R2, UserModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UdpMessageMapper extends ClassMapperBase<UdpMessage> {
  UdpMessageMapper._();

  static UdpMessageMapper? _instance;
  static UdpMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UdpMessageMapper._());
      DiscoveryMessageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UdpMessage';

  static String _$type(UdpMessage v) => v.type;
  static const Field<UdpMessage, String> _f$type = Field('type', _$type);

  @override
  final MappableFields<UdpMessage> fields = const {
    #type: _f$type,
  };

  static UdpMessage _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'UdpMessage', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static UdpMessage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UdpMessage>(map);
  }

  static UdpMessage fromJson(String json) {
    return ensureInitialized().decodeJson<UdpMessage>(json);
  }
}

mixin UdpMessageMappable {
  String toJson();
  Map<String, dynamic> toMap();
  UdpMessageCopyWith<UdpMessage, UdpMessage, UdpMessage> get copyWith;
}

abstract class UdpMessageCopyWith<$R, $In extends UdpMessage, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? type});
  UdpMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class DiscoveryMessageMapper extends SubClassMapperBase<DiscoveryMessage> {
  DiscoveryMessageMapper._();

  static DiscoveryMessageMapper? _instance;
  static DiscoveryMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DiscoveryMessageMapper._());
      UdpMessageMapper.ensureInitialized().addSubMapper(_instance!);
      UserModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DiscoveryMessage';

  static UserModel _$user(DiscoveryMessage v) => v.user;
  static const Field<DiscoveryMessage, UserModel> _f$user =
      Field('user', _$user);
  static String _$type(DiscoveryMessage v) => v.type;
  static const Field<DiscoveryMessage, String> _f$type =
      Field('type', _$type, opt: true, def: 'discovery');

  @override
  final MappableFields<DiscoveryMessage> fields = const {
    #user: _f$user,
    #type: _f$type,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'discovery';
  @override
  late final ClassMapperBase superMapper = UdpMessageMapper.ensureInitialized();

  static DiscoveryMessage _instantiate(DecodingData data) {
    return DiscoveryMessage(user: data.dec(_f$user), type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static DiscoveryMessage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DiscoveryMessage>(map);
  }

  static DiscoveryMessage fromJson(String json) {
    return ensureInitialized().decodeJson<DiscoveryMessage>(json);
  }
}

mixin DiscoveryMessageMappable {
  String toJson() {
    return DiscoveryMessageMapper.ensureInitialized()
        .encodeJson<DiscoveryMessage>(this as DiscoveryMessage);
  }

  Map<String, dynamic> toMap() {
    return DiscoveryMessageMapper.ensureInitialized()
        .encodeMap<DiscoveryMessage>(this as DiscoveryMessage);
  }

  DiscoveryMessageCopyWith<DiscoveryMessage, DiscoveryMessage, DiscoveryMessage>
      get copyWith =>
          _DiscoveryMessageCopyWithImpl<DiscoveryMessage, DiscoveryMessage>(
              this as DiscoveryMessage, $identity, $identity);
  @override
  String toString() {
    return DiscoveryMessageMapper.ensureInitialized()
        .stringifyValue(this as DiscoveryMessage);
  }

  @override
  bool operator ==(Object other) {
    return DiscoveryMessageMapper.ensureInitialized()
        .equalsValue(this as DiscoveryMessage, other);
  }

  @override
  int get hashCode {
    return DiscoveryMessageMapper.ensureInitialized()
        .hashValue(this as DiscoveryMessage);
  }
}

extension DiscoveryMessageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DiscoveryMessage, $Out> {
  DiscoveryMessageCopyWith<$R, DiscoveryMessage, $Out>
      get $asDiscoveryMessage => $base
          .as((v, t, t2) => _DiscoveryMessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DiscoveryMessageCopyWith<$R, $In extends DiscoveryMessage, $Out>
    implements UdpMessageCopyWith<$R, $In, $Out> {
  UserModelCopyWith<$R, UserModel, UserModel> get user;
  @override
  $R call({UserModel? user, String? type});
  DiscoveryMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DiscoveryMessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DiscoveryMessage, $Out>
    implements DiscoveryMessageCopyWith<$R, DiscoveryMessage, $Out> {
  _DiscoveryMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DiscoveryMessage> $mapper =
      DiscoveryMessageMapper.ensureInitialized();
  @override
  UserModelCopyWith<$R, UserModel, UserModel> get user =>
      $value.user.copyWith.$chain((v) => call(user: v));
  @override
  $R call({UserModel? user, String? type}) => $apply(FieldCopyWithData(
      {if (user != null) #user: user, if (type != null) #type: type}));
  @override
  DiscoveryMessage $make(CopyWithData data) => DiscoveryMessage(
      user: data.get(#user, or: $value.user),
      type: data.get(#type, or: $value.type));

  @override
  DiscoveryMessageCopyWith<$R2, DiscoveryMessage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DiscoveryMessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
