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
}
