import 'package:flutter/material.dart';
import 'package:sokyo/views/chat/widgets/single_text.dart';

// List of messages shown when talking to a user

class MessageBody extends StatefulWidget {
  const MessageBody({Key? key}) : super(key: key);

  @override
  State<MessageBody> createState() => _MessageBodyState();
}

class _MessageBodyState extends State<MessageBody> {
  List<SingleText> chatMessagesList = [
    const SingleText(
      text: "Hey! What's up",
      isMe: false,
    )
  ];

  void _sendMessage() {
    FocusScope.of(context).unfocus();
    setState(() {
      chatMessagesList = chatMessagesList.toList()
        ..add(SingleText(
          text: _chatController.text,
          isMe: true,
        ));
    });
    _chatController.clear();
  }

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
              child: StreamBuilder<List<SingleText>>(
                  // stream: FirebaseChatStorage().getChatsFromSender(
                  //     senderEmail: senderEmail, receiverEmail: receiverEmail),
                  stream: Stream.fromIterable([chatMessagesList]),
                  builder: (context, snapshot) {
                    final chatMessages = snapshot.data;
                    return chatMessages == null || chatMessages.isEmpty
                        ? const Center(
                            child: Text(
                              "Say Hi",
                              style: TextStyle(fontSize: 24),
                            ),
                          )
                        : ListView.builder(
                            itemCount: chatMessages.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final message = chatMessages.elementAt(index);
                              return message;
                            });
                    // message.userId ==  FirebaseChatAPI().currentUser.userId);
                  })),
        ),
        Align(
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
                      child:
                          const Icon(Icons.add, color: Colors.white, size: 20),
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
            ))
      ],
    );
  }
}
