import 'package:flutter/material.dart';
import 'globals.dart';



/*
 * Set by buildGlobalStrings
 */
String playString = "";
String displayString = "";

String pressedNekuda = "";
String pressedOis = "";

const int typeNekuda = 0;
const int typeOis = 1;
const int typeAvara = 2;

const List<Color> letterColors = [
  Colors.amber,
  Colors.red,
  Colors.blue,
  Colors.pink,
  Colors.purpleAccent,
  Colors.green,
  Colors.lime,
  Colors.orange,
  Colors.brown,
  Colors.indigo,
];

int colorIndex = 0;




class WidgetLettersNekudos extends StatelessWidget {
  const WidgetLettersNekudos({Key? key, required this.type, required this.title}) : super(key: key);

  final LettersScreenType type;
  final String title;



  @override
  Widget build(BuildContext context) {

    playString = "";
    displayString = "";
    pressedNekuda = "";

    return Scaffold(
        backgroundColor: globalColor,
        appBar: buildAppBar(title),
        body: buildLetters(context));
  }


  /*
   * This functions builds the main screen
   */
  Widget buildLetters(BuildContext context) {
    List<Widget> letters = [];
    List<Widget> nekudos = [];

    if (type == LettersScreenType.justLetters ||
        type == LettersScreenType.lettersWithNekudos) {
      letters
          .add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildOis(context, '04'),
        buildOis(context, '03'),
        buildOis(context, '02'),
        buildOis(context, '01'),
        buildOis(context, '00'),
      ]));
      letters
          .add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildOis(context, '09'),
        buildOis(context, '08'),
        buildOis(context, '07'),
        buildOis(context, '06'),
        buildOis(context, '05'),
      ]));
      letters
          .add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildOis(context, '32'),
        buildOis(context, '13'),
        buildOis(context, '12'),
        buildOis(context, '11'),
        buildOis(context, '10'),
      ]));
      letters
          .add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildOis(context, '18'),
        buildOis(context, '17'),
        buildOis(context, '16'),
        buildOis(context, '15'),
        buildOis(context, '14'),

      ]));
      letters
          .add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildOis(context, '23'),
        buildOis(context, '22'),
        buildOis(context, '21'),
        buildOis(context, '20'),
        buildOis(context, '19'),
      ]));
      letters
          .add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildOis(context, '28'),
        buildOis(context, '27'),
        buildOis(context, '26'),
        buildOis(context, '25'),
        buildOis(context, '24'),
      ]));
      letters.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        buildOis(context, '31'),
        buildOis(context, '30'),
        buildOis(context, '29'),
      ]));
    }

    if (type == LettersScreenType.justNekudos ||
        type == LettersScreenType.lettersWithNekudos) {
      nekudos
          .add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildNekuda('02'), // tzeire
        buildNekuda('01'), // pataj
        buildNekuda('00'), // komatz
      ]));
      nekudos
          .add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildNekuda('09'), // Joilom Molei
        buildNekuda('05'), // joilom
        buildNekuda('03'), // segol
      ]));
      nekudos
          .add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildNekuda('04'), // shuruk
        buildNekuda('07'), // kubutz
        buildNekuda('06'), // jirik
      ]));
      nekudos
          .add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildNekuda('08'), // shvo
      ]));

    }


    List<Widget> wl = [];
    if (type == LettersScreenType.justLetters) {
      wl.addAll(letters);

    }
    else if (type == LettersScreenType.lettersWithNekudos) {

      String spanish = "Para escuchar la combinación de letras con puntuaciones presiona primero una pronunciación y luego la letra.";
      String english = "To hear the combination of letters with punctuation, first press the pronunciacion and then the letter.";
      wl.add(buildDescriptions(spanish: spanish, english: english));
      wl.add(const SizedBox(height: 15));

      wl.addAll(letters);

      wl.add(const SizedBox(
        height: 10,
      ));
      wl.addAll(nekudos);
    }
    else if (type == LettersScreenType.justNekudos) {
      wl.addAll(nekudos);

      wl.add(const SizedBox(height: 15));

       // show table of nekudos gdoilos and ktanos
      wl.add(buildNekudosTable());

    }

    wl.add(const SizedBox(
      height: 15,
    ));

    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: wl),
    );
  }

  /*
   * This function builds the button of a letter
   */
  Widget buildOis(BuildContext context, String ois) {
    // change the colors of the letters
    colorIndex++;
    if (colorIndex >= letterColors.length) {
      colorIndex = 0;
    }

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () async {
        pressedOis = ois;

        // play an avara
        if (pressedNekuda != "" && pressedOis != "") {
          buildGlobalStrings(typeAvara, pressedNekuda, pressedOis);
          play('o' + pressedOis + '.mp3');
          // wait
          await Future.delayed(const Duration(milliseconds: 900), () {});
          await dialogScreen(context);

          // reset
          pressedNekuda = "";
          pressedOis = "";
        }

        // just play an ois
        else if (pressedNekuda == "" && pressedOis != "") {
          buildGlobalStrings(typeOis, "", pressedOis);
          await dialogScreen(context);
        }
      },
      child: Text(
        buildGlobalStrings(typeOis, "", ois),
        style: TextStyle(
          fontFamily: "SBL",
          fontSize: 60,
          color: letterColors[colorIndex],
          shadows: const [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Colors.black,
            ),
          ],
        )),
    );
  }

  /*
   * This functions builds the button of a nekuda
   */
  Widget buildNekuda(String nekuda) {
    // change the colors of the letters
    colorIndex++;
    if (colorIndex >= letterColors.length) {
      colorIndex = 0;
    }

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        pressedNekuda = nekuda;

        // just play a nekuda
        buildGlobalStrings(typeNekuda, nekuda, "");
        play(playString);

        // reset in case of SHVA
        if (nekuda == '08') {
          pressedNekuda = "";
          pressedOis = "";
        }
      },
      child: Text(
        buildGlobalStrings(typeNekuda, nekuda, ""),
        style: TextStyle(
          fontFamily: "SBL",
          fontSize: 80,
          fontWeight: FontWeight.bold,
          color: letterColors[colorIndex],
          shadows: const [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Colors.black,
            ),
          ],
        )
      ),
    );
  }

