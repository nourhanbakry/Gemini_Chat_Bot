import 'package:chat_bot/features/chat_bot/logic/cubit/send_message_cubit.dart';
import 'package:chat_bot/features/chat_bot/logic/cubit/send_message_state.dart';
import 'package:chat_bot/features/chat_bot/ui/widgets/message_item.dart';
import 'package:chat_bot/features/chat_bot/ui/widgets/message_with_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SendMessageCubit, SendMessageState>(
        builder: (context, state) {
          final messageList = context.read<SendMessageCubit>().messagesList;
          return ListView.builder(
            controller: SendMessageCubit.scrollController,
            itemCount: messageList.length,
            itemBuilder: (context, index) {
              if (messageList[index]['image'] != null) {
                return MessageWithImage(
                  image: messageList[index]['image'],
                  message: messageList[index]['message'],
                  isMe: messageList[index]['isMe'],
                );
              } else {
                return MessageItem(
                  message: messageList[index]['message'],
                  isMe: messageList[index]['isMe'],
                );
              }
            },
          );
        },
      ),
    );
  }
}
