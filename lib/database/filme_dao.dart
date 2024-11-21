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
      //SELECT * FROM filmes
      List<Map<String, Object?>> ListMap = await db.query('filmes');
      List<Filme> filmes = [];
      for (Map<String, Object?> map in ListMap) {
        filmes.add(Filme.fromMap(map));
      }
      return filmes;
    } catch (ex) {
      print(ex);
      return [];
    }
  }
}