/*
 * This functions actually shows a letter or avara
 */
  Future dialogScreen(BuildContext context) async {
    play(playString);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: globalColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  displayString,
                  style: const TextStyle(
                    fontSize: 300,
                    fontFamily: 'SBL',
                    shadows: [
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: () async {
                      play(playString);
                    },
                    child: const Icon(Icons.replay),
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


/*
   * This functions sets the proper display and play strings (globals)
   * also return a OIS to display in the main screen
   */
String buildGlobalStrings(int type, String nekuda, String ois) {
  switch (type) {
    case typeOis:
      playString = 'o' + ois + '.mp3';

      switch (ois) {
        case "00":
          displayString = 'א';
          break;
        case "01":
          displayString = 'בּ';
          break;
        case "02":
          displayString = "ב";
          break;
        case "03":
          displayString = "ג";
          break;
        case "04":
          displayString = 'ד';
          break;
        case "05":
          displayString = 'ה';
          break;
        case "06":
          displayString = 'ו';
          break;
        case "07":
          displayString = 'ז';
          break;
        case "08":
          displayString = 'ח';
          break;
        case "09":
          displayString = 'ט';
          break;
        case "10":
          displayString = 'י';
          break;
        case "11":
          displayString = 'כּ';
          break;
        case "12":
          displayString = 'כ';
          break;
        case "13":
          displayString = 'ך';
          break;
        case "32":
          displayString = 'ךּ';
          break;
        case "14":
          displayString = 'ל';
          break;
        case "15":
          displayString = 'מ';
          break;
        case "16":
          displayString = 'ם';
          break;
        case "17":
          displayString = 'נ';
          break;
        case "18":
          displayString = 'ן';
          break;
        case "19":
          displayString = 'ס';
          break;
        case "20":
          displayString = 'ע';
          break;
        case "21":
          displayString = 'פּ';
          break;
        case "22":
          displayString = 'פ';
          break;
        case "23":
          displayString = 'ף';
          break;
        case "24":
          displayString = 'צ';
          break;
        case "25":
          displayString = 'ץ';
          break;
        case "26":
          displayString = 'ק';
          break;
        case "27":
          displayString = 'ר';
          break;
        case "28":
          displayString = 'שׁ';
          break;
        case "29":
          displayString = 'שׂ';
          break;
        case "30":
          displayString = 'תּ';
          break;
        case "31":
          displayString = 'ת';
          break;
      }

      return displayString;

    case typeNekuda:
      playString = 'n' + nekuda + '.mp3';
      switch (nekuda) {
        case "00":
          return 'ָ ';
        case "01":
          return 'ַ ';
        case "02":
          return 'ֵ ';
        case "03":
          return 'ֶ ';
        case "07":
          return "וּ";
        case "05":
          return 'ֹ ';
        case "06":
          return 'ִ ';
        case "04":
          return 'ֻ ';
        case "08":
          return 'ְ ';
        case "09":
          return 'ֹו';
      }
      break;

    case typeAvara:
      playString = 'a' + nekuda + ois + '.mp3';

      if (nekuda == "04") {
        // this is kubutz, sounds like shuruk
        playString = 'a07' + ois + '.mp3';
      } else if (nekuda == "09") {
        // this is joilom molei, sounds like joilom
        playString = 'a05' + ois + '.mp3';
      }

      switch (nekuda) {

        // KOMATZ
        case '00':
          switch (ois) {
            case "00":
              displayString = 'אָ';
              break;
            case "01":
              displayString = 'בּ';
              break;
            case "02":
              displayString = "בָ";
              break;
            case "03":
              displayString = "גָ";
              break;
            case "04":
              displayString = 'דָ';
              break;
            case "05":
              displayString = 'הָ';
              break;
            case "06":
              displayString = 'וָ';
              break;
            case "07":
              displayString = 'זָ';
              break;
            case "08":
              displayString = 'חָ';
              break;
            case "09":
              displayString = 'טָ';
              break;
            case "10":
              displayString = 'יָ';
              break;
            case "11":
              displayString = 'כָּ';
              break;
            case "12":
              displayString = 'כָ';
              break;
            case "13":
              displayString = 'ךָ';
              break;
            case "32":
              displayString = 'ךָּ';
              break;
            case "14":
              displayString = 'לָ';
              break;
            case "15":
              displayString = 'מָ';
              break;
            case "16":
              displayString = 'ם';
              break;
            case "17":
              displayString = 'נָ';
              break;
            case "18":
              displayString = 'ןָ';
              break;
            case "19":
              displayString = 'סָ';
              break;
            case "20":
              displayString = 'עָ';
              break;
            case "21":
              displayString = 'פָּ';
              break;
            case "22":
              displayString = 'פָ';
              break;
            case "23":
              displayString = 'ף';
              break;
            case "24":
              displayString = 'צָ';
              break;
            case "25":
              displayString = 'ץ';
              break;
            case "26":
              displayString = 'קָ';
              break;
            case "27":
              displayString = 'רָ';
              break;
            case "28":
              displayString = 'שָׁ';
              break;
            case "29":
              displayString = 'שָׂ';
              break;
            case "30":
              displayString = 'תָּ';
              break;
            case "31":
              displayString = 'תָ';
              break;
          }
          break;

        // PATAJ
        case '01':
          switch (ois) {
            case "00":
              displayString = 'אַ';
              break;
            case "01":
              displayString = 'בַּ';
              break;
            case "02":
              displayString = "בַ";
              break;
            case "03":
              displayString = "גַ";
              break;
            case "04":
              displayString = 'דַ';
              break;
            case "05":
              displayString = 'הַ';
              break;
            case "06":
              displayString = 'וַ';
              break;
            case "07":
              displayString = 'זַ';
              break;
            case "08":
              displayString = 'חַ';
              break;
            case "09":
              displayString = 'טַ';
              break;
            case "10":
              displayString = 'יַ';
              break;
            case "11":
              displayString = 'כַּ';
              break;
            case "12":
              displayString = 'כַ';
              break;
            case "13":
              displayString = 'ך';
              break;
            case "32":
              displayString = 'ךּ';
              break;
            case "14":
              displayString = 'לַ';
              break;
            case "15":
              displayString = 'מַ';
              break;
            case "16":
              displayString = 'ם';
              break;
            case "17":
              displayString = 'נַ';
              break;
            case "18":
              displayString = 'ן';
              break;
            case "19":
              displayString = 'סַ';
              break;
            case "20":
              displayString = 'עַ';
              break;
            case "21":
              displayString = 'פַּ';
              break;
            case "22":
              displayString = 'פַ';
              break;
            case "23":
              displayString = 'ף';
              break;
            case "24":
              displayString = 'צַ';
              break;
            case "25":
              displayString = 'ץ';
              break;
            case "26":
              displayString = 'קַ';
              break;
            case "27":
              displayString = 'רַ';
              break;
            case "28":
              displayString = 'שַׁ';
              break;
            case "29":
              displayString = 'שַׂ';
              break;
            case "30":
              displayString = 'תַּ';
              break;
            case "31":
              displayString = 'תַ';
              break;
          }
          break;

        // TZEIRE
        case '02':
          switch (ois) {
            case "00":
              displayString = 'אֵ';
              break;
            case "01":
              displayString = 'בֵּ';
              break;
            case "02":
              displayString = "בֵ";
              break;
            case "03":
              displayString = "גֵ";
              break;
            case "04":
              displayString = 'דֵ';
              break;
            case "05":
              displayString = 'הֵ';
              break;
            case "06":
              displayString = 'וֵ';
              break;
            case "07":
              displayString = 'זֵ';
              break;
            case "08":
              displayString = 'חֵ';
              break;
            case "09":
              displayString = 'טֵ';
              break;
            case "10":
              displayString = 'יֵ';
              break;
            case "11":
              displayString = 'כֵּ';
              break;
            case "12":
              displayString = 'כֵ';
              break;
            case "13":
              displayString = 'ך';
              break;
            case "32":
              displayString = 'ךּ';
              break;
            case "14":
              displayString = 'לֵ';
              break;
            case "15":
              displayString = 'מֵ';
              break;
            case "16":
              displayString = 'ם';
              break;
            case "17":
              displayString = 'נֵ';
              break;
            case "18":
              displayString = 'ן';
              break;
            case "19":
              displayString = 'סֵ';
              break;
            case "20":
              displayString = 'עֵ';
              break;
            case "21":
              displayString = 'פֵּ';
              break;
            case "22":
              displayString = 'פֵ';
              break;
            case "23":
              displayString = 'ף';
              break;
            case "24":
              displayString = 'צֵ';
              break;
            case "25":
              displayString = 'ץ';
              break;
            case "26":
              displayString = 'קֵ';
              break;
            case "27":
              displayString = 'רֵ';
              break;
            case "28":
              displayString = 'שֵׁ';
              break;
            case "29":
              displayString = 'שֵׂ';
              break;
            case "30":
              displayString = 'תֵּ';
              break;
            case "31":
              displayString = 'תֵ';
              break;
          }
          break;

        // SEGOL
        case '03':
          switch (ois) {
            case "00":
              displayString = 'אֶ';
              break;
            case "01":
              displayString = 'בֶּ';
              break;
            case "02":
              displayString = "בֶ";
              break;
            case "03":
              displayString = "גֶ";
              break;
            case "04":
              displayString = 'דֶ';
              break;
            case "05":
              displayString = 'הֶ';
              break;
            case "06":
              displayString = 'וֶ';
              break;
            case "07":
              displayString = 'זֶ';
              break;
            case "08":
              displayString = 'חֶ';
              break;
            case "09":
              displayString = 'טֶ';
              break;
            case "10":
              displayString = 'יֶ';
              break;
            case "11":
              displayString = 'כֶּ';
              break;
            case "12":
              displayString = 'כֶ';
              break;
            case "13":
              displayString = 'ך';
              break;
            case "32":
              displayString = 'ךּ';
              break;
            case "14":
              displayString = 'לֶ';
              break;
            case "15":
              displayString = 'מֶ';
              break;
            case "16":
              displayString = 'ם';
              break;
            case "17":
              displayString = 'נֶ';
              break;
            case "18":
              displayString = 'ן';
              break;
            case "19":
              displayString = 'סֶ';
              break;
            case "20":
              displayString = 'עֶ';
              break;
            case "21":
              displayString = 'פֶּ';
              break;
            case "22":
              displayString = 'פֶ';
              break;
            case "23":
              displayString = 'ף';
              break;
            case "24":
              displayString = 'צֶ';
              break;
            case "25":
              displayString = 'ץ';
              break;
            case "26":
              displayString = 'קֶ';
              break;
            case "27":
              displayString = 'רֶ';
              break;
            case "28":
              displayString = 'שֶׁ';
              break;
            case "29":
              displayString = 'שֶׂ';
              break;
            case "30":
              displayString = 'תֶּ';
              break;
            case "31":
              displayString = 'תֶ';
              break;
          }
          break;

        // JOILOM
        case '05':
          switch (ois) {
            case "00":
              displayString = 'אֹ';
              break;
            case "01":
              displayString = 'בֹּ';
              break;
            case "02":
              displayString = "בֹ";
              break;
            case "03":
              displayString = "גֹ";
              break;
            case "04":
              displayString = 'דֹ';
              break;
            case "05":
              displayString = 'הֹ';
              break;
            case "06":
              displayString = 'וֹ';
              break;
            case "07":
              displayString = 'זֹ';
              break;
            case "08":
              displayString = 'חֹ';
              break;
            case "09":
              displayString = 'טֹ';
              break;
            case "10":
              displayString = 'יֹ';
              break;
            case "11":
              displayString = 'כֹּ';
              break;
            case "12":
              displayString = 'כֹ';
              break;
            case "13":
              displayString = 'ך';
              break;
            case "32":
              displayString = 'ךּ';
              break;
            case "14":
              displayString = 'לֹ';
              break;
            case "15":
              displayString = 'מֹ';
              break;
            case "16":
              displayString = 'ם';
              break;
            case "17":
              displayString = 'נֹ';
              break;
            case "18":
              displayString = 'ן';
              break;
            case "19":
              displayString = 'סֹ';
              break;
            case "20":
              displayString = 'עֹ';
              break;
            case "21":
              displayString = 'פֹּ';
              break;
            case "22":
              displayString = 'פֹ';
              break;
            case "23":
              displayString = 'ף';
              break;
            case "24":
              displayString = 'צֹ';
              break;
            case "25":
              displayString = 'ץ';
              break;
            case "26":
              displayString = 'קֹ';
              break;
            case "27":
              displayString = 'רֹ';
              break;
            case "28":
              displayString = 'שֹׁ';
              break;
            case "29":
              displayString = 'שֹׂ';
              break;
            case "30":
              displayString = 'תֹּ';
              break;
            case "31":
              displayString = 'תֹ';
              break;
          }
          break;

        // JIRIK
        case '06':
          switch (ois) {
            case "00":
              displayString = 'אִ';
              break;
            case "01":
              displayString = 'בִּ';
              break;
            case "02":
              displayString = "בִ";
              break;
            case "03":
              displayString = "גִ";
              break;
            case "04":
              displayString = 'דִ';
              break;
            case "05":
              displayString = 'הִ';
              break;
            case "06":
              displayString = 'וִ';
              break;
            case "07":
              displayString = 'זִ';
              break;
            case "08":
              displayString = 'חִ';
              break;
            case "09":
              displayString = 'טִ';
              break;
            case "10":
              displayString = 'יִ';
              break;
            case "11":
              displayString = 'כִּ';
              break;
            case "12":
              displayString = 'כִ';
              break;
            case "13":
              displayString = 'ך';
              break;
            case "32":
              displayString = 'ךּ';
              break;
            case "14":
              displayString = 'לִ';
              break;
            case "15":
              displayString = 'מִ';
              break;
            case "16":
              displayString = 'ם';
              break;
            case "17":
              displayString = 'נִ';
              break;
            case "18":
              displayString = 'ן';
              break;
            case "19":
              displayString = 'סִ';
              break;
            case "20":
              displayString = 'עִ';
              break;
            case "21":
              displayString = 'פִּ';
              break;
            case "22":
              displayString = 'פִ';
              break;
            case "23":
              displayString = 'ף';
              break;
            case "24":
              displayString = 'צִ';
              break;
            case "25":
              displayString = 'ץ';
              break;
            case "26":
              displayString = 'קִ';
              break;
            case "27":
              displayString = 'רִ';
              break;
            case "28":
              displayString = 'שִׁ';
              break;
            case "29":
              displayString = 'שִׂ';
              break;
            case "30":
              displayString = 'תִּ';
              break;
            case "31":
              displayString = 'תִ';
              break;
          }
          break;

        // SHURUK
        case '04':
          switch (ois) {
            case "00":
              displayString = 'אֻ';
              break;
            case "01":
              displayString = 'בֻּ';
              break;
            case "02":
              displayString = "בֻ";
              break;
            case "03":
              displayString = "גֻ";
              break;
            case "04":
              displayString = 'דֻ';
              break;
            case "05":
              displayString = 'הֻ';
              break;
            case "06":
              displayString = 'וֻ';
              break;
            case "07":
              displayString = 'זֻ';
              break;
            case "08":
              displayString = 'חֻ';
              break;
            case "09":
              displayString = 'טֻ';
              break;
            case "10":
              displayString = 'יֻ';
              break;
            case "11":
              displayString = 'כֻּ';
              break;
            case "12":
              displayString = 'כֻ';
              break;
            case "13":
              displayString = 'ך';
              break;
            case "32":
              displayString = 'ךּ';
              break;
            case "14":
              displayString = 'לֻ';
              break;
            case "15":
              displayString = 'מֻ';
              break;
            case "16":
              displayString = 'ם';
              break;
            case "17":
              displayString = 'נֻ';
              break;
            case "18":
              displayString = 'ן';
              break;
            case "19":
              displayString = 'סֻ';
              break;
            case "20":
              displayString = 'עֻ';
              break;
            case "21":
              displayString = 'פֻּ';
              break;
            case "22":
              displayString = 'פֻ';
              break;
            case "23":
              displayString = 'ף';
              break;
            case "24":
              displayString = 'צֻ';
              break;
            case "25":
              displayString = 'ץ';
              break;
            case "26":
              displayString = 'קֻ';
              break;
            case "27":
              displayString = 'רֻ';
              break;
            case "28":
              displayString = 'שֻׁ';
              break;
            case "29":
              displayString = 'שֻׂ';
              break;
            case "30":
              displayString = 'תֻּ';
              break;
            case "31":
              displayString = 'תֻ';
              break;
          }
          break;

        case "07": // kubutz
          switch (ois) {
            case "00":
              displayString = 'אוּ';
              break;
            case "01":
              displayString = 'בּוּ';
              break;
            case "02":
              displayString = "בוּ";
              break;
            case "03":
              displayString = "גוּ";
              break;
            case "04":
              displayString = 'דוּ';
              break;
            case "05":
              displayString = 'הוּ';
              break;
            case "06":
              displayString = 'ווּ';
              break;
            case "07":
              displayString = 'זוּ';
              break;
            case "08":
              displayString = 'חוּ';
              break;
            case "09":
              displayString = 'טוּ';
              break;
            case "10":
              displayString = 'יוּ';
              break;
            case "11":
              displayString = 'כּוּ';
              break;
            case "12":
              displayString = 'כוּ';
              break;
            case "13":
              displayString = 'ך';
              break;
            case "32":
              displayString = 'ךּ';
              break;
            case "14":
              displayString = 'לוּ';
              break;
            case "15":
              displayString = 'מוּ';
              break;
            case "16":
              displayString = 'ם';
              break;
            case "17":
              displayString = 'נוּ';
              break;
            case "18":
              displayString = 'ן';
              break;
            case "19":
              displayString = 'סוּ';
              break;
            case "20":
              displayString = 'עוּ';
              break;
            case "21":
              displayString = 'פּוּ';
              break;
            case "22":
              displayString = 'פוּ';
              break;
            case "23":
              displayString = 'ף';
              break;
            case "24":
              displayString = 'צוּ';
              break;
            case "25":
              displayString = 'ץ';
              break;
            case "26":
              displayString = 'קוּ';
              break;
            case "27":
              displayString = 'רוּ';
              break;
            case "28":
              displayString = 'שׁוּ';
              break;
            case "29":
              displayString = 'שׂוּ';
              break;
            case "30":
              displayString = 'תּוּ';
              break;
            case "31":
              displayString = 'תוּ';
              break;
          }
          break;

        case "09":
          switch (ois) {
            case "00":
              displayString = 'אוֹ';
              break;
            case "01":
              displayString = 'בּוֹ';
              break;
            case "02":
              displayString = "בוֹ";
              break;
            case "03":
              displayString = "גוֹ";
              break;
            case "04":
              displayString = 'דוֹ';
              break;
            case "05":
              displayString = 'הוֹ';
              break;
            case "06":
              displayString = 'ווֹ';
              break;
            case "07":
              displayString = 'זוֹ';
              break;
            case "08":
              displayString = 'חוֹ';
              break;
            case "09":
              displayString = 'טוֹ';
              break;
            case "10":
              displayString = 'יוֹ';
              break;
            case "11":
              displayString = 'כּוֹ';
              break;
            case "12":
              displayString = 'כוֹ';
              break;
            case "13":
              displayString = 'ך';
              break;
            case "32":
              displayString = 'ךּ';
              break;
            case "14":
              displayString = 'לוֹ';
              break;
            case "15":
              displayString = 'מוֹ';
              break;
            case "16":
              displayString = 'ם';
              break;
            case "17":
              displayString = 'נוֹ';
              break;
            case "18":
              displayString = 'ן';
              break;
            case "19":
              displayString = 'סוֹ';
              break;
            case "20":
              displayString = 'עוֹ';
              break;
            case "21":
              displayString = 'פּוֹ';
              break;
            case "22":
              displayString = 'פוֹ';
              break;
            case "23":
              displayString = 'ף';
              break;
            case "24":
              displayString = 'צוֹ';
              break;
            case "25":
              displayString = 'ץ';
              break;
            case "26":
              displayString = 'קוֹ';
              break;
            case "27":
              displayString = 'רוֹ';
              break;
            case "28":
              displayString = 'שׁוֹ';
              break;
            case "29":
              displayString = 'שׂוֹ';
              break;
            case "30":
              displayString = 'תּוֹ';
              break;
            case "31":
              displayString = 'תוֹ';
              break;
          }

      }


  }

  return "";
}
