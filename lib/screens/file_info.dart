import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation_project/screens/files_screen.dart';

class FileInfo extends ConsumerWidget {
  const FileInfo({super.key, required this.fileId});
  final String fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filesProviderProvider);
    final file = state.files.firstWhere((file) => file.id == fileId);
    return Scaffold(
      appBar: AppBar(title: Text('File Info')),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text('File Id: ${file.id}'),
            Text('File Name: ${file.fileName}'),
            Text('File Content: '),
            switch (file.content) {
              FileContentAvailable(:final content) => Text(content),
              FileContentNotAvailable(:final isDownloading) => ElevatedButton(
                  onPressed: isDownloading
                      ? null
                      : () {
                          ref
                              .read(filesProviderProvider.notifier)
                              .setIsDownloading(
                                  fileId: file.id, isDownloading: true);
                        },
                  child: Text(isDownloading ? 'Downloading...' : 'Download'),
                ),
            },
          ],
        ),
      ),
    );
  }
}
