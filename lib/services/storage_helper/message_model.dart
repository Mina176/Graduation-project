import 'dart:convert';

class Message {
  final String id;
  final String fileName;
  final String content;

  Message({
    required this.id,
    required this.fileName,
    required this.content,
  });

  // 1. Factory constructor to create a Message from a JSON map
  factory Message.fromMap(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      fileName: json['fileName'] as String,
      content: json['content'] as String,
    );
  }

  // 2. Method to convert a Message instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fileName': fileName,
      'content': content,
    };
  }

  String toJson() => jsonEncode(toMap());
  factory Message.fromJson(String source) =>
      Message.fromMap(jsonDecode(source));
}
