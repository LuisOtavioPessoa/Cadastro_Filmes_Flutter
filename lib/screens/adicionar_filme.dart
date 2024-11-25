import 'package:flutter/material.dart';
import 'package:myapp/database/filme_dao.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:myapp/model/filme.dart'; // Importando o modelo Filme

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

  // Controladores para capturar os dados dos campos
  final TextEditingController _urlImagemController = TextEditingController();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  // Função para salvar os dados no banco
  void _salvarFilme() async {
    // Verificar se o formulário é válido
    if (_formKey.currentState!.validate()) {
      // Criando o objeto Filme com os dados inseridos
      Filme filme = Filme(
        _urlImagemController.text, // URL da imagem
        _tituloController.text, // Título
        _generoController.text, // Gênero
        _faixaSelecionada ?? '', // Faixa Etária
        int.parse(_duracaoController.text), // Duração (convertido para int)
        _nota.toInt(), // Pontuação (convertido para int)
        _descricaoController.text, // Descrição
        int.parse(_anoController.text), // Ano (convertido para int)
      );

      // Chama o DAO para inserir o filme no banco
      await FilmeDao.inserir(filme);

      // Exibir uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Filme cadastrado com sucesso!')),
      );

      // Limpar os campos após salvar
      setState(() {
        _urlImagemController.clear();
        _tituloController.clear();
        _generoController.clear();
        _faixaSelecionada = null;
        _duracaoController.clear();
        _nota = 0;
        _anoController.clear();
        _descricaoController.clear();
      });

      // Retorna para a tela anterior e atualiza a lista
      Navigator.pop(context,
          true); // Passa 'true' para indicar que o filme foi adicionado
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF131047),
        title: Text('Cadastrar Filme', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _urlImagemController,
                decoration: const InputDecoration(labelText: 'URL Imagem'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a URL da imagem.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o título do filme.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _generoController,
                decoration: const InputDecoration(labelText: 'Gênero'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o gênero do filme.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Faixa Etária'),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Escolha a faixa etária.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _duracaoController,
                decoration:
                    const InputDecoration(labelText: 'Duração (minutos)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a duração do filme.';
                  }
                  return null;
                },
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
                controller: _anoController,
                decoration: const InputDecoration(labelText: 'Ano'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o ano do filme.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                minLines: 1,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe uma descrição do filme.';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _salvarFilme,
        child: const Icon(Icons.save),
      ),
    );
  }
}
