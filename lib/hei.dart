import 'package:flutter/material.dart';
import 'globals.dart';



class WidgetHei extends StatelessWidget {
  const WidgetHei({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {


    List<Word> words = [];
    List<Letter> letters = [];
    letters.add(Letter(letter: "אִ"));
    letters.add(Letter(letter: "שָׁ"));
    letters.add(Letter(letter: "הּ", file: "", color: Colors.red));

    words.add(Word(word: letters, file: "ishah.mp3"));

    letters = [];
    letters.add(Letter(letter: "אֹ"));
    letters.add(Letter(letter: "תָ"));
    letters.add(Letter(letter: "הּ", file: "", color: Colors.red));

    words.add(Word(word: letters, file: "osah.mp3"));

    letters = [];
    letters.add(Letter(letter: "אַ"));
    letters.add(Letter(letter: "זְ"));
    letters.add(Letter(letter: "כָּ"));
    letters.add(Letter(letter: "רָ"));
    letters.add(Letter(letter: "תָ"));
    letters.add(Letter(letter: "הּ", file: "", color: Colors.red));

    words.add(Word(word: letters, file: "azcarasah.mp3"));


    String spanish = "Cuando la letra HEI está al final de una palabra y tiene un DOGUESH adentro, tiene un sonido especial, como aire saliendo de la garganta.";
    String english = "When the letter HEI is at the end of a word and has a DOGESH inside, ha s aspecial sound, like air coming out of the throat.";

    return buildWordsScreen(title, words, spanish: spanish, english: english);
  }
}
