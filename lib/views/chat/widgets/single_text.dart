import 'package:flutter/material.dart';

// A single text message

class SingleText extends StatelessWidget {
  final String text;
  final bool isMe;
  const SingleText({required this.text, required this.isMe, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Align(
        alignment: isMe ? Alignment.topRight : Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: !isMe ? Colors.blue[200] : Colors.grey.shade200,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
