import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class CadastrarFilme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Filme')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'URL Imagem'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Título'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Gênero'),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('Faixa Etária'),
              items: ['Livre', '10', '12', '14', '16', '18']
                  .map((faixa) => DropdownMenuItem(
                        value: faixa,
                        child: Text(faixa),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Duração'),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Nota:'),
                SizedBox(width: 16),
                SmoothStarRating(
                  starCount: 5,
                  rating: 0,
                  size: 30,
                  onRatingChanged: (value) {},
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Ano'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Descrição'),
              maxLines: 5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aqui você pode implementar o salvamento do filme
          Navigator.pop(context, true); // Volta para a tela anterior
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
