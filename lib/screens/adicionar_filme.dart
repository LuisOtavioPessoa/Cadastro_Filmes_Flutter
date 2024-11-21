import 'package:flutter/material.dart';

class AdicionarFilme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 133, 235),
        title: Text('Cadastrar Filme', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white), 
      ),
      body: Center(
        child: Text(
          'Tela de Adicionar Filme (Fred)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
