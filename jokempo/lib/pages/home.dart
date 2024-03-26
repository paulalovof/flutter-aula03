import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _imgApp = Image.asset('assets/images/padrao.png');
  String _mensagem = "Escolha do App";
  int numVitorias = 0;
  int numDerrotas = 0;
  int numEmpates = 0;

  void _joga(String opcaoJogador) {
    final lista_opcoes = ['pedra', 'papel', 'tesoura'];
    final opcaoApp = lista_opcoes[Random().nextInt(3)];

    setState(() {
      _imgApp = Image.asset('assets/images/$opcaoApp.png');
      _mensagem = _resultado(opcaoJogador, opcaoApp);
    });
  }

  String _resultado(String opcaoJogador, String opcaoApp) {
    final mensagem;
    if (opcaoJogador == 'papel' && opcaoApp == 'pedra' ||
        opcaoJogador == 'pedra' && opcaoApp == 'tesoura' ||
        opcaoJogador == 'tesoura' && opcaoApp == 'papel') {
      numVitorias++;
      mensagem = "Você ganhou!";
    } else if (opcaoJogador == opcaoApp) {
      numEmpates++;
      mensagem = "Empate!";
    } else {
      numDerrotas++;
      mensagem = "Voce perdeu!";
    }
    return mensagem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Jokempo TADS22",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        textHome("Escolha do App"),
        SizedBox(height: 20),
        _imgApp,
        SizedBox(height: 20),
        textHome(_mensagem),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            choicePlayerDetector('pedra'),
            choicePlayerDetector('papel'),
            choicePlayerDetector('tesoura'),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            placar('Vitorias', numVitorias.toString()),
            placar('Empate', numEmpates.toString()),
            placar('Derrotas', numDerrotas.toString())
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numVitorias = 0;
            numEmpates = 0;
            numDerrotas = 0;
          });
        },
        child: const Icon(Icons.settings_backup_restore_sharp),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget placar(String texto, String numero) {
    return SizedBox(
      height: 90,
      width: 90,
      child: ClipOval(
        child: ColoredBox(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                texto,
                style:
                    TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                numero,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector choicePlayerDetector(String playerOp) {
    return GestureDetector(
      onTap: () => _joga(playerOp),
      child: Image.asset(
        'assets/images/$playerOp.png',
        height: 100,
      ),
    );
  }

  Text textHome(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }
}
