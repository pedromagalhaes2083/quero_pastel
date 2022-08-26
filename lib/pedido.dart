import 'dados_pedido.dart';

class Pedido{
  int id;
  String cliente;
  Dados_Pedido dados;
  Pedido(this.id, this.cliente, this.dados);

  @override
  String toString(){
    return "($id, $cliente, $dados)";
  }
}