import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text});
  final String text;
  final String _name = "KazSapp";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: Text(_name[0])),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_name, style: Theme.of(context).textTheme.subhead,),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
              )
            ],
          ),
        ],

      ),
    );
  }
}
