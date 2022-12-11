import 'package:flutter/material.dart';
import 'package:sokyo/models/user.dart';
import 'package:sokyo/views/chat/widgets/message_body.dart';
import 'package:sokyo/views/chat/widgets/profile_header.dart';

class ChatPage extends StatefulWidget {
  final String sender;
  const ChatPage({required this.sender, Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeader(
                user: User(
                    name: widget.sender, userName: "", userAvatarLink: "")),
            const Expanded(child: MessageBody()), // wrap with Stack if required
            // const NewTextWidget(),
          ],
        ),
      ),
    );
  }
}
