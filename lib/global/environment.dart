


import 'dart:io';

class Environment {
  static String apiUrl   = Platform.isAndroid ? 'http://10.0.2.2:3000/api' : 'http://localhost:3000/api';
  static String soketUrl = Platform.isAndroid ? 'http://10.0.2.2:3000'     : 'http://localhost:3000';
}