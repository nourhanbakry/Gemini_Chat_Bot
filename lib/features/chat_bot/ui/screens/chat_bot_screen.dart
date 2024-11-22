import 'package:chat_bot/features/chat_bot/ui/widgets/message_field.dart';
import 'package:chat_bot/features/chat_bot/ui/widgets/messages_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chat Bot',
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Column(
        children: [
           MessagesListView(),
          MessageField(),
        ],
      ),
    );
  }
}

