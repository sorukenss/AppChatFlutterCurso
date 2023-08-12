
import 'package:chat_flapp/pages/pages.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes={
  
  ChatPage.routeName      : (_) => ChatPage(),
  UsuarioPage.routeName   : (_) => UsuarioPage(),
  LoadingPage.routeName   : (_) => LoadingPage(),
  LoginPage.routeName     : (_) => LoginPage(),
  ResgisterPage.routeName : (_) => ResgisterPage(),

};