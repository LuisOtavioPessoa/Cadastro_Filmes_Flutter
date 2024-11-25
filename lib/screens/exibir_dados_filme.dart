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
        backgroundColor: const Color(0xFF131047),
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
                  Image.network(
                    filme.faixaEtaria == 'Livre'
                        ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/DJCTQ_-_L.svg/1024px-DJCTQ_-_L.svg.png'
                        : filme.faixaEtaria == '10'
                            ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/DJCTQ_-_10.svg/1200px-DJCTQ_-_10.svg.png'
                            : filme.faixaEtaria == '12'
                                ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/DJCTQ_-_12.svg/240px-DJCTQ_-_12.svg.png'
                                : filme.faixaEtaria == '14'
                                    ? 'https://logodownload.org/wp-content/uploads/2017/07/classificacao-14-anos-logo.png'
                                    : filme.faixaEtaria == '16'
                                        ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/DJCTQ_-_16.svg/768px-DJCTQ_-_16.svg.png'
                                        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzuCJ86HARUgSIxx06gqSnATgoajvKH9fmLw&s',
                    width: 24,
                    height: 24,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error, size: 24),
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
