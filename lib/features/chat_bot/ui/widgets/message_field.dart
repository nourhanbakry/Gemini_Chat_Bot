import 'dart:developer';
import 'dart:io';

import 'package:chat_bot/core/app_text_field.dart';
import 'package:chat_bot/features/chat_bot/logic/cubit/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class MessageField extends StatefulWidget {
  const MessageField({super.key});

  @override
  State<MessageField> createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  File? selectedImage;
  final TextEditingController controller = TextEditingController();

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  void sendMessage() {
    if (selectedImage != null || controller.text.isNotEmpty) {
      if (selectedImage != null) {
        context.read<SendMessageCubit>().generateContentFromImage(
              image: selectedImage!,
              prompt: controller.text,
            );
      } else {
        context.read<SendMessageCubit>().generateContentFromText(
              prompt: controller.text,
            );
      }

      setState(() {
        selectedImage = null;
        controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedImage != null)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.file(
                      selectedImage!,
                      height: 100.h,
                      width: 120.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImage = null;
                        });
                      },
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.purple.shade500,
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  controller: controller,
                ),
              ),
              IconButton(
                onPressed: () async {
                  pickImage();
                },
                icon: const Icon(Icons.image),
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    log(controller.text);

                    sendMessage();
                  } else {
                    log("empty");
                  }
                },
                icon: const Icon(Icons.send),
                color: Colors.purple.shade400,
                iconSize: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
