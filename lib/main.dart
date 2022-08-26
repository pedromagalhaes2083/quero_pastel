import 'package:flutter/material.dart';
import 'package:quero_pastel/home.dart';
import 'package:quero_pastel/widgets_dados/pedido_detail.dart';

void main() {
  runApp(const Project());
}

class Project extends StatelessWidget{
  const Project({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/detail': (context) => const Pedido_Detail(),
      }, // Rota Principal

    );
  }
}
