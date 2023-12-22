import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:chat_flapp/models/usuario.dart';
import 'package:chat_flapp/global/environment.dart';
import 'package:chat_flapp/models/login_response.dart';


class AuthServices with ChangeNotifier {

  late Usuario? usuario;
  bool _autenticando = false;
  final _storage = new FlutterSecureStorage();


  bool get autenticando => this._autenticando;

   set autenticando( bool valor){
   this._autenticando= valor;
   notifyListeners();
  }

  static Future<String> getToken() async{
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token!;
  }
   static Future<void> deleteToken() async{
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
    
  }

    Future<bool> login(String email, String password) async{

      this.autenticando=true;

      final data ={
        'email':email,
        'password':password,
      };

     final uri = Uri.parse('${Environment.apiUrl}/login');
     final resp = await http.post(uri,
     body:jsonEncode(data),
     headers: {
      'Content-Type' : 'application/json'
     }
     );
      this.autenticando= false;
     if(resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;
      await this._guardarToken(loginResponse.token);
      return true;
     }else{
      return false;
     }
    }

    Future register(String email, String password, String name) async{
      this.autenticando=true;
       final data ={
        'email':email,
        'password':password,
        'nombre' : name,
      };
      final uri = Uri.parse('${Environment.apiUrl}/login/new');
      final resp = await http.post(uri,
      body:jsonEncode(data),
       headers: {
      'Content-Type' : 'application/json'
     }
     );
      this.autenticando= false;
      if(resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

      await this._guardarToken(loginResponse.token);
      return true;
     }else{
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
     }
    }

  Future _guardarToken (String token) async{
   return await _storage.write(key: 'token', value: token);
  }

  Future logout() async{
    await _storage.delete(key: 'token');
  }

  Future<bool> isLogedIn () async{
     final token = await this._storage.read(key: 'token');
     final uri = Uri.parse('${Environment.apiUrl}/login/renew');
     final resp = await http.get(uri,
     headers: {
      'Content-Type' : 'application/json',
      'x-token': token ?? 'no hay token'
     }
     );
     if(resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

       await this._guardarToken(loginResponse.token);
      return true;
     }else{
      this.logout();
      return false;
     }

  }

}