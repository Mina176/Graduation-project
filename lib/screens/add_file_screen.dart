import 'dart:convert';
import 'dart:typed_data';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:graduation_project/screens/files_screen.dart';
import 'package:graduation_project/services/tcp/poke.dart';
import 'package:graduation_project/services/tcp/poke_listener.dart';
import 'package:graduation_project/services/udp/udp_discovery.dart';
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
  bool isPushing = false;
  bool startUpload = false;

  @override
  void dispose() {
    fileIdController.dispose();
    fileNameController.dispose();
    fileContentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userStreamProvider);
    final users = state.users.toList();
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
              uploadStatus: startUpload && isContentAvailable
                  ? FileUploadStatus.uploading
                  : FileUploadStatus.notStarted,
            );
            ref.read(filesProviderProvider.notifier).addFile(fileModel);
            Navigator.of(context).pop();
          },
          child: Icon(Icons.send)),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(spacing: 16, children: [
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
          TextField(
            controller: fileContentController,
            decoration: InputDecoration(labelText: 'file content'),
          ),
          ElevatedButton(
              onPressed: () => selectFile(), child: Text('pick file')),
          SwitchListTile(
              title: Text('Start uploading immediately'),
              value: startUpload,
              onChanged: isContentAvailable
                  ? (value) {
                      setState(() {
                        startUpload = value;
                      });
                    }
                  : null),
        ]),
      ),
    );
  }

  Future<void> selectFile() async {
    try {
      final XFile? file = await openFile();
      if (file == null) {
        return;
      }

      // 2. Read the file's content as bytes
      final Uint8List fileBytes = await file.readAsBytes();

      // 3. Encode bytes to Base64 to send as a string
      final String fileContentBase64 = base64Encode(fileBytes);

      // 4. Update the UI
      setState(() {
        fileNameController.text = file.name;
        fileContentController.text = fileContentBase64;
      });
    } catch (e) {
      // Handle any errors that occur during file selection 
      debugPrint('Error selecting file: $e');
    }
  }

  // Future<void> pushFile() async {
  //   setState(() {
  //     isPushing = true;
  //   });

  //   // 1. Get file data from controllers
  //   final id = fileIdController.text;
  //   final fileName = fileNameController.text;
  //   final content = fileContentController.text;
  //   if (id.isEmpty || fileName.isEmpty || content.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //           content: Text('File ID, Name, and Content are required to push.')),
  //     );
  //     setState(() {
  //       isPushing = false;
  //     });
  //     return;
  //   }

  //   // 2. Calculate file size

  //   final int fileSizeInBytes = utf8.encode(content).length;

  //   // 3. Find a target
  //   final users = ref.read(userStreamProvider).users;
  //   if (users.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Searching... No users found yet.')),
  //     );
  //     setState(() {
  //       isPushing = false;
  //     });
  //     return;
  //   }

  //   // Find the first user (not you) with enough storage
  //   UserModelWrapper? targetUser;
  //   for (final user in users) {
  //     final userStorageInBytes = user.availableStorage * 1024 * 1024;
  //     if (fileSizeInBytes <= userStorageInBytes) {
  //       targetUser = user;
  //       break; // Found one!
  //     }
  //   }

  //   // 4. Send the file or show error
  //   if (targetUser == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //           content: Text('Found users, but no one has enough storage.')),
  //     );
  //   } else {
  //     // Found a target! Send the file via TCP
  //     try {
  //       await sendTcpMessage(
  //         targetIp: targetUser.ipAddress,
  //         message: TcpFileMessage(
  //           fileId: id,
  //           content: content,
  //         ),
  //       );

  //       // 5. Also add the file locally
  //       final fileModel = FileModel(
  //         id: id,
  //         fileName: fileName,
  //         content: FileContentAvailable(content: content),
  //       );
  //       ref.read(filesProviderProvider.notifier).addFile(fileModel);

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('File sent to ${targetUser.user.name}!')),
  //       );
  //       Navigator.of(context).pop();
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Error sending file: $e')),
  //       );
  //     }
  //   }

  //   setState(() {
  //     isPushing = false;
  //   });
  // }
}
