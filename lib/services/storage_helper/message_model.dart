import 'package:dart_mappable/dart_mappable.dart';

part 'message_model.mapper.dart';

@MappableClass()
class Message with MessageMappable {
  final String id;
  final String fileName;
  final String content;

  Message({
    required this.id,
    required this.fileName,
    required this.content,
  });
}
