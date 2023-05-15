import 'package:flutter/material.dart';

class ChatBotPage extends StatefulWidget {
  ChatBotPage({Key? key}) : super(key: key);

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset('images/under.png'),
        ),
        Container(
          child: Text(
            'فازة مهبولة في الثنية',
            style: TextStyle(
                fontSize: 45,
                fontFamily: 'Blaka',
                color: Colors.yellow.shade600),
          ),
        )
      ],
    );
  }
}
