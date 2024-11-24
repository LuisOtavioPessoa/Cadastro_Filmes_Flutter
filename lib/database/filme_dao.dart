import 'package:myapp/database/filme_connection.dart';
import '../model/filme.dart';
import 'package:sqflite/sqflite.dart';

class FilmeDao {
  static Future<int?> inserir(Filme filme) async {
    try {
      Database db = await FilmeConnection.getConnection();
      //INSERT INTO filmes(urlImagem,titulo,genero,faixaEtaria etc..) VALUES (?,?,?)
      return await db.insert('filmes', filme.toMap());
    } catch (ex) {
      print(ex);
      return null;
    }
  }

static Future<List<Filme>> buscarTodos() async {
  try {
    Database db = await FilmeConnection.getConnection();
    // Executa a consulta no banco de dados
    List<Map<String, Object?>> ListMap = await db.query('filmes');

    // Verificação: imprime os filmes encontrados no console
    print('Filmes encontrados: $ListMap');

    // Converte os dados do banco de dados em uma lista de objetos Filme
    List<Filme> filmes = [];
    for (Map<String, Object?> map in ListMap) {
      filmes.add(Filme.fromMap(map));
    }

    return filmes;
  } catch (ex) {
    // Em caso de erro, imprime a exceção no console
    print('Erro ao buscar filmes: $ex');
    return [];
  }
}

static Future<int?> atualizar(int id, Filme filme) async {
  try {
    // Obter a conexão com o banco de dados
    Database db = await FilmeConnection.getConnection();

    // Atualizar o filme no banco de dados
    return await db.update(
      'filmes',                           // Tabela 'filmes'
      filme.toMap(),                       // Convertendo o objeto Filme para um mapa de chave/valor
      where: "id = ?",                     // Condição para identificar o filme a ser atualizado
      whereArgs: [id],                     // Passando o 'id' do filme que será atualizado
    );
  } catch (ex) {
    // Se ocorrer algum erro, imprime e retorna null
    print(ex);
    return null;
  }
}

  static Future<int?> deletar(int id) async {
    try {
      Database db = await FilmeConnection.getConnection();
      //DELETE FROM filmes WHERE id = ?
      return await db.delete('filmes', where: "id=?", whereArgs: [id]);
    } catch (ex) {
      print(ex);
      return null;
    }
  }
}
