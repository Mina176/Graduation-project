import 'package:flutter/material.dart';
import 'package:graduation_project/key.dart';
import 'package:graduation_project/key.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/services/encryption_helper.dart';
import 'package:graduation_project/services/tcp/poke.dart';
import 'package:graduation_project/services/tcp/poke_listener.dart';
import 'package:graduation_project/services/storage_helper/message_model.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';
import 'package:graduation_project/widgets/custom_btn.dart';
import 'package:uuid/uuid.dart';

class SendMessageSheet extends StatefulWidget {
  const SendMessageSheet({
    super.key,
    required this.userIp,
    required this.userName,
  });

  final String userIp;
  final String userName;
  @override
  State<SendMessageSheet> createState() => _SendMessageSheetState();
}

class _SendMessageSheetState extends State<SendMessageSheet> {
  TextEditingController messageContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8),
            TextField(
              controller: messageContoller,
              autofocus: true,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                focusedBorder: buildOutlineBorder(Colors.blue),
                border: buildOutlineBorder(Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomBtn(
                      btnText: 'Cancel',
                      btnColor: Colors.grey,
                      onTap: () => Navigator.of(context).pop()),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: CustomBtn(
                    btnText: 'Send',
                    onTap: () async {
                      if (messageContoller.text.isEmpty) {
                        return;
                      }
                      Navigator.of(context).pop();
                      final message = messageContoller.text;
                      final secretKey = KeyProvider().data;
                      if (secretKey == null) {
                        sendSnackBar(
                          message: 'Set a password first to enable encryption.',
                          context: context,
                        );
                        return;
                      }
                      final encryptedMessage =
                          await EncryptionHelper.encryptData(
                        secretKey,
                        message,
                      );
                      final messageModel = Message(
                        id: Uuid().v4(),
                        text: encryptedMessage,
                      );
                      // the sent message i want it to appear to the another user
                      sendMessage(
                        context: context,
                        targetIp: widget.userIp,
                        // i want to use this in the listen function of the tcp
                        message: messageModel,
                      );
                      await StorageHelper().saveMessage(
                        messageModel,
                        type: MessageType.sent,
                      );
                      messageContoller.clear();
                      sendSnackBar(
                          message:
                              'Message sent to ${widget.userName}!', // More specific message
                          context: context);
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.viewInsetsOf(context).bottom,
            )
          ],
        ),
      ),
    );
  }
}
