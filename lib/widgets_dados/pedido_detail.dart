import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quero_pastel/widgets_dados/pedido_arg.dart';
import 'package:quero_pastel/widgets_dados/pedido_dados.dart';

class Pedido_Detail extends StatelessWidget{
  const Pedido_Detail({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context){
    final Pedido_Arg args =
    ModalRoute.of(context)!.settings.arguments as Pedido_Arg;
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'Pedido: ' + args.pedido.cliente.toString(),
            style: const TextStyle(color: Colors.white),
          )),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                color: Colors.deepOrange[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Pedido_Dados(
                      args: args,
                      title: "CLIENTE",
                      initialValue: args.pedido.cliente,
                      onUpdate: (value) => args.pedido.cliente = value,
                    ),
                    Pedido_Dados(
                      args: args,
                      title: "PEDIDO",
                      initialValue: args.pedido.dados.Pedido,
                      onUpdate: (value) => args.pedido.dados.Pedido = value,
                    ),
                    Pedido_Dados(
                      args: args,
                      title: "CONTATO",
                      initialValue: args.pedido.dados.Numero,
                      onUpdate: (value) => args.pedido.dados.Numero = value,
                    ),
                    Pedido_Dados(
                      args: args,
                      title: "VALOR",
                      initialValue: args.pedido.dados.Valor,
                      onUpdate: (value) => args.pedido.dados.Valor = toInt(value),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

int toInt(String texto){
  return int.tryParse(texto) ?? 0;
}