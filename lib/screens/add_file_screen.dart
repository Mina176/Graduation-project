import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:graduation_project/screens/files_screen.dart';
import 'package:uuid/uuid.dart';

class AddFileScreen extends ConsumerStatefulWidget {
  const AddFileScreen({super.key});

  @override
  ConsumerState<AddFileScreen> createState() => _AddFileScreenState();
}

class _AddFileScreenState extends ConsumerState<AddFileScreen> {
  final fileIdController = TextEditingController();
  final fileNameController = TextEditingController();
  final fileContentController = TextEditingController();

  bool isContentAvailable = false;

  @override
  void dispose() {
    fileIdController.dispose();
    fileNameController.dispose();
    fileContentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add File')),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final id = fileIdController.text;
            final fileName = fileNameController.text;
            final content = fileContentController.text;

            if (id.isEmpty || fileName.isEmpty) return;

            final fileModel = FileModel(
              id: id,
              fileName: fileName,
              content: isContentAvailable
                  ? FileContentAvailable(content: content)
                  : FileContentNotAvailable(isDownloading: false),
            );
            ref.read(filesProviderProvider.notifier).addFile(fileModel);
            Navigator.of(context).pop();
          },
          child: Icon(Icons.send)),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          spacing: 16,
          children: [
            TextField(
              controller: fileIdController,
              decoration: InputDecoration(
                labelText: 'File Id',
                suffixIcon: IconButton(
                    onPressed: () {
                      fileIdController.text = Uuid().v4();
                    },
                    icon: Icon(Icons.refresh)),
              ),
            ),
            TextField(
              controller: fileNameController,
              decoration: InputDecoration(labelText: 'File Name'),
            ),
            //content is optional
            SwitchListTile(
                title: Text('Content is available'),
                value: isContentAvailable,
                onChanged: (value) {
                  setState(() {
                    isContentAvailable = value ?? false;
                  });
                }),
            TextField(
              enabled: isContentAvailable,
              controller: fileContentController,
              decoration: InputDecoration(labelText: 'File Content'),
            ),
          ],
        ),
      ),
    );
  }
}
