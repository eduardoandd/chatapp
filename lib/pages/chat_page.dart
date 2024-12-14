// ignore_for_file: prefer_const_constructors

import 'package:chatapp/models/text_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  final String nickname;
  const ChatPage({Key? key, required this.nickname}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final db = FirebaseFirestore.instance;
  final textController = TextEditingController(text: '');
  String userId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarUsuario();
  }

  void carregarUsuario()async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('user_id')!;
    setState(() {
      
    });
  }

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
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.black)),
              child: Row(children: [
                // ignore: prefer_const_constructors
                Expanded(
                    child: TextField(
                      controller: textController,
                  decoration: InputDecoration(focusedBorder: InputBorder.none),
                )),
                IconButton(onPressed: ()async {
                  var textModel = TextModel(text:textController.text, userId:userId, nickname: widget.nickname);
                  await db.collection("chat").add(textModel.toJson());
                  textController.text ='';

                }, icon: Icon(Icons.send))
              ]),
            )
          ],
        ),
      ),
    ));
  }
  
  
}
