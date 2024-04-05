import 'package:flutter/material.dart';
import 'pagendquiz.dart';

class Domanda {
  final int id;
  final String titolo;
  final List<String> risposte;
  final String rispostaCorretta;

  Domanda({
    required this.id,
    required this.titolo,
    required this.risposte,
    required this.rispostaCorretta,
  });

  List<String> get risposteMischiate {
    final lista = List.of(risposte);
    lista.shuffle();
    return lista;
  }
}

List<Domanda> domande = [
  Domanda(
    id: 0,
    titolo: "Qual è la capitale del Giappone?",
    risposte: ["Tokyo", "Osaka", "Kyoto", "Hiroshima"],
    rispostaCorretta: 'Tokyo',
  ),
  Domanda(
    id: 1,
    titolo: "Chi è l'autore del romanzo 'Orgoglio e Pregiudizio'?",
    risposte: ["Jane Austen", "Emily Brontë", "Charles Dickens", "Mark Twain"],
    rispostaCorretta: 'Jane Austen',
  ),
  Domanda(
    id: 2,
    titolo: "Quale è l'elemento chimico con simbolo 'H'?",
    risposte: ["Idrogeno", "Ossigeno", "Carbonio", "Azoto"],
    rispostaCorretta: 'Idrogeno',
  ),
  Domanda(
    id: 3,
    titolo: "Qual è il periodo di rivoluzione della Terra intorno al Sole?",
    risposte: ["Circa 365 giorni", "24 ore", "30 giorni", "6 mesi"],
    rispostaCorretta: 'Circa 365 giorni',
  ),
  Domanda(
    id: 4,
    titolo: "Chi ha dipinto la 'Mona Lisa'?",
    risposte: ["Leonardo da Vinci", "Pablo Picasso", "Vincent van Gogh", "Michelangelo"],
    rispostaCorretta: 'Leonardo da Vinci',
  ),
];


class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  List<String> selectedAnswers = [];

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
      if (currentQuestionIndex < domande.length - 1) {
        currentQuestionIndex++;
      } else {
        for (int i = 0; i < domande.length; i++) {
          if (selectedAnswers[i] == domande[i].rispostaCorretta) {
            correctAnswers++;
          }
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PagEndQuiz(
            correctAnswers: correctAnswers,
            totalQuestions: domande.length,
          )),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              domande[currentQuestionIndex].titolo,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ...domande[currentQuestionIndex].risposteMischiate.map((risposta) {
              return ElevatedButton(
                onPressed: () {
                  selectAnswer(risposta);
                },
                child: Text(risposta),
              );
            }),
          ],
        ),
      ),
    );
  }
}