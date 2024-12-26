import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xFF292929),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color(0xFF202359)),
              textTheme: const TextTheme(
                  titleLarge: TextStyle(color: Color(0xFFFFFFFF), fontSize: 32),
                  titleMedium: TextStyle(color: Color(0xFFFFFFFF), fontSize: 28),
                  bodyMedium: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                  bodySmall: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14)),
            ),
            debugShowCheckedModeBanner: false,
            home: const MyFirstPage(),
          );
        });
  }
}
