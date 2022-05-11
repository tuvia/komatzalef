import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:komatzalef/letters.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'exer_letters.dart';
import 'shvo.dart';
import 'shema.dart';
import 'jes.dart';
import 'hei.dart';
import 'globals.dart';

/*
 * Main screens
 */
const List<ScreenDefinition> screenList = [

  ScreenDefinition(
      WidgetLetters(
        title: "אבג",
        type: LetterType.allLetters,
      ),
      "אבג",
      Colors.blue,
      Colors.lime),

  ScreenDefinition(
      WidgetNekudos(
        title: "ֵ ַ ָ ",
      ),
      "ֵ ַ ָ ",
      Colors.amber,
      Colors.red),

  ScreenDefinition(
      WidgetAvaros(
        title: "אָבָגָ",
      ),
      "אָבָגָ",
      Colors.purple,
      Colors.deepOrange),

  ScreenDefinition(
      WidgetExerciseLetters(
        title: "Exercise",
      ),
      "Exercise",
      Colors.blue,
      Colors.tealAccent),

  ScreenDefinition(
      WidgetJes(
        title: "חַ",
      ),
      "חַ",
      Colors.green,
      Colors.orange),
  ScreenDefinition(
      WidgetHei(
        title: "הּ",
      ),
      "הּ",
      Colors.blueGrey,
      Colors.yellow),

  ScreenDefinition(
      WidgetShvo(
        title: "שְׁוָוא נָע/נַח",
      ),
      "שְׁוָוא נָע/נַח",
      Colors.orange,
      Colors.brown),
  ScreenDefinition(
      WidgetShema(
        title: "שְׁמַע",
      ),
      "שְׁמַע",
      Colors.teal,
      Colors.indigo),
];

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<OisProvider>(create: (_) => OisProvider()),
  ChangeNotifierProvider<NekudaProvider>(create: (_) => NekudaProvider()),
  ChangeNotifierProvider<AvaraProvider>(create: (_) => AvaraProvider()),
];

/*
 * Main procedure
 */
void main() {
  runApp(MultiProvider(
    providers: providers,
    child: const MyApp(),
  ));
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
        appBar: buildAppBar(context, globalTitle),
        body: Container(
            color: globalColor,
            padding: const EdgeInsets.all(globalInset),
            child: buildScreenButtons(screenList)));
  }
}
