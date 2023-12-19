import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat_flapp/models/usuario.dart';



class UsuarioPage extends StatefulWidget {

  static const String routeName='UsuarioPage';

  const UsuarioPage({super.key});

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
   RefreshController _refreshController = RefreshController(initialRefresh: false);
   final usuarios = [
    Usuario(uid: '1',nombes: 'car',email: 'car@hotmail.com',online: true),
    Usuario(uid: '2',nombes: 'cat',email: 'cat@hotmail.com',online: true),
    Usuario(uid: '3',nombes: 'top',email: 'top@hotmail.com',online: false),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My name', style: TextStyle(color: Colors.black87)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black87,),
          onPressed: (){},
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              //child: Icon(Icons.check_circle, color: Colors.blue[400]),
            child: Icon(Icons.offline_bolt, color: Colors.red),
            )
          ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header: WaterDropHeader(
          complete: Icon(Icons.check_circle, color: Colors.blue[400]),
          waterDropColor: Colors.blue ,
        ),
        child: _ListViewUsuarios(),
        ),
   );
  }

  ListView _ListViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _UsuariosListTitle(usuarios[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: usuarios.length);
  }

  ListTile _UsuariosListTitle(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombes!),
        subtitle: Text(usuario.email!),
        leading: CircleAvatar(
          child: Text(usuario.nombes!.substring(0,2)),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: usuario.online! ? Colors.green[400] : Colors.red[400],
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }
  _cargarUsuarios() async {
      await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}