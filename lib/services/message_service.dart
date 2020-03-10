import 'package:flutter/cupertino.dart';
import 'package:local_chat_app/widgets/chat_message.dart';

class ChatMessageService extends ChangeNotifier {
  List<ChatMessage> _messages = <ChatMessage>[];
  int _num_messages = 0;

  List<ChatMessage> get messages => _messages;
  int get num_messages => _num_messages;

  void add_message(message){
    _num_messages++;
    _messages.insert(0, message);
    notifyListeners();
  }
}