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
String _$udpDataStreamHash() => r'86dd1cb3f2195ad0bbd81624f7774de2980c234c';

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
String _$userNameHash() => r'40e9423a58267c86be323122b88e62a6b1b8b2b2';

/// Provider that gets the current user's name
///
/// Copied from [userName].
@ProviderFor(userName)
final userNameProvider = AutoDisposeProvider<String>.internal(
  userName,
  name: r'userNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserNameRef = AutoDisposeProviderRef<String>;
String _$userStreamHash() => r'6a29f787ed1d3e84d58e94f30a04dc847df53258';

/// See also [UserStream].
@ProviderFor(UserStream)
final userStreamProvider =
    AutoDisposeNotifierProvider<UserStream, Set<UserModelWrapper>>.internal(
  UserStream.new,
  name: r'userStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserStream = AutoDisposeNotifier<Set<UserModelWrapper>>;
String _$udpHelloSenderHash() => r'92312ec2e8e8a2e29757d1e0bcd620b7b7327350';

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
