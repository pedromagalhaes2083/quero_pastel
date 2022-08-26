bool Validar_Inteiro(int valor) {
  return (valor > 0);
}
bool Validar_String(String valor){
  return valor != "";
}
int To_Int(String texto){
 return int.tryParse(texto) ?? 0;
}
 