import 'package:flutter/material.dart';
import 'package:graduation_project/key.dart';
import 'package:graduation_project/services/encryption_helper.dart';
import 'package:graduation_project/services/storage_helper/message_model.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';
import 'package:graduation_project/services/tcp/poke.dart';
import 'package:graduation_project/services/tcp/poke_listener.dart';
import 'package:graduation_project/widgets/custom_btn.dart';
import 'package:uuid/uuid.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({super.key, required this.userIp});
  final String userIp;
  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fileNameController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String? fileName, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please Enter File Name';
                  }
                  return null;
                },
                controller: fileNameController,
                decoration: InputDecoration(
                  hintText: 'Enter file name',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please Enter your Message';
                  }
                  return null;
                },
                controller: messageController,
                decoration: InputDecoration(hintText: 'Enter your message'),
              ),
              SizedBox(
                height: 8,
              ),
              CustomBtn(
                btnText: 'Send',
                onTap: () async {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  Navigator.of(context).pop();
                  final secretKey = KeyProvider().data;
                  if (secretKey == null) {
                    sendSnackBar(
                      message: 'Set a password first to enable encryption.',
                      context: context,
                    );
                    return;
                  }
                  final encryptedMessage = await EncryptionHelper.encryptData(
                    secretKey,
                    messageController.text,
                  );
                  final messageModel = Message(
                    id: Uuid().v4(),
                    fileName: fileNameController.text,
                    content: encryptedMessage,
                  );
                  if (!context.mounted) return;
                  sendMessage(
                    targetIp: widget.userIp,
                    message: messageModel,
                  );
                  await StorageHelper().saveMessage(
                    messageModel,
                    type: MessageType.sent,
                  );
                  messageController.clear();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
