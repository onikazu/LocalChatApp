import 'package:flutter/material.dart';
import 'package:local_chat_app/services/message_service.dart';
import 'package:provider/provider.dart';
import 'widgets/chat_message.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  final String title = "Friendly Chat";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: ChangeNotifierProvider<ChatMessageService>(
        create: (_) => ChatMessageService(),
        child: HomePage()
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  final String title = "Friendly Chat";
  final TextEditingController _textEditingController = TextEditingController();

  Widget _buildTextComposer(BuildContext context) {
    final chat_message_service = Provider.of<ChatMessageService>(context);
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration.collapsed(hintText: "Send a message"),
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  ChatMessage message = new ChatMessage(
                    text: _textEditingController.text,
                  );
                  _textEditingController.clear();
                  chat_message_service.add_message(message);
                },
              ),
            )
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chat_message_service = Provider.of<ChatMessageService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => chat_message_service.messages[index],
              itemCount: chat_message_service.messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor
            ),
            child: _buildTextComposer(context),
          ),
        ],
      ),
    );
  }
}






















