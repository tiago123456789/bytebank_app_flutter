
import 'package:bytebank/models/Transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

class ListaTransferencia extends StatefulWidget {

  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {
        final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FormularioTransferencia();
        }));
        future.then((transferenciaRecebida) {
          debugPrint('chegou no then do future');
          debugPrint('$transferenciaRecebida');
           if (transferenciaRecebida != null) {
            setState(() {
              widget._transferencias.add(transferenciaRecebida);
            });
          } 
        });
      },),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferenca;

  ItemTransferencia(this._transferenca);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transferenca.valor.toString()),
        subtitle: Text(this._transferenca.numeroConta.toString()),
      ),
    );
  }
}

