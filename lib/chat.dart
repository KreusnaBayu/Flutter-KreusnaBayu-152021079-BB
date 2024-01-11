import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Tawk(
        directChatLink: 'https://tawk.to/chat/659f44288d261e1b5f51b910/1hjr24gao',
        visitor: TawkVisitor(
          name: 'Deklan',
          email: 'Deklan@gmail.com',
        ),
      ),
    );
  }
}