class Filme {
  final String titulo;
  final String tituloOriginal;
  final int ano;
  final int duracao;
  final String diretor;
  final String genero;
  final String sinopse;
  final List<String> curiosidades;
  final String imagem;
  final String siteOficial;

  Filme({
    required this.titulo,
    required this.tituloOriginal,
    required this.ano,
    required this.duracao,
    required this.diretor,
    required this.genero,
    required this.sinopse,
    required this.curiosidades,
    required this.imagem,
    required this.siteOficial,
  });

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
      titulo: json['titulo'],
      tituloOriginal: json['tituloOriginal'],
      ano: json['ano'],
      duracao: json['duracao'],
      diretor: json['diretor'],
      genero: json['genero'],
      sinopse: json['sinopse'],
      curiosidades: List<String>.from(json['curiosidades']),
      imagem: json['imagem'],
      siteOficial: json['siteOficial'],
    );
  }
}
