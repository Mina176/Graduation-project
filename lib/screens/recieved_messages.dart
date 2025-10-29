import 'package:flutter/material.dart';
import 'package:graduation_project/storage_helper/message_model.dart';
import 'package:graduation_project/storage_helper/storage_helper.dart';

class RecievedMessages extends StatefulWidget {
  const RecievedMessages({
    super.key,
  });

  @override
  State<RecievedMessages> createState() => _RecievedMessagesState();
}

class _RecievedMessagesState extends State<RecievedMessages> {
  StorageHelper savedMessage = StorageHelper();
  late Future<List<Message>> futureMessages;

  @override
  void initState() {
    super.initState();
    futureMessages = StorageHelper.loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                futureMessages = StorageHelper.loadMessages();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
        future: futureMessages,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data![index].id,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  subtitle: Text(
                    snapshot.data![index].text,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                );
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
