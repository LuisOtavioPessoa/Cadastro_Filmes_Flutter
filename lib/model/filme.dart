class Filme {
  int id;
  String urlImagem;
  String titulo;
  String genero;
  String faixaEtaria;
  int duracao;
  int pontuacao;
  String descricao;
  int ano;

  Filme(this.urlImagem, this.titulo, this.genero, this.faixaEtaria,
      this.duracao, this.pontuacao, this.descricao, this.ano,
      {this.id = 0});

  Map<String, Object?> toMap() {
    return {
      'urlImagem': urlImagem,
      'titulo': titulo,
      'genero': genero,
      'faixaEtaria': faixaEtaria,
      'duracao': duracao,
      'pontuacao': pontuacao,
      'descricao': descricao,
      'ano': ano
    };
  }

  factory Filme.fromMap(Map<String, Object?> map) {
    return Filme(
      map['urlImagem'] as String,
      map['titulo'] as String,
      map['genero'] as String,
      map['faixaEtaria'] as String,
      map['duracao'] as int,
      map['pontuacao'] as int,
      map['descricao'] as String,
      map['ano'] as int,
      id: map['id'] as int,
    );
  }

  @override
  String toString() {
    return 'urlImagem: $urlImagem, titulo: $titulo, genero: $genero, faixaEtaria: $faixaEtaria, duracao: $duracao, pontuacao: $pontuacao, descricao: $descricao, ano: $ano';
  }
}
