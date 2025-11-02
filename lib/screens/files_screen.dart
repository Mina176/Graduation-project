import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation_project/screens/add_file_screen.dart';
import 'package:graduation_project/screens/file_info.dart';
import 'package:graduation_project/services/udp/udp_discovery.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'files_screen.g.dart';
part 'files_screen.mapper.dart';

@MappableClass()
class FilesProviderState with FilesProviderStateMappable {
  final List<FileModel> files;

  const FilesProviderState({required this.files});

  List<FileModel> get fileWithNoContentAndDownloading => files.where((file) {
        if (file.content case FileContentNotAvailable(:final isDownloading)
            when isDownloading) {
          return true;
        }
        return false;
      }).toList();
  List<FileModel> get fileWithContent =>
      files.where((file) => file.content is FileContentAvailable).toList();
}

sealed class FileContent {
  const FileContent();
}

class FileContentAvailable extends FileContent {
  const FileContentAvailable({required this.content});
  final String content;
}

class FileContentNotAvailable extends FileContent {
  const FileContentNotAvailable({required this.isDownloading});
  final bool isDownloading;
}

@MappableClass()
class FileModel with FileModelMappable {
  final String id;
  final String fileName;
  final FileContent content;

  const FileModel({
    required this.id,
    required this.fileName,
    required this.content,
  });
}

@Riverpod(keepAlive: true)
class FilesProvider extends _$FilesProvider {
  @override
  FilesProviderState build() {
    Timer? timer;
    ref.onDispose(
      () {
        timer?.cancel();
        timer = null;
      },
    );
    () async {
      final socket = await ref.read(udpSocketProvider.future);

      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        final fileIds = state.fileWithNoContentAndDownloading;
        if (fileIds.isEmpty) return;
        final message = UdpFileMessage(
          fileIds: fileIds.map((file) => file.id).toList(),
        );
        broadcastUdpMessage(socket: socket, message: message);
      });
    }();
    return FilesProviderState(files: []);
  }

  void addFile(FileModel file) {
    state = state.copyWith.files.add(file);
  }

  void downloadContent({
    required String fileId,
    required String content,
  }) {
    state = state.copyWith.files.$update((files) {
      final index = files.indexWhere((file) => file.id == fileId);
      final file = files[index];
      files[index] =
          file.copyWith(content: FileContentAvailable(content: content));
      return files;
    });
  }

  void deleteFile({
    required index,
  }) {
    state = state.copyWith.files.removeAt(index);
  }

  void setIsDownloading({
    required String fileId,
    required bool isDownloading,
  }) {
    state = state.copyWith.files.$update((files) {
      final index = files.indexWhere((file) => file.id == fileId);
      files[index] = files[index].copyWith(
          content: FileContentNotAvailable(isDownloading: isDownloading));
      return files;
    });
  }
}

class FilesScreen extends ConsumerStatefulWidget {
  const FilesScreen({super.key});

  @override
  ConsumerState<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends ConsumerState<FilesScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(filesProviderProvider);
    final files = state.files;
    return Scaffold(
      appBar: AppBar(title: Text('Files')),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddFileScreen()));
          },
          child: Icon(Icons.add)),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: files.length,
        itemBuilder: (context, index) {
          final file = files[index];
          return ListTile(
            leading: Icon(Icons.file_copy),
            title: Text(files[index].fileName),
            trailing: Icon(switch (file.content) {
              FileContentAvailable() => Icons.check,
              FileContentNotAvailable() => Icons.wifi_off_outlined,
            }),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FileInfo(fileId: files[index].id)));
            },
          );
        },
      ),
    );
  }
}
