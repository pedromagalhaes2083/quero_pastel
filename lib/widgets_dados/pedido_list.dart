import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quero_pastel/pedido.dart';
import 'package:quero_pastel/widgets_dados/pedido_arg.dart';

class Pedido_List extends StatefulWidget {
  final List<Pedido> pedido_list;
  final void Function(int) delete;
  const Pedido_List({Key? key, required this.pedido_list, required this.delete}) : super (key : key);

  @override
  State<Pedido_List> createState() => _Pedido_ListState();
}

class _Pedido_ListState extends State<Pedido_List> {
  void refresh(){
    setState(() { });
  }
 
  @override
  Widget build(BuildContext context){
    const messagem = "Esse pedido já foi entregue?";
    const sim = 'Sim';
    const nao = 'Não';
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.pedido_list.length,
      itemBuilder: (context, index) {
        final Pedido item = widget.pedido_list[index];
        return ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(
            '/detail',
            arguments: Pedido_Arg (
                pedido: item,
                refresh: refresh
            ),
            );
          },
          trailing: IconButton(
            color: Theme.of(context).errorColor,
            icon: const Icon(Icons.check),
            onPressed: () {
              showDialog (
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      messagem,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange
                      ),                      
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        }, 
                        child: const Text(nao, style: TextStyle(fontWeight: FontWeight.bold),
                         )
                        ),
                        TextButton(
                        onPressed: () {
                          widget.delete(item.id);
                          Navigator.of(context).pop();
                        }, 
                        child: const Text(sim, style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ),
                    ],
                  );
                }
              );
            },
          ),
          leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
            child: const Text('🥟'),
          ),
          title: Text(
            '${item.id} - ${item.cliente}',
            textScaleFactor: 1.4,
            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColorDark),
          ),
          subtitle: Text(item.dados.Pedido.toString()),
        );
      },
    );
  }
}
