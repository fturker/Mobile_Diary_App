import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gunluk/constants/providers.dart';
import 'package:gunluk/models/Diary.dart';
import 'package:gunluk/pages/MyFirstPage.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../pages/ImagesPage.dart';


class DiaryInputWidget extends ConsumerWidget{
  DiaryInputWidget({Key? key}) : super(key: key);
  final picker = ImagePicker();
  late List<String> images;
  static var box = Hive.box<Diary>("diaries");
  @override
  Widget build(BuildContext context,ref) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: 250.w,
                  height: _getyukseklik(ref.watch(Providers.imagesList).length),
                  child: ListView.builder(
                    itemCount: ref.watch(Providers.imagesList).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImagesPage(images: ref.watch(Providers.imagesList),index: index,)));
                          },
                          child: Image.file(File(ref.watch(Providers.imagesList)[index]),fit: BoxFit.cover,),
                        ),
                        SizedBox(width: 5.w,)
                      ],
                    );
                  },
                  ),
                ),
              ),
              InkWell(
                child: const Icon(Icons.photo_library_sharp,size: 32,color: Colors.white,),
                onTap: () async{
                  images = ref.read(Providers.imagesList);
                  List<XFile?> XFileimages = await picker.pickMultiImage();
                  for(int i = 0;i < XFileimages.length; i++){
                    images.add(XFileimages[i]!.path.toString());
                  }
                  ref.read(Providers.imagesList.notifier).update((state) => images);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MyFirstPage(),));
                },
              ),
              SizedBox(
                width: 10.w,
              ),
              InkWell(
                child: const Icon(Icons.camera_alt,size: 32,color: Colors.white,),
                onTap: () async{
                  XFile? image = await picker.pickImage(source: ImageSource.camera);
                  if(image != null){
                    images = ref.read(Providers.imagesList);
                    images.add(image.path);
                    ref.read(Providers.imagesList.notifier).update((state) => images);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MyFirstPage(),));
                  }
                },
              ),
              SizedBox(
                width: 10.w,
              ),
              InkWell(
                child: const Icon(Icons.done,size: 32,color: Colors.white,),
                onTap: () async{
                  DateTime? date = await _getTime(context);
                  Diary _diary = Diary(title: ref.read(Providers.inputDiaryTitle).text,text: ref.read(Providers.inputDiaryText).text, time: date,images: ref.read(Providers.imagesList));
                  ref.read(Providers.diaryList).add(_diary);
                  ref.read(Providers.inputDiaryTitle.notifier).update((state) => TextEditingController());
                  ref.read(Providers.inputDiaryText.notifier).update((state) => TextEditingController());
                  ref.read(Providers.imagesList.notifier).update((state) => []);
                  ref.read(Providers.inputDiary.notifier).update((state) => false);
                  for(int i = ref.read(Providers.diaryList).length - 1; i < ref.read(Providers.diaryList).length; i++) {
                    box.add(ref.read(Providers.diaryList)[i]);
                  }
                  debugPrint(box.getAt(ref.read(Providers.diaryList).length - 1).toString());
                }
              ),
            ],
          ),
        ),
        TextField(
          controller: ref.watch(Providers.inputDiaryTitle),
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
          decoration: const InputDecoration(
            hintText: "Başlık",
            border: InputBorder.none,
          ),
        ),
        Expanded(
          child: TextField(
            controller: ref.watch(Providers.inputDiaryText),
            autofocus: true,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              hintText: "Bugün neler yaşadınız?",
              border: InputBorder.none,
            ),
            maxLines: 25,
          ),
        ),
      ],
    );
  }
  
  double _getyukseklik(int length)
  {
    if(length > 0){
      return 100.h;
    }
    else{
      return 50.h;
    }
  }
  
  Future<DateTime?> _getTime(BuildContext context) {
    return showDatePicker(context: context,
        initialDate: DateTime.now(), firstDate: DateTime(2023), lastDate: DateTime.now());
  }
}