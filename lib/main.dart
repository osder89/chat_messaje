import 'package:chat_messaje/config/theme/app_theme.dart';
import 'package:chat_messaje/provider/chat_provider.dart';
import 'package:chat_messaje/view/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
          title: 'Material App',
          theme: AppTheme(selectedColor: 1).theme(),
          debugShowCheckedModeBanner: false,
          home: const ChatScreen()),
    );
  }
}
