import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gunluk/widgets/chat_bubble.dart';
import 'package:hive/hive.dart';

import '../models/Chat.dart';

const _apiKey = "AIzaSyB6RfsxLujWqRFnWZapqspNJqOagxmdjPM";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GenerativeModel model;
  static var box = Hive.box<Chat>("chats");
  final TextEditingController _chatController = TextEditingController();
  final List<Widget> chats = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: _apiKey,
    );
    chats.add(const ChatBubble(
      text: "Merhaba.",
      alignment: Alignment.centerRight,
      color: Colors.purple,
    ));
  }

  @override
  void dispose() {
    _chatController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return chats[index];
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: TextField(
                    controller: _chatController,
                    decoration: InputDecoration(
                        hintText: "Bir konuşma başlat!",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.w),
                child: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.blue,
                    size: 48.w,
                  ),
                  onPressed: () async {
                    String prompt = _chatController.text;
                    List<Content> content = [Content.text(prompt)];
                    GenerateContentResponse response =
                        await model.generateContent(content);
                    setState(() {
                      chats.add(ChatBubble(
                          text: _chatController.text,
                          alignment: Alignment.centerLeft,
                          color: Colors.blue));
                      chats.add(ChatBubble(
                        text: response.text!,
                        alignment: Alignment.centerRight,
                        color: Colors.purple,
                      ));
                    });
                    _chatController.clear();
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => scrollToBottom());
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
