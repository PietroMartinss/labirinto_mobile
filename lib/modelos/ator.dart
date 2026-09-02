class Ator {
  final String nome;
  final String personagem;
  final String imagem;
  final String descricao;
  final String? siteOficial;

  Ator({
    required this.nome,
    required this.personagem,
    required this.imagem,
    required this.descricao,
    this.siteOficial,
  });

  factory Ator.fromJson(Map<String, dynamic> json) {
    return Ator(
      nome: json['nome'],
      personagem: json['personagem'],
      imagem: json['imagem'],
      descricao: json['descricao'],
      siteOficial: json['siteOficial'],
    );
  }

  bool possuiSiteOficial() {
    return siteOficial != null && siteOficial!.isNotEmpty;
  }
}
