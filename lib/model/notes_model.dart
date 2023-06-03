import 'package:hive/hive.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 0)
class NotesModel extends HiveObject{

  @HiveField(0)
  final String title;
  @HiveField(1)
  final String supTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NotesModel({
    required this.supTitle,
    required this.title,
    required this.color,
    required this.date,
  });
}