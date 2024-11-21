import 'package:flutter/material.dart';
import 'package:myapp/database/filme_dao.dart';
import 'package:myapp/model/filme.dart';
import 'screens/lista_filmes.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Garante que o binding está configurado

  // Insere um filme de teste no banco de dados
  await FilmeDao.inserir(Filme(
    'https://upload.wikimedia.org/wikipedia/pt/1/14/Spide-Man_Poster.jpg', // URL da imagem
    'Homem-Aranha', // Título
    'Ação/Ficção científica', // Gênero
    'Livre', // Faixa Etária
    121, // Duração em minutos
    5, // Pontuação (0 a 5)
    'Depois de ser picado por uma aranha geneticamente modificada em uma demonstração científica, o jovem nerd Peter Parker ganha superpoderes. Inicialmente, ele pretende usá-los para para ganhar dinheiro, adotando o nome de Homem-Aranha e se apresentando em lutas de exibição. Porém, ao presenciar o assassinando de seu tio Ben e sentir-se culpado, Peter decide não mais usar seus poderes para proveito próprio e sim para enfrentar o mal, tendo como seu primeiro grande desafio o psicótico Duende Verde.', // Descrição
    2002, // Ano
  ));

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
