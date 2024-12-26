import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gunluk/constants/app_theme.dart';
import 'package:gunluk/models/Chat.dart';
import 'package:gunluk/pages/my_first_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'models/Diary.dart';

void main() async {
  await Hive.initFlutter("diaries");
  Hive.registerAdapter(DiaryAdapter());
  await Hive.openBox<Diary>("diaries");
  Hive.registerAdapter(ChatAdapter());
  await Hive.openBox<Chat>("chats");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 756),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            home: const MyFirstPage(),
          );
        });
  }
}
