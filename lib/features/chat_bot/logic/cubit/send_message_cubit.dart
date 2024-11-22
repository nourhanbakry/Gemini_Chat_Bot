import 'dart:developer';
import 'dart:io';
import 'package:chat_bot/core/app_toast.dart';
import 'package:chat_bot/features/chat_bot/data/services/gemini_services.dart';
import 'package:chat_bot/features/chat_bot/logic/cubit/send_message_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit() : super(const SendMessageState.initial());
  List messagesList = [];
  static ScrollController scrollController = ScrollController();

  static GenerativeModel getModel() {
    final key = dotenv.env['API_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception('API_KEY not found');
    }
    return GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: key);
  }

  final gemninServices = GeminiServices(model: getModel());

  Future generateContentFromText({required String prompt}) async {
    try {
      final messagesFromUser =
          gemninServices.sendMessageFromUser(message: prompt);
      messagesList = messagesFromUser;
      emit(const SendMessageState.loading());
      List<Map<String, dynamic>> response =
          await gemninServices.generateContentFromText(prompt: prompt);
      log("responce is $response");
      messagesList.addAll(response);
      emit(const SendMessageState.success());
      return messagesList;
    } catch (e) {
      if (e is GenerativeAIException) {
        return showToast(message: "Server Error, please try again later");
      }
      log("error is$e");

      emit(const SendMessageState.failure());
    }
  }

  Future generateContentFromImage(
      {required File image, required String prompt}) async {
    try {
      gemninServices.sendMessageFromUser(message: prompt, image: image);

      emit(const SendMessageState.loading());
      final response = await gemninServices.generateContentFromImage(
          image: image, prompt: prompt);
      log("responce is $response");
      messagesList.addAll(response);
      emit(const SendMessageState.success());

      return response;
    } catch (e) {
      if (e is GenerativeAIException) {
        return showToast(message: "Server Error, please try again later");
      }
      log("error is$e");

      emit(const SendMessageState.failure());
    }
  }
}
