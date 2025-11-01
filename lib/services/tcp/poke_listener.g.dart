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
    r'c06bbad2178495ab9cbe6e9b9c004f1e8f3e567d';

/// Stream provider that continuously listens for incoming TCP connections
///
/// Copied from [serverSocketStream].
@ProviderFor(serverSocketStream)
final serverSocketStreamProvider =
    AutoDisposeStreamProvider<TcpMessage>.internal(
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
typedef ServerSocketStreamRef = AutoDisposeStreamProviderRef<TcpMessage>;
String _$saveMessageToDatabaseHash() =>
    r'1f0d62cbd33172f869a7edb9f57d020f44bd578c';

/// See also [saveMessageToDatabase].
@ProviderFor(saveMessageToDatabase)
final saveMessageToDatabaseProvider = AutoDisposeFutureProvider<void>.internal(
  saveMessageToDatabase,
  name: r'saveMessageToDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$saveMessageToDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SaveMessageToDatabaseRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
