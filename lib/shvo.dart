import 'package:flutter/material.dart';
import 'globals.dart';


/*
 * Different SHVO rules
 */
const List<ScreenDefinition> shvoList = [
  ScreenDefinition(WidgetShvoRules(title:  "1", type: ShvoType.one), "1", Colors.red, Colors.amber),
  ScreenDefinition(WidgetShvoRules(title:  "2", type: ShvoType.two,), "2", Colors.blue, Colors.lime),
  ScreenDefinition(WidgetShvoRules(title:  "3", type: ShvoType.three,), "3", Colors.green, Colors.pink),
  ScreenDefinition(WidgetShvoRules(title:  "4", type: ShvoType.four,), "4", Colors.deepPurpleAccent, Colors.orange),
  ScreenDefinition(WidgetShvoRules(title:  "5", type: ShvoType.five,), "5", Colors.grey, Colors.cyan),
  ScreenDefinition(WidgetShvoRules(title:  "6", type: ShvoType.six,), "6", Colors.lightBlue, Colors.teal),
];




enum ShvoType {
  one,
  two,
  three,
  four,
  five,
  six
}





class WidgetShvo extends StatelessWidget {
  const WidgetShvo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globalColor,
        appBar: buildAppBar(title),
    body:
        Container(
            padding: const EdgeInsets.all(globalInset),
            child: buildScreenButtons(shvoList)),
    );
  }
}


/*
 * This widget shows the screen for each explanation of the rules
 */
class WidgetShvoRules extends StatelessWidget {
  const WidgetShvoRules({Key? key, required this.type, required this.title}) : super(key: key);

  final ShvoType type;
  final String title;


