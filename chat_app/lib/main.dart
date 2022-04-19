import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(
          canvasColor: Colors.transparent,
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      home: LoginPage(),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
