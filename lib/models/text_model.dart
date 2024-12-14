import 'package:cloud_firestore/cloud_firestore.dart';


class TextModel {
  DateTime dataHora = DateTime.now();
  String text = "";
  String userId = "";
  String nickname = "";

  TextModel( {required this.text,  required this.userId,  required this.nickname});

  TextModel.fromJson(Map<String, dynamic> json) {
    dataHora=(json['dataHora'] as Timestamp).toDate();
    text = json['text'];
    userId = json['userId'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataHora'] = Timestamp.fromDate(this.dataHora);
    data['text'] = this.text;
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    return data;
  }
}
