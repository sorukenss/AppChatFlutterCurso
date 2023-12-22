import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

mostrarAlerta (BuildContext context, String titulo, String subtitulo){

    if(Platform.isAndroid){
      return showDialog(
      context: context,
       builder: ( _ ) => AlertDialog(
        title: Text(titulo),
        content: Text(subtitulo),
        actions: [
          MaterialButton(
            child: const Text('OK'),
            elevation: 5,
            textColor: Colors.blue,
            onPressed: () => Navigator.pop(context)
            )
        ],
      )
      );
    }else{
      showCupertinoDialog(
      context: context,
       builder: ( _ ) => CupertinoAlertDialog(
        title: Text(titulo),
        content: Text(subtitulo),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context)
            )
        ],
      )
      );
    }

  
}