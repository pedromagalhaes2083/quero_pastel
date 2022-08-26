import 'package:quero_pastel/widgets_dados/pedido_form.dart';
import 'package:quero_pastel/widgets_dados/pedido_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quero_pastel/pedido.dart';
import 'dados_pedido.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key:key);
  @override 
  State<Home> createState() => _Home_State();
}
class _Home_State extends State<Home> {
  List<Pedido> pedido = [];

  int id_counter = 1;
  void _add (String cliente, Dados_Pedido dados){
    setState(() {
      pedido.add(Pedido(id_counter, cliente, dados));
    });
    id_counter++;
    Navigator.of(context).pop();
  }
  void _delete(int id){
    setState(() {
      pedido.removeWhere((Pedido item) => item.id == id);
    });
  }
  
  final title = 'MONO - Pastel na Praça';
  @override
  Widget build(BuildContext context){
    final AppBar appBar = AppBar(
      title: Text(
        title, 
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Pedido_Form(submit: _add);
                },
                );
            }, icon: const Icon(Icons.add, color: Colors.white),
          )
        ],
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [  
          SizedBox(
            height: MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top,
            child:  Padding(
              padding: const EdgeInsets.only(top: 10.0),
               child: Pedido_List(
                  delete: _delete,
                  pedido_list: pedido,
                ),
            ), 
          ),
        ],
      ),
    );
  }
}
