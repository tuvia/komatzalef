import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'letters_nekudos.dart';
import 'shvo.dart';
import 'shema.dart';
import 'jes.dart';
import 'hei.dart';
import 'globals.dart';



/*
 * Main screens
 */
const List<ScreenDefinition> screenList = [
  ScreenDefinition(WidgetLettersNekudos(type: LettersScreenType.justLetters, title:  "אבג",), "אבג", Colors.red, Colors.amber),
  ScreenDefinition(WidgetLettersNekudos(type: LettersScreenType.justNekudos, title: "ֵ ַ ָ ",), "ֵ ַ ָ ", Colors.amber, Colors.red),
  ScreenDefinition(WidgetLettersNekudos(type: LettersScreenType.lettersWithNekudos, title: "אָבָגָ",), "אָבָגָ", Colors.blue, Colors.lime),
  ScreenDefinition(WidgetJes(title: "חַ",), "חַ", Colors.green, Colors.orange),
  ScreenDefinition(WidgetHei(title: "הּ",), "הּ", Colors.blueGrey, Colors.yellow),
  ScreenDefinition(WidgetShvo(title: "שְׁוָוא נָע/נַח",), "שְׁוָוא נָע/נַח", Colors.orange, Colors.brown),
  ScreenDefinition(WidgetShema(title: "שְׁמַע",), "שְׁמַע", Colors.teal, Colors.indigo),
];




/*
 * Main procedure
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: globalTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WidgetMain(),
    );
  }
}



class WidgetMain extends StatefulWidget {
  const WidgetMain({Key? key}) : super(key: key);

  @override
  State<WidgetMain> createState() => _WidgetMainState();
}

class _WidgetMainState extends State<WidgetMain> {

  @override
  void initState() {

    // Initialize audio player
    audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: globalColor,
        appBar: buildAppBar(globalTitle),
        body: Container(
          color: globalColor,
          padding: const EdgeInsets.all(globalInset),
          child: buildScreenButtons(screenList)
        ));
  }
}

