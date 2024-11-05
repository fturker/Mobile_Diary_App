import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final Alignment alignment;
  final Color color;
  const ChatBubble(
      {super.key,
      required this.text,
      required this.alignment,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Text(text),
    );
  }
}
