import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gunluk/widgets/my_add_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../constants/providers.dart';

class DiaryPage extends ConsumerWidget {
  DiaryPage({Key? key}) : super(key: key);

  final f = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context, ref) {
    return Stack(
      children: [
        Container(
          child: ListView.builder(
            itemCount: ref.read(diaryList).length,
            itemBuilder: (context, index) {
              if (ref.read(diaryList).isEmpty) {
                return const SizedBox(
                  height: 0.00001,
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    bottom: 5.h,
                  ),
                  child: Card(
                    elevation: 6,
                    color: const Color(0xFF3565A9),
                    child: InkWell(
                      onTap: () {
                        ref
                            .read(diarydetailPage.notifier)
                            .update((state) => true);
                        ref
                            .read(currentDiary.notifier)
                            .update((state) => ref.read(diaryList)[index]);
                      },
                      child: ListTile(
                        textColor: Colors.white,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              ref.read(diaryList)[index].title.toString(),
                              style: const TextStyle(fontSize: 18),
                              maxLines: 2,
                            )),
                            Text(f.format(ref.read(diaryList)[index].time!)),
                          ],
                        ),
                        subtitle: Text(
                            ref.read(diaryList)[index].text.toString(),
                            maxLines: 3),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
        Positioned(
          bottom: 60.h,
          left: 0.75.sw,
          child: const MyAddButton(),
        ),
      ],
    );
  }
}
