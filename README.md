# Gerenciador de Filmes 🎬
O Gerenciador de Filmes é um aplicativo desenvolvido em Flutter para listar, adicionar, editar e excluir filmes. Ele utiliza o banco de dados local para armazenar informações sobre os filmes e oferece uma interface amigável para gerenciar as informações.

O objetivo principal é criar uma aplicação robusta e intuitiva, com funcionalidades como listagem de filmes com classificação etária, edição de dados e uma interface com design responsivo e interativo.

## Tecnologias Utilizadas 🚀

- **Flutter:** Framework para desenvolvimento multiplataforma.
- **Dart:** Linguagem de programação para construção de interfaces dinâmicas.
- **SQLite:** Banco de dados leve para persistência local.
- **Pacotes adicionais:**
  - sqflite: Para integração com SQLite.
  - smooth_star_rating_null_safety: Para o sistema de classificação com estrelas.
  - flutter_rating_bar: Para exibição de avaliações.

## Funcionalidades 🌟 

✔️ **Listagem de Filmes**  
✔️ **Adicionar Novo Filme**  
✔️ **Edição de Filme**  
✔️ **Exclusão com Desfazer**  
✔️ **Exibição de Detalhes do Filme**  
✔️ **Classificação por estrelas**  

## Objetivo 🎯
Este projeto tem como objetivo aplicar conceitos de desenvolvimento de aplicativos móveis em Flutter, integrando persistência de dados com SQLite e práticas de design centradas no usuário.

## Configuração do Projeto (Instalação) ⚙️
Para rodar o projeto, siga as etapas abaixo:

1- **Clone este repositório** 
```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
```
2- **Acesse a pasta do projeto:** 
```bash
cd gerenciador-de-filmes
```
3- **Instale as dependências** 
```bash
flutter pub get
```
4- **Execute o aplicativo** 
```bash
flutter run
```

## Requisitos 🛠️ 

- 🔹 **Flutter**: Versão 3.0 ou superior. [Site Oficial Flutter](https://flutter.dev/)
- 🔹 **Dart**: Versão 2.17 ou superior. [Site Oficial Dart](https://dart.dev/)
- 🔹 **SQLite**: Suporte integrado no Flutter com o pacote sqflite.
- 🔹 **Dispositivo ou emulador configurado**: Para testes e execução do aplicativo.

## Estrutura 🗂️
```bash
├── database/                   # Configuração e interações com o banco de dados SQLite
│   ├── filme_connection.dart   # Configuração da conexão com o banco e criação de tabelas
│   └── filme_dao.dart          # Implementação das operações CRUD para os filmes
├── model/                      # Definição das classes e modelos de dados
│   └── filme.dart              # Modelo representando um filme
├── screens/                    # Telas do aplicativo
│   ├── adicionar_filme.dart    # Tela para cadastrar novos filmes
│   ├── editar_filme.dart       # Tela para editar informações de um filme existente
│   ├── exibir_dados_filme.dart # Tela para exibir os detalhes de um filme
│   └── lista_filmes.dart       # Tela principal com a lista de filmes cadastrados
├── main.dart                   # Ponto de entrada do aplicativo
├── pubspec.yaml                # Arquivo de configuração do Flutter (dependências e assets)
├── pubspec.lock                # Lockfile do Flutter para as dependências
└── README.md                   # Documentação do projeto
```
## Contribuidores 👥

- [Luís Otávio Pessôa da Silva](https://github.com/LuisOtavioPessoa)
- [Ruã Fernandes Araújo](https://github.com/ruafernd)
- [Fred Williams Silva Barbosa de Oliveira Junior](https://github.com/fredderyko)
  
  



