import 'dart:developer';
import 'dart:io';
import 'package:chat_bot/features/chat_bot/data/models/message_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiServices {
  MessageModel messageModel = MessageModel();
  final GenerativeModel model;
  GeminiServices({required this.model});

  sendMessageFromUser({required String message,File? image}) {
    messageModel.addMessage(message: message, isMe: true,image: image);
    log(messageModel.messages.toString());
    return messageModel.messages;
  }

  Future generateContentFromText({required String prompt}) async {
    final response = await model.generateContent([Content.text(prompt)]);
    log(response.text!);
    messageModel.addMessage(message: response.text, isMe: false);
    log(messageModel.messages.toString());
    return messageModel.messages;
  }

  Future generateContentFromImage(
      {required String prompt, required File image}) async {
    final text = TextPart(prompt);
    final imageBytes = await File(image.path).readAsBytes();
    final imageParts = [DataPart('image/jpeg', imageBytes)];

    final response = await model.generateContent([
      Content.multi([text, ...imageParts])
    ]);

    messageModel.addMessage(message: response.text, isMe: false);

    return messageModel.messages;
  }
}
