// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_listener.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serverSocketHash() => r'e579dbf159a679e5fe21bc7f3e4d9e3f441f7685';

/// Provider that creates and binds a TCP server socket on the specified port
///
/// Copied from [serverSocket].
@ProviderFor(serverSocket)
final serverSocketProvider = AutoDisposeFutureProvider<ServerSocket?>.internal(
  serverSocket,
  name: r'serverSocketProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$serverSocketHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ServerSocketRef = AutoDisposeFutureProviderRef<ServerSocket?>;
String _$serverSocketStreamHash() =>
    r'094ab6e1c4e972f2d29657e1f580f17e23ad04a8';

/// Stream provider that continuously listens for incoming TCP connections
///
/// Copied from [serverSocketStream].
@ProviderFor(serverSocketStream)
final serverSocketStreamProvider =
    AutoDisposeStreamProvider<TcpMessageWrapper>.internal(
  serverSocketStream,
  name: r'serverSocketStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serverSocketStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ServerSocketStreamRef = AutoDisposeStreamProviderRef<TcpMessageWrapper>;
String _$receiveMessageContentHash() =>
    r'e8f1d5e0af80712189b7e3661c080172d5f6718c';

/// See also [receiveMessageContent].
@ProviderFor(receiveMessageContent)
final receiveMessageContentProvider = AutoDisposeProvider<void>.internal(
  receiveMessageContent,
  name: r'receiveMessageContentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$receiveMessageContentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReceiveMessageContentRef = AutoDisposeProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
