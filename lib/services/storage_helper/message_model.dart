class Message {
  final String id;
  final String text;

  Message({
    required this.id,
    required this.text,
  });

  // 1. Factory constructor to create a Message from a JSON map
  factory Message.fromMap(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      text: json['text'] as String,
    );
  }

  // 2. Method to convert a Message instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
    };
  }
}