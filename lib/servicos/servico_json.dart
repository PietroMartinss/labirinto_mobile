import 'dart:convert';
import 'package:flutter/services.dart';
import '../modelos/filme.dart';
import '../modelos/ator.dart';

class ServicoJson {
  Future<Filme> carregarFilme() async {
    final arquivo = await rootBundle.loadString('assets/data/filme.json');
    final dados = jsonDecode(arquivo);
    return Filme.fromJson(dados);
  }

  Future<List<Ator>> carregarElenco() async {
    final arquivo = await rootBundle.loadString('assets/data/elenco.json');
    final List<dynamic> dados = jsonDecode(arquivo);
    return dados.map((item) => Ator.fromJson(item)).toList();
  }
}
