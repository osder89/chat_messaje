import 'package:chat_messaje/helper/get_yes_not_answer.dart';
import 'package:flutter/material.dart';

import '../entities/menssage.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNotAnswer getYesNotAnswer = GetYesNotAnswer();
  List<Message> messageList = [
    Message(text: 'Hola Messi', fromWho: FromWho.me),
    Message(text: 'El goat ', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    if (text.isEmpty) return;

    messageList.add(newMessage);
    if (text.endsWith('?')) {
      herReply();
    }
    moveScrollToBottom();
    notifyListeners();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }

  Future<void> herReply() async {
    final newMessage = await getYesNotAnswer.getAnswer();
    messageList.add(newMessage);
    moveScrollToBottom();
    notifyListeners();
  }
}
