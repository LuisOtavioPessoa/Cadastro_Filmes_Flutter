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
        backgroundColor: const Color.fromARGB(255, 0, 133, 235),
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
                    await FilmeDao.deletar(filme.id);
                    setState(() {
                      filmes.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${filme.titulo} deletado!')),
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
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(8), // Borda na imagem
                        child: Image.network(
                          filme.urlImagem,
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.broken_image),
                        ),
                      ),
                      title: Text(
                        filme.titulo,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${filme.genero}'), // Exibe o gênero
                          Text('${filme.duracao}min'), // Exibe a duração
                          SizedBox(
                              height: 30), // Espaçamento acima do RatingBar
                          RatingBarIndicator(
                            rating: filme.pontuacao.toDouble(),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20,
                          ),
                          SizedBox(height: 5), // Espaçamento entre elementos
                        ],
                      ),
                                            onTap: () {
                        // Exibe um BottomSheet com opções
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Wrap(
                            children: [
                              ListTile(
                                leading: Icon(Icons.info),
                                title: Text('Exibir Dados'),
                                onTap: () {
                                  // Navega para a tela de exibição de dados do filme
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExibirDadosFilme(
                                        filme: filme, // Passa o filme selecionado
                                      ),
                                    ),
                                  );
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Alterar'),
                                onTap: () async {
                                  // Navega para a tela de edição do filme
                                  final filmeEditado = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditarFilme(filme: filme),
                                    ),
                                  );
                                  
                                  // Se o filme foi editado, recarrega a lista
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
        backgroundColor: const Color.fromARGB(255, 0, 133, 235),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
