import 'dart:io';
import '../constants/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gunluk/constants/UIDesign.dart';
import 'package:gunluk/pages/my_first_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImagesPage extends ConsumerWidget {
  final List<String> images;
  final int index;
  const ImagesPage({Key? key, required this.images, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: UIDesign.getBackGroundColor("darkTheme"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: () {
              images.removeAt(index);
              ref.read(imagesList.notifier).update((state) => images);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MyFirstPage(),
              ));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(
                Icons.delete,
                size: 32.w,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.file(
          File(images[index]),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
