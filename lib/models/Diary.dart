import 'package:hive_flutter/adapters.dart';

part 'Diary.g.dart';

@HiveType(typeId: 1)
class Diary {
  @HiveField(0)
  String? title;
  
  @HiveField(1)
  String? text;
  
  @HiveField(2)
  DateTime? time;
  
  @HiveField(3)
  List<String>? images;

  Diary({this.title,this.text,this.time,this.images});
}
