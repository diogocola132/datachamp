import 'package:flutter/material.dart';
import 'package:flutter_datachamp/screens/telaindicador.dart';

 void main() {
    runApp(const IndicadorApp());
  }

  class IndicadorApp extends StatelessWidget{
  const IndicadorApp({super.key});

    @override
    Widget build(BuildContext context){
      return  const MaterialApp(
        title: "Cadastro de Indicadores",
        home: IndicadorScreen(),
      );
    }
  }

 