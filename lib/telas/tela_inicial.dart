import 'package:flutter/material.dart';
import '../modelos/filme.dart';
import '../servicos/servico_json.dart';
import 'tela_informacoes.dart';
import 'tela_elenco.dart';

class TelaInicial extends StatelessWidget {
  TelaInicial({super.key});

  final ServicoJson servico = ServicoJson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labirinto'),
        centerTitle: true,
      ),
      body: FutureBuilder<Filme>(
        future: servico.carregarFilme(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar o filme.'));
          }

          final filme = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(filme.imagem, height: 350),
                const SizedBox(height: 20),
                Text(
                  filme.titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(filme.tituloOriginal, style: const TextStyle(fontSize: 18)),
                Text(filme.ano.toString()),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => TelaInformacoes()),
                      );
                    },
                    child: const Text('Informações do filme'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => TelaElenco()),
                      );
                    },
                    child: const Text('Elenco'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
