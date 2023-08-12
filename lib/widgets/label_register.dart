
import 'package:flutter/material.dart';

class LabelsRegister extends StatelessWidget {
  final String ruta;
  final String titulo;
  final String subtitulo;
  const LabelsRegister({super.key, required this.ruta, required this.titulo, required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(subtitulo, style: TextStyle(fontSize: 15,color: Colors.black45,fontWeight: FontWeight.w300),),
          const SizedBox(height: 10,),
           GestureDetector(
            child: Text(titulo,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue[300]),),
            onTap: (){
              Navigator.pushReplacementNamed(context, ruta);
            },
            ),

        ],
      ),
    );
  }
}