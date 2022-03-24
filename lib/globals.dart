import 'package:flutter/material.dart';
import 'package:komatzalef/shvo.dart';
import 'package:share/share.dart';
import 'dart:io';
import 'package:blinking_text/blinking_text.dart';
import 'package:just_audio/just_audio.dart';



late AudioPlayer audioPlayer;

Color globalColor = Colors.red.shade100;
const globalTitle = "Komatz Alef";

const double globalElevation = 12.0;
const double globalInset = 8.0;


class ScreenDefinition {
  const ScreenDefinition(
      this.widget,
      this.title,
      this.textColor, this.cardColor,
      );

  final Widget widget;
  final String title;
  final Color textColor;
  final Color cardColor;
}


enum LettersScreenType {
  justLetters,
  justNekudos,
  lettersWithNekudos
}


/*
 * This two classes (Letter and Word) are used
 * in the Screen explaining the CHES and SHVO
 */
class Letter {
  Letter(
      {required this.letter,
        this.color = Colors.black,
        this.file = ""});

  final String letter;
  Color color;
  String file;
}

class Word {
  const Word({required this.word, required this.file});

  final List<Letter> word;
  final String file;
}


/*
 * Produce a widget with the word with colors and blinking
 * specified
*/
Widget buildWordWidget(Word word) {
  List<Widget> wl = [];

  for (int i = word.word.length - 1; i >= 0; i--) {
    wl.add(word.word[i].file != ""
        ? InkWell(
      onTap: () {
        // if this is a special letter, the produce it's sound
        if (word.word[i].file != "") {
          play(word.word[i].file); // AJ or JA or file
        }
      },
      child: BlinkText(
        word.word[i].letter,
        style: TextStyle(
          fontFamily: "SBL",
          fontSize: 60,
          color: word.word[i].color,
          shadows: const [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Colors.black,
            ),
          ],
        ),
        times: 5,
        beginColor: word.word[i].color,
        endColor: Colors.white,
      ),
    )
        : getText(word.word[i]),
        );
  }

  return Row(mainAxisAlignment: MainAxisAlignment.end, children: wl);
}

/*
 * This function is a helper of the previous one.
 * it returns the text with color if indicated
 */
Widget getText(Letter letter) {
  Color color = letter.color;

  if (letter.color != Colors.black) {
    color = letter.color;
  }

  return Text(letter.letter,
      style: TextStyle(
        fontFamily: "SBL",
        fontSize: 60,
        color: color,
        shadows: const [
          Shadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 3.0,
            color: Colors.black,
          ),
        ],
      ));
}




/*
 * This function builds the description in english and spanish
 */
Widget buildDescriptions({required String english, required String spanish}) {

  List<Widget> wl = [];
  wl.add(
    Padding(padding: const EdgeInsets.all(10) ,child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/ar.png', width: 25,),
        const SizedBox(width: 10),
        Expanded(child: Text(spanish, style: const TextStyle(fontSize: 18))),
      ],
  )));

  wl.add(
    Padding(padding: const EdgeInsets.all(10), child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/us.png', width: 25,),
          const SizedBox(width: 10,),
          Expanded(child: Text(english, style: const TextStyle(fontSize: 18))),
        ],
      )));

  return Column(children: wl);
}


/*
 * This function build the regular screen showing words
 */
Widget buildWordsScreen(String title, List<Word> words, {String spanish = "", String english = "", ShvoType type = ShvoType.one}) {
  List<Widget> wl = [];

  // This would be the description of the rules explained
  if (spanish != "" && english != "") {
    wl.add(buildDescriptions(spanish: spanish, english: english));
    wl.add(const SizedBox(height: 15,));
  }

  // these are the words that show the rule described
  for (int i = 0; i < words.length; i++) {
    wl.add(
      Padding(
        padding: const EdgeInsets.all(15),
        child: ListTile(
          title: buildWordWidget(words[i]),
          leading: const SizedBox(
            // this setting allows for vertical icon center
              height: double.infinity,
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.black,
              )),
          onTap: () {
            play(words[i].file); // play the WORD
          },
        ),
      ),
    );
  }

  // show table of nekudos if showing the corresponding SHEVO rule
  if (type == ShvoType.six) {
    wl.add(buildNekudosTable());
  }

  return Scaffold(
    backgroundColor: globalColor,
    appBar: buildAppBar(title),
    body: Padding(
      padding: const EdgeInsets.all(globalInset),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: wl,
        ),
      ),
    ),
  );
}



/*
 * This function builds the list of buttons to access Widgets
 */
Widget buildScreenButtons(List<ScreenDefinition> screens) {
  return ListView.builder(
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        color: screens[index].cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: globalElevation,
        child: ListTile(
          title: Text(
            screens[index].title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: screens[index].textColor,
              fontFamily: "SBL",
              fontSize: 70,
              shadows: const [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.black,
                ),
              ],
            ),),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => screens[index].widget));
          },
        ),
      );
    },
    itemCount: screens.length,
  );
}




/*
 * This method receives a name file and plays it
 */
void play(String file) async {
  await audioPlayer.setAsset("audios/" + file);
  await audioPlayer.play();
}



/*
   * This function builds the AppBar according
   * to Android or iPhone
   * This is because of the Parental Gate.
   * All Screens call this function
   */
AppBar buildAppBar(String title) {
  if (Platform.isAndroid) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              const url =
                  'https://play.google.com/store/apps/details?id=org.jabadlaplata.komatzalef\n https://apps.apple.com/us/app/komatz-alef/id1613445824';
              const msg = 'Komatz Alef App\n\n';

              Share.share(msg + ' ' + url, subject: msg);
            },
            icon: const Icon(Icons.share)),
      ],
      title: Text(title, style: const TextStyle(
        fontFamily: "SBL",
        fontSize: 30,
      ),),
    );
  } else {
    return AppBar(
      title: Text(title, style: const TextStyle(
      fontFamily: "SBL",
        fontSize: 30,
      ),),
    );
  }
}


/*
 * This functions returns a table with nekudos gdoilos and ktanos
 */
Widget buildNekudosTable() {
  const double fontSize = 40;

  return Padding(
    padding: const EdgeInsets.all(globalInset),
    child: Table(
        textDirection: TextDirection.rtl,
        border: TableBorder.all(color: Colors.grey),
        children: const [
          TableRow(
              children: [
                Text("תנועות גדולות", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize+5, fontFamily: "SBL"),),
                Text("תנועות קטנות", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize+5, fontFamily: "SBL"),),
              ]
          ),
          TableRow(
              children: [
                Text("אָ", textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize, fontFamily: "SBL"),),
                Text("אַ", textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize, fontFamily: "SBL"),),
              ]
          ),
          TableRow(
              children: [
                Text("אֵי", textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize, fontFamily: "SBL"),),
                Text("אֶ", textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize, fontFamily: "SBL"),),
              ]
          ),
          TableRow(
              children: [
                Text("אִי", textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize, fontFamily: "SBL"),),
                Text("אִ", textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize, fontFamily: "SBL"),),
              ]
          ),
          TableRow(
              children: [
                Text("אוֹ/אֹ", textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize, fontFamily: "SBL"),),
                Text("אָ", textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize, fontFamily: "SBL"),),
              ]
          ),
          TableRow(
              children: [
                Text("אוּ", textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize, fontFamily: "SBL"),),
                Text("אֻ", textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize, fontFamily: "SBL"),),
              ]
          ),

        ]

    ),
  );
}