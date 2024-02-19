import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/providers.dart';

class MyAddButton extends ConsumerWidget {
  const MyAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        ref.read(Providers.inputDiary.notifier).update((state) => true);
      },
      child: Container(
        height: 50.w,
        width: 50.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF3565A9),
        ),
        child: const ImageIcon(
            AssetImage("assets/Icons/add-icon.png",), color: Colors.white),
      ),
    );
  }
}

