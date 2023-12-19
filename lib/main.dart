import 'package:chat_flapp/pages/pages.dart';
import 'package:chat_flapp/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CHAT',
      initialRoute: ChatPage.routeName,
      routes: appRoutes,
    );
  }
}