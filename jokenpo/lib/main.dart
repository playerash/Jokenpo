import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  opcaoSelecionada(String escolhaDoJogador) {
    var opcoesApp = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    String escolhaApp = opcoesApp[numero];
    setState(() {
      if (escolhaApp == 'pedra') {
        if (escolhaDoJogador == 'pedra') {
          texto = 'Empate';
        } else if (escolhaDoJogador == 'papel') {
          texto = 'Vitória';
        } else {
          texto = 'Derrota';
        }
        imagemApp = AssetImage('imagens/pedra.png');
      } else if (escolhaApp == 'papel') {
        if (escolhaDoJogador == 'pedra') {
          texto = 'Derrota';
        } else if (escolhaDoJogador == 'papel') {
          texto = 'Empate';
        } else {
          texto = 'Vitória';
        }
        imagemApp = AssetImage('imagens/papel.png');
      } else {
        if (escolhaDoJogador == 'papel') {
          texto = 'Derrota';
        } else if (escolhaDoJogador == 'pedra') {
          texto = 'Vitória';
        } else {
          texto = 'Empate';
        }
        imagemApp = AssetImage('imagens/tesoura.png');
      }
      escolhaJogador = escolhaDoJogador;
    });
  }

  var escolhaJogador = '';
  var texto = 'Sua escolha:';
  var imagemApp = AssetImage('imagens/padrao.png');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jo-Ken-Pô'),
          backgroundColor: Colors.indigo,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Text(
                'Escolha do App: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image(
                  image: this.imagemApp,
                ),
              ),
              Text(
                texto,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => opcaoSelecionada('pedra'),
                      child: Container(
                        decoration: escolhaJogador == 'pedra'
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.blueAccent,
                                        spreadRadius: 3)
                                  ])
                            : null,
                        child: Image.asset(
                          'imagens/pedra.png',
                          height: 100,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => opcaoSelecionada('papel'),
                      child: Container(
                        decoration: escolhaJogador == 'papel'
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.blueAccent,
                                        spreadRadius: 3)
                                  ])
                            : null,
                        child: Image.asset(
                          'imagens/papel.png',
                          height: 100,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => opcaoSelecionada('tesoura'),
                      child: Container(
                        decoration: escolhaJogador == 'tesoura'
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.blueAccent,
                                        spreadRadius: 3)
                                  ])
                            : null,
                        child: Image.asset(
                          'imagens/tesoura.png',
                          height: 100,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
