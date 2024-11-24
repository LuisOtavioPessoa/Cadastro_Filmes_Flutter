import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cadastrar Filme',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CadastrarFilme(),
    );
  }
}

class CadastrarFilme extends StatefulWidget {
  const CadastrarFilme({super.key});

  @override
  _CadastrarFilmeState createState() => _CadastrarFilmeState();
}

class _CadastrarFilmeState extends State<CadastrarFilme> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _faixaEtaria = ['Livre', '10', '12', '14', '16', '18'];
  String? _faixaSelecionada;
  double _nota = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Filme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'URL Imagem',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Gênero',
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Faixa Etária',
                ),
                value: _faixaSelecionada,
                items: _faixaEtaria.map((faixa) {
                  return DropdownMenuItem(
                    value: faixa,
                    child: Text(faixa),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _faixaSelecionada = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Duração',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Nota:'),
                  const SizedBox(width: 16),
                  SmoothStarRating(
                    allowHalfRating: true,
                    starCount: 5,
                    rating: _nota,
                    size: 30.0,
                    onRatingChanged: (value) {
                      setState(() {
                        _nota = value;
                      });
                    },
                    color: Colors.amber,
                    borderColor: Colors.amber,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ano',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                ),
                minLines: 1,
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Ação ao salvar
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

