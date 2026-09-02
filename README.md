# Labirinto - A Magia do Tempo

## Nomes dos alunos

- ALUNO 1
- ALUNO 2

## Identificação do tema do aplicativo

Aplicativo Flutter orientado a objetos sobre o filme **Labirinto - A Magia do Tempo (Labyrinth)**, de 1986.

O aplicativo apresenta enredo, dados técnicos, elenco, curiosidades e links oficiais. Os conteúdos são carregados de arquivos JSON e transformados em objetos Dart antes de serem exibidos pelos Widgets.

## Sumário da Wiki

1. Dados do filme
2. Protótipo
3. Descrição dos elementos
4. Estrutura dos arquivos JSON
5. Estrutura das classes
6. Navegação e links externos

## Wiki do projeto

### Dados do filme

- Título: Labirinto - A Magia do Tempo
- Título original: Labyrinth
- Ano: 1986
- Direção: Jim Henson
- Duração: 101 minutos
- Gênero: Fantasia e aventura

### Protótipo

O aplicativo possui três telas principais:

1. Tela Inicial
2. Tela Informações
3. Tela Elenco

### Descrição dos elementos

#### Tela Inicial

**Finalidade:** apresentar o filme e permitir acesso às demais telas.

| Elemento | Widget | Classe/atributo ou método |
|---|---|---|
| Pôster | Image | `Filme.imagem` |
| Título | Text | `Filme.titulo` |
| Título original | Text | `Filme.tituloOriginal` |
| Ano | Text | `Filme.ano` |
| Informações | ElevatedButton | `Navigator.push()` |
| Elenco | ElevatedButton | `Navigator.push()` |

#### Tela Informações

**Finalidade:** apresentar dados técnicos, enredo, curiosidades e link oficial.

| Elemento | Widget | Classe/atributo ou método |
|---|---|---|
| Título | Text | `Filme.titulo` |
| Ano | Text | `Filme.ano` |
| Duração | Text | `Filme.duracao` |
| Diretor | Text | `Filme.diretor` |
| Gênero | Text | `Filme.genero` |
| Enredo | Text | `Filme.sinopse` |
| Curiosidades | Text | `Filme.curiosidades` |
| Site oficial | ElevatedButton.icon | `Filme.siteOficial` / `abrirSite()` |

#### Tela Elenco

**Finalidade:** apresentar atores, personagens e sites oficiais disponíveis.

| Elemento | Widget | Classe/atributo ou método |
|---|---|---|
| Lista | ListView.builder | `List<Ator>` |
| Foto | CircleAvatar | `Ator.imagem` |
| Nome | Text | `Ator.nome` |
| Personagem | Text | `Ator.personagem` |
| Descrição | Text | `Ator.descricao` |
| Site oficial | TextButton.icon | `Ator.siteOficial` / `abrirSite()` |

### Estrutura dos arquivos JSON

`assets/data/filme.json` contém um objeto com os dados gerais do filme.

`assets/data/elenco.json` contém uma lista de objetos com os dados dos atores.

Fluxo:

**JSON → ServicoJson → objetos Filme/Ator → telas → Widgets**

### Estrutura das classes

#### Filme

Atributos:
- titulo
- tituloOriginal
- ano
- duracao
- diretor
- genero
- sinopse
- curiosidades
- imagem
- siteOficial

Método:
- `Filme.fromJson()`

#### Ator

Atributos:
- nome
- personagem
- imagem
- descricao
- siteOficial

Métodos:
- `Ator.fromJson()`
- `possuiSiteOficial()`

### Links externos

Os endereços são armazenados nos JSON e abertos pelo aplicativo usando o pacote `url_launcher`.

## Como executar

1. Tenha o Flutter instalado.
2. Abra esta pasta no VS Code ou Android Studio.
3. Execute `flutter pub get`.
4. Execute `flutter run`.

## Observação

Substitua os nomes dos alunos antes da entrega. O `poster.png` incluído é apenas uma imagem provisória para o projeto executar; substitua-o por uma imagem do pôster que vocês tenham direito de utilizar.
