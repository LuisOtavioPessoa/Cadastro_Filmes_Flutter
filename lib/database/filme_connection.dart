import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FilmeConnection {
  static Future<Database> getConnection() async {
    //data/data/pacote/databases
    String path = await getDatabasesPath();
    //data/data/pacote/databases/contatosdb.db
    String dbPath = join(path, 'filmesdb.db');
    return await openDatabase(dbPath, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE filmes(id INTEGER PRIMARY KEY AUTOINCREMENT, urlImagem TEXT, titulo TEXT, genero TEXT, faixaEtaria TEXT, duracao INTEGER, pontuacao INTEGER, descricao TEXT, ano INTEGER)');
    }, version: 1);
  }
}
