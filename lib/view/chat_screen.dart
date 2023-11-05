import 'package:chat_messaje/widget/her_message_bubble.dart';
import 'package:chat_messaje/widget/message_field_box.dart';
import 'package:chat_messaje/widget/my_message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../entities/menssage.dart';
import '../provider/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s3p.sofifa.net/d0eb8f77c56aceb744230e673119a76339cbe081.jpg')),
            ),
            title: const Text('Messi '),
          ),
          body: _ViewChat()),
    );
  }
}

class _ViewChat extends StatelessWidget {
  const _ViewChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>(); //probar con messaje
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (contex, index) {
                      final message = chatProvider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(
                              message: message,
                            )
                          : MyMessageBubble(
                              message: message,
                            );
                    })),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
