import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:chat_flapp/services/auth_services.dart';
import 'package:chat_flapp/helpers/mostrar_alaerta.dart';

import 'package:chat_flapp/widgets/widgets.dart';
import 'package:chat_flapp/pages/pages.dart';


class ResgisterPage extends StatelessWidget {
  
  static const String routeName='RegisterPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LogoInitial(title: 'Registro',),
                  
                  __FormState(),
                
                  LabelsRegister(ruta: LoadingPage.routeName,titulo: 'Volver al Login',subtitulo: 'Ya registraste La Cuenta?',),
                
                  _Conditions()
                ],
              ),
            ),
          ),
        ),
       ),
    );
  }
}

class _Conditions extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: const Text('Terminos y condiciones de uso',
       style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300, color: Colors.black54),)
       );
  }
}


class __FormState extends StatefulWidget {
 
  @override
  State<__FormState> createState() => ___FormStateState();
}

class ___FormStateState extends State<__FormState> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final authServices =  Provider.of<AuthServices>(context);
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          
         CustomInput(
          icon: Icons.perm_identity,
           placeholder: 'Nombre',
           textInputType: TextInputType.text,
           textEditingController: nameCtrl,
            ),
         CustomInput(
          icon: Icons.email_outlined,
           placeholder: 'Email',
           textInputType: TextInputType.emailAddress,
           textEditingController: emailCtrl,
            ),
         CustomInput(
          icon: Icons.lock_open_outlined,
           placeholder: 'Password',
           textInputType: TextInputType.text,
           isPassword: true,
           textEditingController: passwordCtrl,
            ),
            BlueButton(text: 'Registrar Cuenta', onPressed: authServices.autenticando ? null:() async{

              final resgistroOk = await authServices.register(emailCtrl.text.trim(), passwordCtrl.text.trim(), nameCtrl.text.trim());
              if(resgistroOk == true){
                //TODO mandar al sokect service
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UsuarioPage()));
              }else{
                mostrarAlerta(context, 'No se registror', resgistroOk);
              }
            })
        ]),
    );
  }
}

