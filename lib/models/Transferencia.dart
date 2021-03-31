
class Transferencia {
  double valor;
  int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  toString() {
    return "Valor => $valor | NumeroConta => $numeroConta";
  }
}