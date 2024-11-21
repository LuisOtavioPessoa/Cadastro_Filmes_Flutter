import 'package:flutter/widgets.dart';

main() {
  runApp(MainApp());

  //FilmeDao.inserir(Filme(Informações de um filme))
  //  .then((value){
  // print(value);
  // });

  //FilmeDao.buscarTodos().then((value){
  //print(value);
  //});
}

Future<dynamic> teste() async {
  await Future.delayed(Duration(seconds: 5));
  print("Fim do delayed");
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
