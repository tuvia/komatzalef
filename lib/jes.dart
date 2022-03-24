import 'package:flutter/material.dart';
import 'globals.dart';



class WidgetJes extends StatelessWidget {
  const WidgetJes({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {

    List<Word> words = [];
    List<Letter> letters = [];
    letters.add(Letter(letter: "חַ", file: "a0108.mp3", color: Colors.red));
    letters.add(Letter(letter: "לָּ"));
    letters.add(Letter(letter: "ה"));

    words.add(Word(word: letters, file: "jalo.mp3"));

    letters = [];
    letters.add(Letter(letter: "חַ", file: "a0108.mp3", color: Colors.red));
    letters.add(Letter(letter: "יָּ"));
    letters.add(Letter(letter: "ה"));

    words.add(Word(word: letters, file: "jaio.mp3"));

    letters = [];
    letters.add(Letter(letter: "וַ"));
    letters.add(Letter(letter: "תִּ"));
    letters.add(Letter(letter: "תְ"));
    letters.add(Letter(letter: "חַ", file: "a0108.mp3", color: Colors.red));
    letters.add(Letter(letter: "לְ"));
    letters.add(Letter(letter: "חַ", file: "a0108.mp3", color: Colors.red));
    letters.add(Letter(letter: "ל"));

    words.add(Word(word: letters, file: "vatisjaljal.mp3"));

    letters = [];
    letters.add(Letter(letter: "מִ"));
    letters.add(Letter(letter: "זְ"));
    letters.add(Letter(letter: "בֵּ"));
    letters
        .add(Letter(letter: "חַ", file: "aj.mp3", color: Colors.blue));

    words.add(Word(word: letters, file: "mizbeaj.mp3"));

    letters = [];
    letters.add(Letter(letter: "נִ"));
    letters.add(Letter(letter: "ח"));
    letters.add(Letter(letter: "וֹ"));
    letters
        .add(Letter(letter: "חַ", file: "aj.mp3", color: Colors.blue));

    words.add(Word(word: letters, file: "nijoaj.mp3"));

    String spanish = "Cuando la letra JES aparece con un PATOJ al comienzo o en medio de la palabra, suenan JA. Pero cuando aparecen al final de una palabra, suena AJ.";
    String english = "When the letter CHES appears with a PATOCH at the beginning or in the middle of a word, they sound CHA. But when appear at the end of a word, they sound ACH.";

    return buildWordsScreen(title, words, spanish: spanish, english: english);
  }
}