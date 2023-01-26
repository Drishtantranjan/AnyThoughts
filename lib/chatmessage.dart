import 'package:chat_gpt_integration/imageChanger.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.text, required this.sender});

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChangeImage(sender: sender),
        // Text(sender).text.color(Colors.white).subtitle1(context).make().circle().color(sender=="."? Color(0xff7269e3) : Color(0xff272b38)),
        Expanded(
          child: text.trim().text.color(Colors.white).bodyText1(context).make().p16(),
          
        ),
      ],
    ).py8();
  }
}