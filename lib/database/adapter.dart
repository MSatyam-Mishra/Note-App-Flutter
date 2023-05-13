import 'package:hive/hive.dart';

@HiveType(typeId: 0) // Add this line
class NoteTile {
  @HiveField(0) // Add this line
  String title;
  @HiveField(1) // Add this line
  String content;
  @HiveField(2) // Add this line
  String tileColor;
  @HiveField(3) // Add this line
  String type;
  NoteTile({
    required this.title,
    required this.content,
    required this.tileColor,
    required this.type,
  });
}
