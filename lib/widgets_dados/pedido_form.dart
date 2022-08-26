import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quero_pastel/dados_pedido.dart';
import 'package:quero_pastel/util.dart';

class Pedido_Form extends StatefulWidget { 
  final void Function(String, Dados_Pedido) submit;
  const Pedido_Form({Key? key, required this.submit}) : super(key : key);

  @override 
  State<Pedido_Form> createState() => Pedido_FormState();
}

class Pedido_FormState extends State<Pedido_Form> {
  final String? cliente = 'Cliente';
  final String? pedido = 'Pedido';
  final String? valor = 'Valor';
  final String? numero = 'Número';

  final String save = 'Salvar';

  final cliente_controller = TextEditingController();
  final pedido_controller = TextEditingController();
  final valor_controller = TextEditingController();
  final numero_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 10 + MediaQuery.of(context).viewInsets.bottom
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: cliente_controller,
            decoration: InputDecoration(
              labelText: cliente,
              border: const OutlineInputBorder()
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10.0)),
          TextField(
            controller: pedido_controller,
            decoration: InputDecoration(
              labelText: pedido,
              border: const OutlineInputBorder()
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10.0)),
          TextField(
            controller: numero_controller,
            decoration: InputDecoration(
              labelText: numero,
              border: const OutlineInputBorder()
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10.0)),
          TextField(
            controller: valor_controller,
            decoration: InputDecoration(
              labelText: valor,
              border: const OutlineInputBorder()
            ),
          ),
          ElevatedButton( 
            onPressed: (){
            if(cliente_controller.text.length > 2){
              widget.submit((cliente_controller.text), Dados_Pedido(To_Int(valor_controller.text), pedido_controller.text, numero_controller.text));
            }
           }, 
           child: Text(
                save,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
          )
        ],
      ),
    );
  }
}