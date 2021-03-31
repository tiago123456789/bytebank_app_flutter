
import 'package:bytebank/models/Transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: this._controladorCampoNumeroConta,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                  labelText: 'Número da conta', hintText: '0000'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: this._controladorCampoValor,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0.00'),
            ),
          ),
          RaisedButton(
              child: Text("Confirmar"),
              onPressed: () {
                debugPrint("Clicked");
                final int numeroConta =
                    int.tryParse(this._controladorCampoNumeroConta.text);
                final double valor =
                    double.tryParse(this._controladorCampoValor.text);
                if (numeroConta != null && valor != null) {
                  Transferencia transferCreated =
                  Transferencia(valor, numeroConta);
                  Navigator.pop(context, transferCreated);
                }
              })
        ],
      ),
      appBar: AppBar(
        title: Text("Criaruma transferências"),
      ),
    );
  }
}
