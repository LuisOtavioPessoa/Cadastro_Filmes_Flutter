import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/model/filme.dart';

class ExibirDadosFilme extends StatelessWidget {
  final Filme filme;

  ExibirDadosFilme({required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 133, 235),
        title: Text('Detalhes', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  filme.urlImagem,
                  width: 200,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.broken_image, size: 100),
                ),
              ),
              SizedBox(height: 16),
              Text(
                filme.titulo,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${filme.ano}',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  Text(
                    filme
                        .faixaEtaria, // Substitua por classificação etária, se disponível
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                filme.genero,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 4),
              Text(
                '${filme.duracao} min',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 8),
              RatingBarIndicator(
                rating: filme.pontuacao.toDouble(),
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: Colors.amber),
                itemCount: 5,
                itemSize: 25,
              ),
              SizedBox(height: 16),
              Text(
                filme.descricao,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
