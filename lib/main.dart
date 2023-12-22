import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_flapp/routes/routes.dart';

import 'package:chat_flapp/pages/pages.dart';
import 'package:chat_flapp/services/auth_services.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServices()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CHAT',
        initialRoute: LoginPage.routeName,
        routes: {
            ChatPage.routeName      : (_) => ChatPage(),
            UsuarioPage.routeName   : (_) => UsuarioPage(),
            LoadingPage.routeName   : (_) => LoadingPage(),
            LoginPage.routeName     : (_) => LoginPage(),
            ResgisterPage.routeName : (_) => ResgisterPage(),
        },
      ),
    );
  }
}