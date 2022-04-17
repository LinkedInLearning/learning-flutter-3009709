import 'dart:convert';
import 'package:chat_app/models/image_model.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //initiate state of messages
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    final response = await rootBundle.loadString('assets/mock_messages.json');

    final List<dynamic> decodedList = jsonDecode(response) as List;

    final List<ChatMessageEntity> _chatMessages = decodedList.map((listItem) {
      return ChatMessageEntity.fromJson(listItem);
    }).toList();

    print(_chatMessages.length);

    //final state of the messages
    setState(() {
      _messages = _chatMessages;
    });
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  //TODO: Get Network Images from API
  _getNetworkImages() async {
    var endpointUrl = Uri.parse('https://pixelford.com/api2/images');

    final response = await http.get(endpointUrl);

    if (response.statusCode == 200) {
      final List<dynamic> decodedList = jsonDecode(response.body) as List;

      final List<PixelfordImage> _imageList = decodedList.map((listItem) {
        return PixelfordImage.fromJson(listItem);
      }).toList();

      print(_imageList[0].urlFullSize);
    }
  }

  @override
  void initState() {
    _loadInitialMessages();
    _getNetworkImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getNetworkImages();
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
                print('Icon pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment:
                            _messages[index].author.userName == 'poojab26'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        entity: _messages[index]);
                  })),
          ChatInput(
            onSubmit: onMessageSent,
          ),
        ],
      ),
    );
  }
}
