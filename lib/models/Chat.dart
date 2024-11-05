import 'package:hive_flutter/adapters.dart';

part 'Chat.g.dart';

@HiveType(typeId: 2)
class Chat{
  @HiveField(0)
  bool? gemine;

  @HiveField(1)
  String? text;

  Chat({this.gemine, this.text});
}