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
  static int _$availableStorage(UserModelWrapper v) => v.availableStorage;
  static const Field<UserModelWrapper, int> _f$availableStorage =
      Field('availableStorage', _$availableStorage);

  @override
  final MappableFields<UserModelWrapper> fields = const {
    #ipAddress: _f$ipAddress,
    #user: _f$user,
    #timestamp: _f$timestamp,
    #availableStorage: _f$availableStorage,
  };

  static UserModelWrapper _instantiate(DecodingData data) {
    return UserModelWrapper(
        ipAddress: data.dec(_f$ipAddress),
        user: data.dec(_f$user),
        timestamp: data.dec(_f$timestamp),
        availableStorage: data.dec(_f$availableStorage));
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
  $R call(
      {String? ipAddress,
      UserModel? user,
      DateTime? timestamp,
      int? availableStorage});
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
  $R call(
          {String? ipAddress,
          UserModel? user,
          DateTime? timestamp,
          int? availableStorage}) =>
      $apply(FieldCopyWithData({
        if (ipAddress != null) #ipAddress: ipAddress,
        if (user != null) #user: user,
        if (timestamp != null) #timestamp: timestamp,
        if (availableStorage != null) #availableStorage: availableStorage
      }));
  @override
  UserModelWrapper $make(CopyWithData data) => UserModelWrapper(
      ipAddress: data.get(#ipAddress, or: $value.ipAddress),
      user: data.get(#user, or: $value.user),
      timestamp: data.get(#timestamp, or: $value.timestamp),
      availableStorage:
          data.get(#availableStorage, or: $value.availableStorage));

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
      UdpDiscoveryMessageMapper.ensureInitialized();
      UdpFileMessageMapper.ensureInitialized();
      UdpUploadMessageMapper.ensureInitialized();
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

class UdpDiscoveryMessageMapper
    extends SubClassMapperBase<UdpDiscoveryMessage> {
  UdpDiscoveryMessageMapper._();

  static UdpDiscoveryMessageMapper? _instance;
  static UdpDiscoveryMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UdpDiscoveryMessageMapper._());
      UdpMessageMapper.ensureInitialized().addSubMapper(_instance!);
      UserModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UdpDiscoveryMessage';

  static int _$availableStorage(UdpDiscoveryMessage v) => v.availableStorage;
  static const Field<UdpDiscoveryMessage, int> _f$availableStorage =
      Field('availableStorage', _$availableStorage);
  static UserModel _$user(UdpDiscoveryMessage v) => v.user;
  static const Field<UdpDiscoveryMessage, UserModel> _f$user =
      Field('user', _$user);
  static String _$type(UdpDiscoveryMessage v) => v.type;
  static const Field<UdpDiscoveryMessage, String> _f$type =
      Field('type', _$type, opt: true, def: 'discovery');

  @override
  final MappableFields<UdpDiscoveryMessage> fields = const {
    #availableStorage: _f$availableStorage,
    #user: _f$user,
    #type: _f$type,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'discovery';
  @override
  late final ClassMapperBase superMapper = UdpMessageMapper.ensureInitialized();

  static UdpDiscoveryMessage _instantiate(DecodingData data) {
    return UdpDiscoveryMessage(
        availableStorage: data.dec(_f$availableStorage),
        user: data.dec(_f$user),
        type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static UdpDiscoveryMessage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UdpDiscoveryMessage>(map);
  }

  static UdpDiscoveryMessage fromJson(String json) {
    return ensureInitialized().decodeJson<UdpDiscoveryMessage>(json);
  }
}

mixin UdpDiscoveryMessageMappable {
  String toJson() {
    return UdpDiscoveryMessageMapper.ensureInitialized()
        .encodeJson<UdpDiscoveryMessage>(this as UdpDiscoveryMessage);
  }

  Map<String, dynamic> toMap() {
    return UdpDiscoveryMessageMapper.ensureInitialized()
        .encodeMap<UdpDiscoveryMessage>(this as UdpDiscoveryMessage);
  }

  UdpDiscoveryMessageCopyWith<UdpDiscoveryMessage, UdpDiscoveryMessage,
      UdpDiscoveryMessage> get copyWith => _UdpDiscoveryMessageCopyWithImpl<
          UdpDiscoveryMessage, UdpDiscoveryMessage>(
      this as UdpDiscoveryMessage, $identity, $identity);
  @override
  String toString() {
    return UdpDiscoveryMessageMapper.ensureInitialized()
        .stringifyValue(this as UdpDiscoveryMessage);
  }

  @override
  bool operator ==(Object other) {
    return UdpDiscoveryMessageMapper.ensureInitialized()
        .equalsValue(this as UdpDiscoveryMessage, other);
  }

  @override
  int get hashCode {
    return UdpDiscoveryMessageMapper.ensureInitialized()
        .hashValue(this as UdpDiscoveryMessage);
  }
}

extension UdpDiscoveryMessageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UdpDiscoveryMessage, $Out> {
  UdpDiscoveryMessageCopyWith<$R, UdpDiscoveryMessage, $Out>
      get $asUdpDiscoveryMessage => $base.as(
          (v, t, t2) => _UdpDiscoveryMessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UdpDiscoveryMessageCopyWith<$R, $In extends UdpDiscoveryMessage,
    $Out> implements UdpMessageCopyWith<$R, $In, $Out> {
  UserModelCopyWith<$R, UserModel, UserModel> get user;
  @override
  $R call({int? availableStorage, UserModel? user, String? type});
  UdpDiscoveryMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UdpDiscoveryMessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UdpDiscoveryMessage, $Out>
    implements UdpDiscoveryMessageCopyWith<$R, UdpDiscoveryMessage, $Out> {
  _UdpDiscoveryMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UdpDiscoveryMessage> $mapper =
      UdpDiscoveryMessageMapper.ensureInitialized();
  @override
  UserModelCopyWith<$R, UserModel, UserModel> get user =>
      $value.user.copyWith.$chain((v) => call(user: v));
  @override
  $R call({int? availableStorage, UserModel? user, String? type}) =>
      $apply(FieldCopyWithData({
        if (availableStorage != null) #availableStorage: availableStorage,
        if (user != null) #user: user,
        if (type != null) #type: type
      }));
  @override
  UdpDiscoveryMessage $make(CopyWithData data) => UdpDiscoveryMessage(
      availableStorage:
          data.get(#availableStorage, or: $value.availableStorage),
      user: data.get(#user, or: $value.user),
      type: data.get(#type, or: $value.type));

  @override
  UdpDiscoveryMessageCopyWith<$R2, UdpDiscoveryMessage, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UdpDiscoveryMessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UdpFileMessageMapper extends SubClassMapperBase<UdpFileMessage> {
  UdpFileMessageMapper._();

  static UdpFileMessageMapper? _instance;
  static UdpFileMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UdpFileMessageMapper._());
      UdpMessageMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'UdpFileMessage';

  static List<String> _$fileIds(UdpFileMessage v) => v.fileIds;
  static const Field<UdpFileMessage, List<String>> _f$fileIds =
      Field('fileIds', _$fileIds);
  static String _$type(UdpFileMessage v) => v.type;
  static const Field<UdpFileMessage, String> _f$type =
      Field('type', _$type, opt: true, def: 'file');

  @override
  final MappableFields<UdpFileMessage> fields = const {
    #fileIds: _f$fileIds,
    #type: _f$type,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'file';
  @override
  late final ClassMapperBase superMapper = UdpMessageMapper.ensureInitialized();

  static UdpFileMessage _instantiate(DecodingData data) {
    return UdpFileMessage(
        fileIds: data.dec(_f$fileIds), type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static UdpFileMessage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UdpFileMessage>(map);
  }

  static UdpFileMessage fromJson(String json) {
    return ensureInitialized().decodeJson<UdpFileMessage>(json);
  }
}

mixin UdpFileMessageMappable {
  String toJson() {
    return UdpFileMessageMapper.ensureInitialized()
        .encodeJson<UdpFileMessage>(this as UdpFileMessage);
  }

  Map<String, dynamic> toMap() {
    return UdpFileMessageMapper.ensureInitialized()
        .encodeMap<UdpFileMessage>(this as UdpFileMessage);
  }

  UdpFileMessageCopyWith<UdpFileMessage, UdpFileMessage, UdpFileMessage>
      get copyWith =>
          _UdpFileMessageCopyWithImpl<UdpFileMessage, UdpFileMessage>(
              this as UdpFileMessage, $identity, $identity);
  @override
  String toString() {
    return UdpFileMessageMapper.ensureInitialized()
        .stringifyValue(this as UdpFileMessage);
  }

  @override
  bool operator ==(Object other) {
    return UdpFileMessageMapper.ensureInitialized()
        .equalsValue(this as UdpFileMessage, other);
  }

  @override
  int get hashCode {
    return UdpFileMessageMapper.ensureInitialized()
        .hashValue(this as UdpFileMessage);
  }
}

extension UdpFileMessageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UdpFileMessage, $Out> {
  UdpFileMessageCopyWith<$R, UdpFileMessage, $Out> get $asUdpFileMessage =>
      $base.as((v, t, t2) => _UdpFileMessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UdpFileMessageCopyWith<$R, $In extends UdpFileMessage, $Out>
    implements UdpMessageCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileIds;
  @override
  $R call({List<String>? fileIds, String? type});
  UdpFileMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UdpFileMessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UdpFileMessage, $Out>
    implements UdpFileMessageCopyWith<$R, UdpFileMessage, $Out> {
  _UdpFileMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UdpFileMessage> $mapper =
      UdpFileMessageMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileIds =>
      ListCopyWith($value.fileIds, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(fileIds: v));
  @override
  $R call({List<String>? fileIds, String? type}) => $apply(FieldCopyWithData(
      {if (fileIds != null) #fileIds: fileIds, if (type != null) #type: type}));
  @override
  UdpFileMessage $make(CopyWithData data) => UdpFileMessage(
      fileIds: data.get(#fileIds, or: $value.fileIds),
      type: data.get(#type, or: $value.type));

  @override
  UdpFileMessageCopyWith<$R2, UdpFileMessage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UdpFileMessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UdpUploadMessageMapper extends SubClassMapperBase<UdpUploadMessage> {
  UdpUploadMessageMapper._();

  static UdpUploadMessageMapper? _instance;
  static UdpUploadMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UdpUploadMessageMapper._());
      UdpMessageMapper.ensureInitialized().addSubMapper(_instance!);
      TcpMessageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UdpUploadMessage';

  static List<String> _$fileIds(UdpUploadMessage v) => v.fileIds;
  static const Field<UdpUploadMessage, List<String>> _f$fileIds =
      Field('fileIds', _$fileIds);
  static TcpMessage _$message(UdpUploadMessage v) => v.message;
  static const Field<UdpUploadMessage, TcpMessage> _f$message =
      Field('message', _$message);
  static int _$fileSize(UdpUploadMessage v) => v.fileSize;
  static const Field<UdpUploadMessage, int> _f$fileSize =
      Field('fileSize', _$fileSize);
  static String _$type(UdpUploadMessage v) => v.type;
  static const Field<UdpUploadMessage, String> _f$type =
      Field('type', _$type, opt: true, def: 'uploadfile');

  @override
  final MappableFields<UdpUploadMessage> fields = const {
    #fileIds: _f$fileIds,
    #message: _f$message,
    #fileSize: _f$fileSize,
    #type: _f$type,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'uploadfile';
  @override
  late final ClassMapperBase superMapper = UdpMessageMapper.ensureInitialized();

  static UdpUploadMessage _instantiate(DecodingData data) {
    return UdpUploadMessage(
        fileIds: data.dec(_f$fileIds),
        message: data.dec(_f$message),
        fileSize: data.dec(_f$fileSize),
        type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static UdpUploadMessage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UdpUploadMessage>(map);
  }

  static UdpUploadMessage fromJson(String json) {
    return ensureInitialized().decodeJson<UdpUploadMessage>(json);
  }
}

mixin UdpUploadMessageMappable {
  String toJson() {
    return UdpUploadMessageMapper.ensureInitialized()
        .encodeJson<UdpUploadMessage>(this as UdpUploadMessage);
  }

  Map<String, dynamic> toMap() {
    return UdpUploadMessageMapper.ensureInitialized()
        .encodeMap<UdpUploadMessage>(this as UdpUploadMessage);
  }

  UdpUploadMessageCopyWith<UdpUploadMessage, UdpUploadMessage, UdpUploadMessage>
      get copyWith =>
          _UdpUploadMessageCopyWithImpl<UdpUploadMessage, UdpUploadMessage>(
              this as UdpUploadMessage, $identity, $identity);
  @override
  String toString() {
    return UdpUploadMessageMapper.ensureInitialized()
        .stringifyValue(this as UdpUploadMessage);
  }

  @override
  bool operator ==(Object other) {
    return UdpUploadMessageMapper.ensureInitialized()
        .equalsValue(this as UdpUploadMessage, other);
  }

  @override
  int get hashCode {
    return UdpUploadMessageMapper.ensureInitialized()
        .hashValue(this as UdpUploadMessage);
  }
}

extension UdpUploadMessageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UdpUploadMessage, $Out> {
  UdpUploadMessageCopyWith<$R, UdpUploadMessage, $Out>
      get $asUdpUploadMessage => $base
          .as((v, t, t2) => _UdpUploadMessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UdpUploadMessageCopyWith<$R, $In extends UdpUploadMessage, $Out>
    implements UdpMessageCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileIds;
  @override
  $R call(
      {List<String>? fileIds,
      TcpMessage? message,
      int? fileSize,
      String? type});
  UdpUploadMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UdpUploadMessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UdpUploadMessage, $Out>
    implements UdpUploadMessageCopyWith<$R, UdpUploadMessage, $Out> {
  _UdpUploadMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UdpUploadMessage> $mapper =
      UdpUploadMessageMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileIds =>
      ListCopyWith($value.fileIds, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(fileIds: v));
  @override
  $R call(
          {List<String>? fileIds,
          TcpMessage? message,
          int? fileSize,
          String? type}) =>
      $apply(FieldCopyWithData({
        if (fileIds != null) #fileIds: fileIds,
        if (message != null) #message: message,
        if (fileSize != null) #fileSize: fileSize,
        if (type != null) #type: type
      }));
  @override
  UdpUploadMessage $make(CopyWithData data) => UdpUploadMessage(
      fileIds: data.get(#fileIds, or: $value.fileIds),
      message: data.get(#message, or: $value.message),
      fileSize: data.get(#fileSize, or: $value.fileSize),
      type: data.get(#type, or: $value.type));

  @override
  UdpUploadMessageCopyWith<$R2, UdpUploadMessage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UdpUploadMessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
