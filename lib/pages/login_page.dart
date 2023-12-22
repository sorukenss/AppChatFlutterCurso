import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_flapp/pages/pages.dart';
import 'package:chat_flapp/services/auth_services.dart';


class LoginPage extends StatelessWidget {
  static const String routeName='LoginPage';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
         future: checkLogin(context),
        builder: (context,snapshot) { 
          return Center(
          child: Text('Espere...'),
           );
         },
       
        
      ),
   );
  }

  Future checkLogin(BuildContext context)async{
    final authServices = Provider.of<AuthServices>(context, listen: false);

    final autenticando= await authServices.isLogedIn();

    if(autenticando){
      //TODO conectar al socket server
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UsuarioPage()));
    }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoadingPage()));
      
    }


  }
}