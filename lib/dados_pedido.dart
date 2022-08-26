import 'util.dart';

class Dados_Pedido
{
  int _valor = 0;
  String _pedido = "";
  String _numero = "";

  Dados_Pedido(int valor, String pedido, String numero){
    if(Validar_Inteiro(valor)) _valor = valor;
    if(Validar_String(pedido)) _pedido = pedido;
    if(Validar_String(numero)) _numero = numero;
  }
  set Valor(int valor)
  {
    if(Validar_Inteiro(valor)) _valor = valor;
  }
  int get Valor => _valor;

  set Pedido (String pedido)
  {
    if(Validar_String(pedido)) _pedido = pedido;
  }
  String get Pedido => _pedido;

  set Numero (String numero)
  {
    if(Validar_String(numero)) _numero = numero;
  }
  String get Numero => _numero;
}