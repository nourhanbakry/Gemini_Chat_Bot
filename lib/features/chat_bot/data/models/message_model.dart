import 'dart:io';

import 'package:chat_bot/features/chat_bot/logic/cubit/send_message_cubit.dart';
import 'package:flutter/material.dart';

class MessageModel {
  final List<Map<String, dynamic>> messages = [];

  addMessage({String? message, File? image, bool? isMe}) {
    messages.add({
      'message': message,
      'image': image,
      'isMe': isMe,
    });
    scrollToMessageEnd();
  }

  void scrollToMessageEnd() {
    Future.delayed(
      const Duration(milliseconds: 50),
      () {
        if (SendMessageCubit.scrollController.hasClients) {
          SendMessageCubit.scrollController.animateTo(
            SendMessageCubit.scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }
}
