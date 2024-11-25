import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/database/filme_dao.dart';
import 'package:myapp/model/filme.dart';
import 'package:myapp/screens/editar_filme.dart';

import 'adicionar_filme.dart';
import 'exibir_dados_filme.dart';

class ListaFilmes extends StatefulWidget {
  @override
  _ListaFilmesState createState() => _ListaFilmesState();
}

class _ListaFilmesState extends State<ListaFilmes> {
  List<Filme> filmes = [];

  @override
  void initState() {
    super.initState();
    carregarFilmes();
  }

  void carregarFilmes() async {
    List<Filme> filmesCarregados = await FilmeDao.buscarTodos();
    setState(() {
      filmes = filmesCarregados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF131047),
        title: Text('Lista de Filmes', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Equipe:'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ruã Fernandes Araújo'),
                      Text('Luís Otávio Pessôa da Silva'),
                      Text('Fred Williams Silva Barbosa'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: filmes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: filmes.length,
              itemBuilder: (context, index) {
                final filme = filmes[index];
                return Dismissible(
                  key: Key(filme.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) async {
                    final filmeRemovido = filme; // Armazena o item removido
                    final indexRemovido = index; // Armazena o índice do item

                    // Remove o filme da lista e da base de dados
                    await FilmeDao.deletar(filme.id);
                    setState(() {
                      filmes.removeAt(index);
                    });

                    // Exibe o SnackBar com a opção de desfazer
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${filme.titulo} deletado!'),
                        action: SnackBarAction(
                          label: 'Desfazer',
                          onPressed: () {
                            // Restaura o filme removido
                            setState(() {
                              filmes.insert(indexRemovido, filmeRemovido);
                            });
                            // Reinsere o filme na base de dados
                            FilmeDao.inserir(filmeRemovido);
                          },
                        ),
                        duration: Duration(seconds: 5), // Tempo para desfazer
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16), // Margem
                    decoration: BoxDecoration(
                      color: Colors.white, // Cor de fundo
                      borderRadius:
                          BorderRadius.circular(12), // Borda arredondada
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // Sombra leve
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(12), // Borda da imagem
                          child: Image.network(
                            filme.urlImagem,
                            width: 100,
                            height: 145, // Ocupar a altura vertical do item
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.broken_image, size: 100),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  filme.titulo,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 19, 16, 71),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  '${filme.genero}',
                                  style: TextStyle(
                                    color: Color.fromARGB(
                                        255, 44, 41, 102), // Cor para o gênero
                                  ),
                                ), // Exibe o gênero
                                Text(
                                  '${filme.duracao}min',
                                  style: TextStyle(
                                    color: Color.fromARGB(
                                        255, 44, 41, 102), // Cor para a duração
                                  ),
                                ), // Exibe a duração

                                Row(
                                  children: [
                                    filme.faixaEtaria == 'Livre'
                                        ? Image.network(
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/DJCTQ_-_L.svg/1024px-DJCTQ_-_L.svg.png',
                                            width: 24,
                                            height: 24,
                                          ) // Ícone para "Livre"
                                        : filme.faixaEtaria == '10'
                                            ? Image.network(
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/DJCTQ_-_10.svg/1200px-DJCTQ_-_10.svg.png',
                                                width: 24,
                                                height: 24,
                                              ) // Ícone para "10"
                                            : filme.faixaEtaria == '12'
                                                ? Image.network(
                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/DJCTQ_-_12.svg/240px-DJCTQ_-_12.svg.png',
                                                    width: 24,
                                                    height: 24,
                                                  ) // Ícone para "12"
                                                : filme.faixaEtaria == '14'
                                                    ? Image.network(
                                                        'https://logodownload.org/wp-content/uploads/2017/07/classificacao-14-anos-logo.png',
                                                        width: 24,
                                                        height: 24,
                                                      ) // Ícone para "14"
                                                    : filme.faixaEtaria == '16'
                                                        ? Image.network(
                                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/DJCTQ_-_16.svg/768px-DJCTQ_-_16.svg.png',
                                                            width: 24,
                                                            height: 24,
                                                          ) // Ícone para "16"
                                                        : Image.network(
                                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzuCJ86HARUgSIxx06gqSnATgoajvKH9fmLw&s',
                                                            width: 24,
                                                            height: 24,
                                                          ), // Ícone para "18"
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 32, 0, 0)),
                                    SizedBox(width: 8),
                                  ],
                                ),

                                SizedBox(height: 10),
                                RatingBarIndicator(
                                  rating: filme.pontuacao.toDouble(),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.more_vert,
                            color: Color.fromARGB(255, 19, 16, 71),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Wrap(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.info),
                                    title: Text('Exibir Dados'),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ExibirDadosFilme(filme: filme),
                                        ),
                                      );
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.edit),
                                    title: Text('Alterar'),
                                    onTap: () async {
                                      final filmeEditado = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditarFilme(filme: filme),
                                        ),
                                      );
                                      if (filmeEditado != null) {
                                        carregarFilmes();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      // Botão para ir para tela de adicionar um novo filme
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Chama a tela de cadastro de filme
          final filmeAdicionado = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastrarFilme(),
            ),
          );

          // Se o filme foi adicionado (se a resposta for 'true'), recarregue os filmes
          if (filmeAdicionado == true) {
            carregarFilmes(); // Recarrega a lista após adicionar o filme
          }
        },
        backgroundColor: const Color(0xFF131047),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
