// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'udp_discovery.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$udpSocketHash() => r'a7fda966ad7a67b1bd35bb5234376c015bc47fc4';

/// Provider that creates and binds a UDP socket on the specified port
///
/// Copied from [udpSocket].
@ProviderFor(udpSocket)
final udpSocketProvider = AutoDisposeFutureProvider<RawDatagramSocket>.internal(
  udpSocket,
  name: r'udpSocketProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$udpSocketHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UdpSocketRef = AutoDisposeFutureProviderRef<RawDatagramSocket>;
String _$udpDataStreamHash() => r'77bef8eabb6f83292998ffbadf9013ba5e198e47';

/// Stream provider that continuously reads UDP data from the socket
///
/// Copied from [udpDataStream].
@ProviderFor(udpDataStream)
final udpDataStreamProvider = AutoDisposeStreamProvider<Datagram>.internal(
  udpDataStream,
  name: r'udpDataStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$udpDataStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UdpDataStreamRef = AutoDisposeStreamProviderRef<Datagram>;
String _$listenForUdpFileMessagesHash() =>
    r'2792e52c85d44f0866c511820f9904ad88b21e99';

/// See also [listenForUdpFileMessages].
@ProviderFor(listenForUdpFileMessages)
final listenForUdpFileMessagesProvider = AutoDisposeProvider<void>.internal(
  listenForUdpFileMessages,
  name: r'listenForUdpFileMessagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listenForUdpFileMessagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ListenForUdpFileMessagesRef = AutoDisposeProviderRef<void>;
String _$userStreamHash() => r'016792f5fcf4e5394a58f331ff6e8fa94fc82865';

/// See also [UserStream].
@ProviderFor(UserStream)
final userStreamProvider =
    AutoDisposeNotifierProvider<UserStream, UserStreamState>.internal(
  UserStream.new,
  name: r'userStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserStream = AutoDisposeNotifier<UserStreamState>;
String _$udpHelloSenderHash() => r'833b2b52be815d7be5227645d61fd0b449663555';

/// Provider that sends hello messages via UDP every second
///
/// Copied from [UdpHelloSender].
@ProviderFor(UdpHelloSender)
final udpHelloSenderProvider =
    AutoDisposeNotifierProvider<UdpHelloSender, void>.internal(
  UdpHelloSender.new,
  name: r'udpHelloSenderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$udpHelloSenderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UdpHelloSender = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
