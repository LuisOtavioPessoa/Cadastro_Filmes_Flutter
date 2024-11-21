import 'package:flutter/material.dart';
import 'package:myapp/database/filme_dao.dart';
import 'package:myapp/model/filme.dart';
import 'screens/lista_filmes.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Garante que o binding está configurado
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Filmes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaFilmes(), // Define a tela de listagem como inicial
    );
  }
}
