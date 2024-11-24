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
      Database db = await FilmeConnection.getConnection();
      //UPDATE filmes SET urlImagem = ?, titulo = ?, genero = ?,
      return await db
          .update('filmes', filme.toMap(), where: "id=?", whereArgs: [id]);
    } catch (ex) {
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
