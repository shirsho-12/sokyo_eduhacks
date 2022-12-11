import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

// Bottom text bar

class NewTextWidget extends StatefulWidget {
  const NewTextWidget({Key? key}) : super(key: key);

  @override
  State<NewTextWidget> createState() => _NewTextWidgetState();
}

class _NewTextWidgetState extends State<NewTextWidget> {
  late final TextEditingController _chatController;

  @override
  void initState() {
    _chatController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    devtools.log('text sent');
    // FirebaseChatStorage().createChat(
    //     chatId: widget.chatId,
    //     sender: SharedPrefs.userData,
    //     text: _chatController.text.trim());
    _chatController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: TextField(
                  controller: _chatController,
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    hintText: "Aa",
                    hintStyle: const TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      gapPadding: 10,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _sendMessage,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                  ),
                  height: 50,
                  width: 40,
                  // elevation: 0,
                  child: const Icon(
                    Icons.send,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ));
  }
}
