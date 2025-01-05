import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              alignment: Alignment.center,
              child: const ListTile(
                  title: Column(children: [
                Text(
                  "Quem Somos",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Olá! Somos a Explore Mundo, uma empresa nascida do profundo amor pela vida e pela magia das experiências compartilhadas. Acreditamos no poder transformador das viagens, pois para nós, viajar não é apenas um ato, é uma oportunidade de mergulhar em novos horizontes, desvendar culturas e encontrar significado nas pequenas coisas. Muito mais do que uma simples agência de viagem, nosso propósito vai além de guiar grupos por belas paisagens do Brasil e do mundo. Buscamos oferecer experiências transformadoras que vão além do turismo convencional. Cada viagem é planejada com cuidado e carinho para proporcionar um profundo entendimento dos destinos, incentivando novos aprendizados e expandindo a consciência sobre o verdadeiro significado de viajar.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ])),
            ),
          ),
        ],
      ),
    );
  }
}
