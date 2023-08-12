import 'package:chat_flapp/pages/pages.dart';
import 'package:chat_flapp/widgets/widgets.dart';
import 'package:flutter/material.dart';


class LoadingPage extends StatelessWidget {
  
  static const String routeName='LoadingPage';

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
                  LogoInitial(title: 'Messenger',),
                  
                  __FormState(),
                
                  LabelsRegister(ruta: ResgisterPage.routeName,titulo: 'Crear Una Cuenta Ahora',subtitulo: 'No Tienes Una Cuenta?',),
                
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          
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
            BlueButton(text: 'Ingresar', onPressed: (){
              print(emailCtrl);
              print(passwordCtrl);
            })
        ]),
    );
  }
}

