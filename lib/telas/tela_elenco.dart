import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../modelos/ator.dart';
import '../servicos/servico_json.dart';

class TelaElenco extends StatelessWidget {
  TelaElenco({super.key});

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
      appBar: AppBar(title: const Text('Elenco')),
      body: FutureBuilder<List<Ator>>(
        future: servico.carregarElenco(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar elenco.'));
          }

          final elenco = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: elenco.length,
            itemBuilder: (context, index) {
              final ator = elenco[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 15),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(ator.imagem),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ator.nome,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('Personagem: ${ator.personagem}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(ator.descricao, textAlign: TextAlign.justify),
                      if (ator.possuiSiteOficial())
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            onPressed: () => abrirSite(ator.siteOficial!),
                            icon: const Icon(Icons.language),
                            label: const Text('Site oficial'),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
