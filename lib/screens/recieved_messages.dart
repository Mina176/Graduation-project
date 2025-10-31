import 'package:flutter/material.dart';
import 'package:graduation_project/services/storage_helper/message_model.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';

class MessagesList extends StatefulWidget {
  const MessagesList({
    super.key,
    required this.type,
  });
  final MessageType type;
  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  StorageHelper savedMessage = StorageHelper();
  late Future<List<Message>> futureMessages;

  @override
  void initState() {
    super.initState();
    futureMessages = StorageHelper().loadMessages(type: widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                futureMessages =
                    StorageHelper().loadMessages(type: widget.type);
                setState(() {});
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
        future: futureMessages,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final message = snapshot.data![index];
                return ListTile(
                    titleTextStyle: Theme.of(context).textTheme.titleLarge,
                    subtitleTextStyle: Theme.of(context).textTheme.titleMedium,
                    title: Text('file name:'),
                    subtitle: Text(
                      message.fileName,
                    ));
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
