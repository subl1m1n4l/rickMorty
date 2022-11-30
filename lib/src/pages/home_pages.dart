import 'package:flutter/material.dart';

// ignore: camel_case_types
class homePage extends StatelessWidget {
  // ignore: prefer_const_constructors, unnecessary_new
  final estiloTexto = new TextStyle(fontSize: 25);

  homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Titulo'),
        centerTitle: true,
        elevation: 1.13,
        titleTextStyle: const TextStyle(fontSize: 16, fontFamily: ''),
      ),
      // ignore: prefer_const_constructors
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Numero de clicks',
            textAlign: TextAlign.center,
            style: estiloTexto,
          ),
          // ignore: prefer_const_constructors
          Text(
            'hola',
            textAlign: TextAlign.center,
            style: estiloTexto,
          ),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // ignore: prefer_const_constructors
      floatingActionButton: FloatingActionButton(
        // ignore: prefer_const_constructors
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
