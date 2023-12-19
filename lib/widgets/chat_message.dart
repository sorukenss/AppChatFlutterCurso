import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  
  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    super.key, 
    required this.texto, 
    required this.uid, 
    required this.animationController
    });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: this.uid == '123'
          ?_myMessage()
          :_notMyMessage(),
        ),
      ),
    );
  }
  Widget _myMessage(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 5, left: 50,right: 5),
        child: Text(this.texto),
        decoration: BoxDecoration(
          color: Color(0xff4D9Ef6),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }

  Widget _notMyMessage(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 5, left: 5,right: 50),
        child: Text(this.texto),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 122, 158, 196),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}