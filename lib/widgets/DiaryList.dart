import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/Constants.dart';
import '../models/Diary.dart';
import '../pages/ImagesPage2.dart';

class DiaryList extends StatefulWidget {
  final Diary? diary;
  const DiaryList({Key? key,required this.diary}) : super(key: key);

  @override
  State<DiaryList> createState() => _DiaryListState();

}

class _DiaryListState extends State<DiaryList> {
  @override
  Widget build(BuildContext context) {
    if(widget.diary!.images!.isNotEmpty ) {
      return ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.transparent,
                      height: 220.h,
                      child: ListView.builder(
                        itemCount: widget.diary!.images!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          debugPrint(
                              widget.diary!.images![index]!);
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImagesPage2(images: widget.diary!.images!,index: index,)));
                            },
                            child: Image.file(File(widget.diary!.images![index]!), fit: BoxFit.cover),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h,),
              Text(widget.diary!.title.toString(),style: Constants.getdiaryDetailPageTitleTextStyle(),),
              SizedBox(height: 5.w,),
              Text(widget.diary!.text.toString(),style: Constants.getdiaryDetailPageTextStyle(),),
            ],
          ),
        ],
      );
    }
    else {
      return Container(
        color: Colors.blue,
      );
    }

  }
}
