import 'dart:io';

import 'package:chat_flapp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {

  static const String routeName='ChatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _textController =  TextEditingController();
  final _focusNode = FocusNode();
  List<ChatMessage> _message = [
  ];
  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      elevation: 1,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 85, 150, 202),
      title: Column(
        children: [
          CircleAvatar(
            child: Text('Te',style: TextStyle(fontSize: 12)),
            backgroundColor: Colors.blueAccent,
            maxRadius: 14,
          ),
          SizedBox(height: 3,),
          Text('Melisaa', style: TextStyle(color: Colors.black87, fontSize: 12)),
        ],
      ),
     ),
     body: Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _message.length,
              itemBuilder: (_, i) => _message[i],
              reverse: true,
            ),
          ),
          Divider(height: 1,),
          Container(
            color: Colors.white,
            child: _inpuctChat(),
          ),
          Divider(height: 5,),
        ],
      ),
     ),
   );
  }

  Widget _inpuctChat(){

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (texto) {
                  setState(() {
                    if(texto.trim().length > 0){
                      _estaEscribiendo=true;
                    }else{
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: const InputDecoration.collapsed(hintText:'Enviar mensaje'),
                focusNode: _focusNode,
              ) 
            ),
            //Boton de enviar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS
              ? CupertinoButton(
                child: Text('Enviar'), 
                onPressed: _estaEscribiendo
                     ? () => _handleSubmit(_textController.text.trim())
                     : null,
                )
                : Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: IconTheme(
                    data: IconThemeData(color:Colors.blue[400]),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                     icon: Icon(Icons.send),
                     onPressed: _estaEscribiendo
                     ? () => _handleSubmit(_textController.text.trim())
                     : null,
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  _handleSubmit(String texto){
    if(texto.length == 0) return;
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();
    final newMessage = new ChatMessage(
      texto: texto,
       uid: '123',
       animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 400)),);
    _message.insert(0,newMessage);
    newMessage.animationController.forward();
    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    //TODO soket
    for(ChatMessage message in _message){
      message.animationController.dispose();
    }
    super.dispose();
  }
}