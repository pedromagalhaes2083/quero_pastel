import '../../pedido.dart';

class Pedido_Arg {
  final Pedido pedido;
  void Function() refresh;
  Pedido_Arg({required this.pedido, required this.refresh});
}