  @override
  Widget build(BuildContext context) {

    String spanish = "";
    String english = "";
    List<Word> words = [];
    List<Letter> letters = [];


    switch (type) {
      case ShvoType.one:

      /*
 * Este Widget produce la regla del SHVO que al comienzo de la palabra
 * Siempre es SHVO NO
 */
        words = [];
        letters = [];
        letters.add(Letter(letter: "מְ", file: "a0315.mp3", color: Colors.red));
        letters.add(Letter(letter: "סַ"));
        letters.add(Letter(letter: "פֵּ"));
        letters.add(Letter(letter: "ר"));

        words.add(Word(word: letters, file: "mesaper.mp3"));

        letters = [];
        letters.add(Letter(letter: "יְ", file: "a0310.mp3", color: Colors.red));
        letters.add(Letter(letter: "לָ"));
        letters.add(Letter(letter: "דִ"));
        letters.add(Letter(letter: "י"));
        letters.add(Letter(letter: "ם"));

        words.add(Word(word: letters, file: "ielodim.mp3"));

        spanish = "Esta regla del SHEVO indica que cuando aparece al comienzo de una palabra, siempre es un SHEVO NO, o sea, tiene un sonido.";
        english = "This rule of SHEVO indicates that when it appears at the beginning of a word, it is always a SHEVO NO, that means, it has a sound.";

        break;

      case ShvoType.two:

      /*
 * Este Widget enseña la regla del SHVO que al final de la palabra
 * siempre es es NAJ
 */

        words = [];

        letters = [];
        letters.add(Letter(letter: "מֶ"));
        letters.add(Letter(letter: "לֶ"));
        letters.add(Letter(letter: "ךְ", file: "soundCH.mp3", color: Colors.blue));

        words.add(Word(word: letters, file: "melej.mp3"));

        letters = [];
        letters.add(Letter(letter: "אַ"));
        letters.add(Letter(letter: "תְּ", file: "soundT.mp3", color: Colors.blue));

        words.add(Word(word: letters, file: "at.mp3"));

        letters = [];
        letters.add(Letter(letter: "בָּ"));
        letters.add(Letter(letter: "ר"));
        letters.add(Letter(letter: "וּ"));
        letters.add(Letter(letter: "ךְ", file: "soundCH.mp3", color: Colors.blue));

        words.add(Word(word: letters, file: "boruj.mp3"));

        letters = [];
        letters.add(Letter(letter: "וַ"));
        letters.add(Letter(letter: "יֵּ"));
        letters.add(Letter(letter: "שְׁ", file: "soundSH.mp3", color: Colors.blue));
        letters.add(Letter(letter: "תְּ", file: "soundT.mp3", color: Colors.blue));

        words.add(Word(word: letters, file: "vaiesht.mp3"));


        letters = [];
        letters.add(Letter(letter: "יַּ"));
        letters.add(Letter(letter: "פְ", file: "soundF.mp3", color: Colors.blue));
        letters.add(Letter(letter: "תְּ", file: "soundT.mp3", color: Colors.blue));

        words.add(Word(word: letters, file: "iaft.mp3"));

        spanish = "Esta regla del SHEVO indica que cuando aparece al final de una palabra, siempre es un SHEVO NAJ, o sea, no tiene sonido. El color azul representa el SHEVO NAJ. ";
        english = "This rule of SHEVO indicates that when it appears at the end of a word, it is always a SHEVO NACH, that means, it doesn't have a sound. Blue color represents SHEVO NACH.";

        break;

      case ShvoType.three:

      /*
 * This Widget explains the rule that two consecutive SHVOs
 * the first is NAJ and the second NO
 */
        letters = [];
        words = [];

        letters.add(Letter(letter: "נַ"));
        letters.add(Letter(letter: "פְ", file: "soundF.mp3", color: Colors.blue));
        letters.add(Letter(letter: "שְׁ", file: "a0328.mp3", color: Colors.red));
        letters.add(Letter(letter: "ךָ"));

        words.add(Word(word: letters, file: "nafshejo.mp3"));

        letters = [];
        letters.add(Letter(letter: "תִּ"));
        letters.add(Letter(letter: "שְׁ", file: "soundSH.mp3", color: Colors.blue));
        letters.add(Letter(letter: "מְ", file: "a0315.mp3", color: Colors.red));
        letters.add(Letter(letter: "ר"));
        letters.add(Letter(letter: "וּ"));

        words.add(Word(word: letters, file: "tishmeru.mp3"));

        letters = [];
        letters.add(Letter(letter: "בְּ", file: "a0301.mp3", color: Colors.red));
        letters.add(Letter(letter: "שִׁ"));
        letters.add(Letter(letter: "בְ", file: "soundV.mp3", color: Colors.blue));
        letters.add(Letter(letter: "תְּ", file: "a0330.mp3", color: Colors.red));
        letters.add(Letter(letter: "ךָ"));

        words.add(Word(word: letters, file: "beshivtejo.mp3"));

        spanish = "Esta regla del SHEVO indica que cuando aparecen en dos letras consecutivas, el primero siempre es un SHEVO NAJ y el segundo es un SHEVO NO. El color azul representa el SHEVO NAJ. El color rojo representa el SHEVO NO.";
        english = "This rule of SHEVO indicates that when they appears in two consecutive letters, the first is always a SHEVO NACH and the second is a SHEVO NO. Blue color represents SHEVO NACH. Red color represents SHEVO NO.";

        break;

      case ShvoType.four:


/*
 * This Widget explains the rule SHVO in a letter with DOGUESH is NO
 */
        words = [];
        letters = [];

        letters.add(Letter(letter: "הַ"));
        letters.add(Letter(letter: "דְּ", file: "a0304.mp3", color: Colors.red));
        letters.add(Letter(letter: "בָ"));
        letters.add(Letter(letter: "רִ"));
        letters.add(Letter(letter: "י"));
        letters.add(Letter(letter: "ם"));

        words.add(Word(word: letters, file: "hadevorim.mp3"));

        letters = [];
        letters.add(Letter(letter: "מְ"));
        letters.add(Letter(letter: "צַ"));
        letters.add(Letter(letter: "וְּ", file: "a0306.mp3", color: Colors.red));
        letters.add(Letter(letter: "ךָ"));

        words.add(Word(word: letters, file: "metzavejo.mp3"));

        letters = [];
        letters.add(Letter(letter: "דִ"));
        letters.add(Letter(letter: "בְּ", file: "a0301.mp3", color: Colors.red));
        letters.add(Letter(letter: "ר"));
        letters.add(Letter(letter: "וּ"));

        words.add(Word(word: letters, file: "diberu.mp3"));


        spanish = "El pequeño punto dentro de una letra se llama DOGUESH, que significa \"énfasis\". El DOGUESH le da fuerza a la pronunciación de la letra. Esta regla del SHEVO indica que cuando aparece bajo una letra que tiene un DOGUESH, siempre es un SHEVO NO.";
        english = "The little dot inside a letters is called DOGESH, which means \"emphasis\". The DOGESH gives strength to the pronunciation of the letter. This rule of SHEVO indicates that when it appears below a letter with a DOGESH, it is always a SHEVO NO.";

        break;

      case ShvoType.five:


/*
 * This Widget explains the rule that two SAME letters, first one has a SHVO
 * is always SHVO NO
 */
        words = [];

        letters = [];
        letters.add(Letter(letter: "הִ"));
        letters.add(Letter(letter: "נְ", file: "a0317.mp3", color: Colors.red));
        letters.add(Letter(letter: "נִ", file: "", color: Colors.red));
        letters.add(Letter(letter: "י"));

        words.add(Word(word: letters, file: "hineni.mp3"));

        letters = [];
        letters.add(Letter(letter: "וּ"));
        letters.add(Letter(letter: "לְ", file: "a0314.mp3", color: Colors.red));
        letters.add(Letter(letter: "לֵ", file: "", color: Colors.red));
        letters.add(Letter(letter: "וִ"));
        letters.add(Letter(letter: "י"));

        words.add(Word(word: letters, file: "ulelevi.mp3"));

        letters = [];
        letters.add(Letter(letter: "הַ"));
        letters.add(Letter(letter: "לְ", file: "a0314.mp3", color: Colors.red));
        letters.add(Letter(letter: "ל", file: "", color: Colors.red));
        letters.add(Letter(letter: "וּ"));

        words.add(Word(word: letters, file: "halelu.mp3"));

        letters = [];
        letters.add(Letter(letter: "צָ"));
        letters.add(Letter(letter: "לְ", file: "a0314.mp3", color: Colors.red));
        letters.add(Letter(letter: "ל", file: "", color: Colors.red));
        letters.add(Letter(letter: "וּ"));

        words.add(Word(word: letters, file: "tzolelu.mp3"));

        spanish = "Esta regla del SHEVO indica que cuando aparece bajo una letra seguida por otra letra igual, siempre es un SHEVO NO.";
        english = "This rule of SHEVO indicates that when it appears below a letter followed by another equal letter, it is always a SHEVO NO.";

        break;

      case ShvoType.six:

/*
 * This widget teaches the rule
 * SHVO after tnua gdoilo
 * SHVO mismo tiempo verbal en singular masculino
 *  1. Si hay SHVO en el mismo lugar => SHVO NAJ
 *  2. Si hay otra Nekuda en ese lugar => SHVO NO
 *
 דוגמות:
כָּתְבוּ – צורת היסוד: כָּתַב. בצורת היסוד יש תנועה (במקום השווא), ולכן זהו שווא נע.
יִתְחַשְּׁבוּ – צורת היסוד: יִתְחַשֵּׁב. יִתְחַשְּׁבוּ השווא הראשון מקורו באפס תנועה, לכן הוא שווא נח. השווא השני מקורו בתנועה, לכן הוא שווא נע.
לוֹמְדִים – צורת היסוד: לוֹמֵד. לוֹמְדִים שווא נע, כי בצורת היסוד יש תנועה.
 *
 */


        letters = [];
        letters.add(Letter(letter: "קָ"));
        letters.add(Letter(letter: "טֹ֜", file: "a0509.mp3", color: Colors.black));
        letters.add(Letter(letter: "נְ", file: "soundN.mp3", color: Colors.blue));
        letters.add(Letter(letter: "תִּ"));
        letters.add(Letter(letter: "י"));

        words.add(Word(word: letters, file: "kotonti.mp3"));

        letters = [];
        letters.add(Letter(letter: "יָ"));
        letters.add(Letter(letter: "כֹ֑", file: "a0512.mp3", color: Colors.black));
        letters.add(Letter(letter: "לְ", file: "soundL.mp3", color: Colors.blue));
        letters.add(Letter(letter: "תִּ"));
        letters.add(Letter(letter: "י"));

        words.add(Word(word: letters, file: "iojolti.mp3"));


        letters = [];
        letters.add(Letter(letter: "וּ"));
        letters.add(Letter(letter: "קְ", file: "soundK.mp3", color: Colors.blue));
        letters.add(Letter(letter: "שַׁ"));
        letters.add(Letter(letter: "רְ", file: "soundR.mp3", color: Colors.blue));
        letters.add(Letter(letter: "תֶּ"));
        letters.add(Letter(letter: "ם"));

        words.add(Word(word: letters, file: "ukshartem.mp3"));

        letters = [];
        letters.add(Letter(letter: "נֹ"));
        letters.add(Letter(letter: "פְ", file: "a0322.mp3", color: Colors.red));
        letters.add(Letter(letter: "ל"));
        letters.add(Letter(letter: "יִ"));
        letters.add(Letter(letter: "ם"));

        words.add(Word(word: letters, file: "nofelim.mp3"));

        letters = [];
        letters.add(Letter(letter: "בָּ"));
        letters.add(Letter(letter: "רְ", file: "soundRE.mp3", color: Colors.red));
        letters.add(Letter(letter: "כ"));
        letters.add(Letter(letter: "וּ"));

        words.add(Word(word: letters, file: "boreju.mp3"));


        spanish = "Cuando el SHEVO aparece después de una TNUO GUEDOILO que tiene una marca de cántico es siempre SHEVO NAJ. Si no hay marca de cántico, es un SHEVO NO. Si el SHEVO aparece después de un KUBUTZ al comienzo de una palabra, es un SHEVO NAJ, como en la palabra UKSHARTEM.";
        english = "When the SHEVO appears after a TNUO GEDOLO that has a chanting mark it's allways a SHEVO NACH. If there is no chanting mark, it's a SHEVO NO. If the SHEVO appears after a KUBUTZ at the beginning of a word, it's a SHEVO NACH, like in the word UKSHARTEM.";

        break;
    }

    return buildWordsScreen(title, words, spanish: spanish, english: english, type: type);
  }
}

