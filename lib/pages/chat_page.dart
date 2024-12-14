import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatPage extends StatefulWidget {
  final String nickname;
  const ChatPage({Key? key, required this.nickname}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.all(Radius.circular(20)) ,
                border: Border.all(
                  color:Colors.black
                )
              ),
              child: Row(children: [
                Expanded(child: TextField(decoration: InputDecoration(focusedBorder: InputBorder.none),)),
                IconButton(onPressed: () {}, icon: Icon(Icons.send))
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
