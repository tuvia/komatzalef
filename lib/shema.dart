import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'globals.dart';

class ShemaWord {
  ShemaWord({required this.file, required this.word});

  final String word;
  final String file;
  ValueNotifier<Color> colorValue = ValueNotifier(Colors.black);
}

class WidgetShema extends StatefulWidget {
  const WidgetShema({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WidgetShema> createState() => _WidgetShemaState();
}

class _WidgetShemaState extends State<WidgetShema> {
  List<ShemaWord> shema = [];

  // This audioPlayer plays the wntire SHEMA
  // the global audioplayer is used to play a particular word.
  // this is in order to keep the order of playing words
  late AudioPlayer _audioPlayer;

  //IconData currentIcon = Icons.play_arrow;
  bool playPressed = false;
  bool pausePressed = false;

  late ConcatenatingAudioSource playlist;
  List<AudioSource> audios = [];


  @override
  void initState() {
    _audioPlayer = AudioPlayer();

    shema.add(ShemaWord(word: "שְׁמַע", file: "s00.mp3"));
    shema.add(ShemaWord(word: "יִשְׂרָאֵל", file: "s01.mp3"));
    shema.add(ShemaWord(word: "יהוה", file: "s02.mp3"));
    shema.add(ShemaWord(word: "אֱלֹהֵינוּ", file: "s03.mp3"));
    shema.add(ShemaWord(word: "יהוה", file: "s04.mp3"));
    shema.add(ShemaWord(word: ".אֶחָד", file: "s05ejad.mp3"));
    shema.add(ShemaWord(word: "בָּרוּךְ", file: "s06baruj.mp3"));
    shema.add(ShemaWord(word: "שֵׁם", file: "s07shem.mp3"));
    shema.add(ShemaWord(word: "כְּבוֹד", file: "s08kevod.mp3"));
    shema.add(ShemaWord(word: "מַלְכוּתוֹ", file: "s09.mp3"));
    shema.add(ShemaWord(word: "לְעוֹלָם", file: "s10.mp3"));
    shema.add(ShemaWord(word: ".וָעֶד", file: "s11.mp3"));
    shema.add(ShemaWord(word: "וְאָהַבְתָּ", file: "s13.mp3"));
    shema.add(ShemaWord(word: "אֵת", file: "s14.mp3"));
    shema.add(ShemaWord(word: "יהוה", file: "s15.mp3"));
    shema.add(ShemaWord(word: "אֱלֹהֶיךָ", file: "s16.mp3"));
    shema.add(ShemaWord(word: "בְּכָל", file: "s17.mp3"));
    shema.add(ShemaWord(word: "לְבָבְךָ", file: "s18.mp3"));
    shema.add(ShemaWord(word: "וּבְכָל", file: "s19.mp3"));
    shema.add(ShemaWord(word: "נַפְשְׁךָ", file: "s20.mp3"));
    shema.add(ShemaWord(word: "וּבְכָל", file: "s19.mp3"));
    shema.add(ShemaWord(word: ".מְאֹדֶךָ", file: "s22.mp3"));
    shema.add(ShemaWord(word: "וְהָיוּ", file: "s23.mp3"));
    shema.add(ShemaWord(word: "הַדְּבָרִים", file: "s24.mp3"));
    shema.add(ShemaWord(word: "הָאֵלֶּה", file: "s25.mp3"));
    shema.add(ShemaWord(word: "אֲשֶׁר", file: "s26.mp3"));
    shema.add(ShemaWord(word: "אָנֹכִי", file: "s27.mp3"));
    shema.add(ShemaWord(word: "מְצַוְּךָ", file: "s28.mp3"));
    shema.add(ShemaWord(word: "הַיּוֹם", file: "s29.mp3"));
    shema.add(ShemaWord(word: "עַל", file: "s30.mp3"));
    shema.add(ShemaWord(word: ".לְבָבֶךָ", file: "s31.mp3"));
    shema.add(ShemaWord(word: "וְשִׁנַּנְתָּם", file: "s32.mp3"));
    shema.add(ShemaWord(word: "לְבָנֶיךָ", file: "s33.mp3"));
    shema.add(ShemaWord(word: "וְדִבַּרְתָּ", file: "s34.mp3"));
    shema.add(ShemaWord(word: "בָּם", file: "s35.mp3"));
    shema.add(ShemaWord(word: "בְּשִׁבְתְּךָ", file: "s36.mp3"));
    shema.add(ShemaWord(word: "בְּבֵיתֶךָ", file: "s37.mp3"));
    shema.add(ShemaWord(word: "וּבְלֶכְתְּךָ", file: "s38.mp3"));
    shema.add(ShemaWord(word: "בַדֶּרֶךְ", file: "s39.mp3"));
    shema.add(ShemaWord(word: "וּבְשָׁכְבְּךָ", file: "s40.mp3"));
    shema.add(ShemaWord(word: ".וּבְקוּמֶךָ", file: "s41.mp3"));
    shema.add(ShemaWord(word: "וּקְשַׁרְתָּם", file: "s42.mp3"));
    shema.add(ShemaWord(word: "לְאוֹת", file: "s43.mp3"));
    shema.add(ShemaWord(word: "עַל", file: "s44.mp3"));
    shema.add(ShemaWord(word: "יָדֶךָ", file: "s45.mp3"));
    shema.add(ShemaWord(word: "וְהָיוּ", file: "s46.mp3"));
    shema.add(ShemaWord(word: "לְטֹטָפֹת", file: "s47.mp3"));
    shema.add(ShemaWord(word: "בֵּין", file: "s48.mp3"));
    shema.add(ShemaWord(word: ".עֵינֶיךָ", file: "s49.mp3"));
    shema.add(ShemaWord(word: "וּכְתַבְתָּם", file: "s50.mp3"));
    shema.add(ShemaWord(word: "עַל", file: "s51.mp3"));
    shema.add(ShemaWord(word: "מְזֻזוֹת", file: "s52.mp3"));
    shema.add(ShemaWord(word: "בֵּיתֶךָ", file: "s53.mp3"));
    shema.add(ShemaWord(word: ".וּבִשְׁעָרֶיךָ", file: "s54.mp3"));

    // prepare playlist
    for (int i = 0; i < shema.length; i++) {
      audios
          .add(AudioSource.uri(Uri.parse("asset:///audios/" + shema[i].file)));
    }

    super.initState();
  }


  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColor,
      appBar: buildAppBar(widget.title),
      body: Padding(
        padding: const EdgeInsets.all(globalInset),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildShemaText(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: getPlaybackButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }


  /*
   * This function returns the proper play/pause/stop buttons
   */
  Widget getPlaybackButtons() {
    if (!playPressed) {
      return SizedBox(
        height: 50,
        child: InkWell(
          child: const Card(
            elevation: 5.0,
            child: Icon(Icons.play_arrow),
          ),
          onTap: () {
            setState(() {
              playPressed = true;
              if (!pausePressed) {
                playShema();    // this will start playback from beginning
              } else {
                _audioPlayer.play();  // this will continue playback
              }
            });
          },
        ),
      );
    } else {

      return SizedBox(
        height: 50,
        child: InkWell(
          child: const Card(
            elevation: 5.0,
            child: Icon(Icons.pause),
          ),
          onTap: () {
            setState(() {
              pausePressed = true;
              playPressed = false;
              _audioPlayer.pause();
            });
          },
        ),
      );

    }
  }

  /*
   * This function builds the text of shem on screen
   */
  Widget buildShemaText() {
    List<Widget> wl = [];

    for (int i = 0; i < shema.length; i++) {
      wl.add(
        InkWell(
          child: ValueListenableBuilder(
              valueListenable: shema[i].colorValue,
              builder: (context, value, child) {
                return Text(shema[i].word,
                    style: TextStyle(
                        fontFamily: "SBL",
                        fontSize: 30,
                        color: value as Color,
                      shadows: value == Colors.red ? const [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black,
                      ) ] :
                      const [
                      Shadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        color: Colors.black,
                      )],

                    ));
              }),
          onTap: () {
            // play word using the global audioPlayer
            play(shema[i].file);
          },
        ),
      );
    }

    return Wrap(
        runAlignment: WrapAlignment.center,
        spacing: 5.0,
        textDirection: TextDirection.rtl,
        children: wl);
  }

  /*
   * This function plays the whole Shema and lights up the words being played
   */
  void playShema() async {
    int oldIndex = 0;

    // reload playlist
    playlist = ConcatenatingAudioSource(children: audios);
    _audioPlayer.setAudioSource(playlist);

    // Paint each word being played
    _audioPlayer.currentIndexStream.listen((newIndex) {
      shema[oldIndex].colorValue.value = Colors.black;
      shema[newIndex as int].colorValue.value = Colors.red;
      oldIndex = newIndex;
    });

    // reset player state after finishing playback
    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {

        // this is the last index
        if (oldIndex == shema.length-1) {
          setState(() {
            playPressed = false;
            pausePressed = false;
            shema[shema.length - 1].colorValue.value = Colors.black;
          });
        }
      }
    });

    // play whole SHEMA with the local audioplayer
    await _audioPlayer.play();

  }
}
