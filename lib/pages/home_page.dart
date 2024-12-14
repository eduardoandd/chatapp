import 'package:chatapp/pages/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var nicknameController = TextEditingController();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Informe seu apelido"),
              TextField(
                controller: nicknameController,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                ChatPage(nickname: nicknameController.text)));
                  },
                  child: Text("Entrar no chat"))
            ],
          )),
    ));
  }
}
