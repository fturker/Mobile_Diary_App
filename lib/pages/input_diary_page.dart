import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gunluk/widgets/diary_input_widget.dart';

class InputDiaryPage extends StatefulWidget {
  const InputDiaryPage({Key? key}) : super(key: key);

  @override
  State<InputDiaryPage> createState() => _InputDiaryPageState();
}

class _InputDiaryPageState extends State<InputDiaryPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 10.h, right: 10.h, top: 4.h, bottom: 4.h),
        child: Column(
          children: [
            Expanded(child: DiaryInputWidget()),
          ],
        ));
  }
}
