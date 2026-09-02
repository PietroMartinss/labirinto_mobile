import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../modelos/filme.dart';
import '../servicos/servico_json.dart';

class TelaInformacoes extends StatelessWidget {
  TelaInformacoes({super.key});

  final ServicoJson servico = ServicoJson();

  Future<void> abrirSite(String endereco) async {
    final url = Uri.parse(endereco);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informações')),
      body: FutureBuilder<Filme>(
        future: servico.carregarFilme(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar informações.'));
          }

          final filme = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(filme.titulo,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const Text('Dados técnicos',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Ano: ${filme.ano}'),
                Text('Duração: ${filme.duracao} minutos'),
                Text('Diretor: ${filme.diretor}'),
                Text('Gênero: ${filme.genero}'),
                const SizedBox(height: 25),
                const Text('Enredo',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(filme.sinopse, textAlign: TextAlign.justify),
                const SizedBox(height: 25),
                const Text('Curiosidades',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ...filme.curiosidades.map(
                  (curiosidade) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('• $curiosidade'),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => abrirSite(filme.siteOficial),
                    icon: const Icon(Icons.language),
                    label: const Text('Site oficial do filme'),
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
