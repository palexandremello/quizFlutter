import 'package:flutter/material.dart';
import './questionario.dart';
import 'resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {
          'texto': 'Preto',
          'pontuacao': 10,
        },
        {
          'texto': 'Vermelho',
          'pontuacao': 10,
        },
        {
          'texto': 'Verde',
          'pontuacao': 10,
        },
        {
          'texto': 'Branco',
          'pontuacao': 10,
        }
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {
          'texto': 'Coelho',
          'pontuacao': 10,
        },
        {
          'pontuacao': 10,
          'texto': 'Cobra',
        },
        {
          'pontuacao': 10,
          'texto': 'Elefante',
        },
        {
          'pontuacao': 10,
          'texto': 'Leão',
        }
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {
          'texto': 'Maria',
          'pontuacao': 5,
        },
        {
          'texto': 'João',
          'pontuacao': 5,
        },
        {
          'texto': 'Leo',
          'pontuacao': 5,
        },
        {
          'texto': 'Pedro',
          'pontuacao': 2,
        },
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
