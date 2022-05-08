import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'globals.dart';

int colorIndex = 0;

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


class Ois {
  final String ois;
  late final String sound;

  Ois(this.ois, String sound) {
    this.sound = 'o' + sound + '.mp3';
  }
}

class OisProvider extends ChangeNotifier {
  final List<Ois> letters = [];
  List<Ois> workingLetters = [];
  late AudioPlayer audioPlayer;


  OisProvider() {

    // Initialize audio player
    audioPlayer = AudioPlayer();

    letters.add(Ois('א', "00"));
    letters.add(Ois('בּ', "01"));
    letters.add(Ois('ב', "02"));
    letters.add(Ois('ג', "03"));
    letters.add(Ois('ד', "04"));
    letters.add(Ois('ה', "05"));
    letters.add(Ois('ו', "06"));
    letters.add(Ois('ז', "07"));
    letters.add(Ois('ח', "08"));
    letters.add(Ois('ט', "09"));
    letters.add(Ois('י', "10"));
    letters.add(Ois('כּ', "11"));
    letters.add(Ois('כ', "12"));
    letters.add(Ois('ך', "13"));
    letters.add(Ois('ךּ', "32"));
    letters.add(Ois('ל', "14"));
    letters.add(Ois('מ', "15"));
    letters.add(Ois('ם', "16"));
    letters.add(Ois('נ', "17"));
    letters.add(Ois('ן', "18"));
    letters.add(Ois('ס', "19"));
    letters.add(Ois('ע', "20"));
    letters.add(Ois('פ', "21"));
    letters.add(Ois('פּ', "22"));
    letters.add(Ois('ף', "23"));
    letters.add(Ois('צ', "24"));
    letters.add(Ois('ץ', "25"));
    letters.add(Ois('ק', "26"));
    letters.add(Ois('ר', "27"));
    letters.add(Ois('שׁ', "28"));
    letters.add(Ois('שׂ', "29"));
    letters.add(Ois('תּ', "30"));
    letters.add(Ois('ת', "31"));

    workingLetters.addAll(letters);
  }

  List<Ois> get() {
    return workingLetters;
  }

  void shuffle() {
    workingLetters.shuffle();
    notifyListeners();
  }

  void arrange() {
    workingLetters.clear();
    workingLetters.addAll(letters);
    notifyListeners();
  }

  void play(Ois ois) async {
    await audioPlayer.setAsset("audios/" + ois.sound);
    await audioPlayer.play();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }


}

class Avara {
  final String avara;
  late final String sound;

  Avara(this.avara, String sound) {
    this.sound = 'a' + sound + "mp3";
  }
}

const nekudaKomatz = "00";
const nekudaPataj = "01";
const nekudaTzeire = "02";
const nekudaSegol = "03";
const nekudaShuruk = "07";
const nekudaJoilom = "05";
const nekudaJoilomMole = "09";
const nekudaJirik = "08";
const nekudaKubutz = "04";

enum Avaros {
  nekudaKomatz,
  nekudaPataj,
  nekudaTzeire,
  nekudaSegol,
  nekudaShuruk,
  nekudaKubutz,
  nekudaJoilom,
  nekudaJoilomMole,
  nekudaJirik,
}

class AvaraProvider extends ChangeNotifier {
  final List<Avara> komatz = [];
  final List<Avara> pataj = [];
  final List<Avara> tzeire = [];
  final List<Avara> segol = [];
  final List<Avara> shuruk = [];
  final List<Avara> kubutz = [];
  final List<Avara> joilom = [];
  final List<Avara> joilomMole = [];
  final List<Avara> jirik = [];

  List<Avara> workingAvara = [];


  void play(Ois ois, Nekuda nekuda) async {

    // build avara string
    String avara = "a" + nekuda.sound.substring(1, 3) + ois.sound.substring(1, 3);
    await audioPlayer.setAsset("audios/" + avara + ".mp3");
    await audioPlayer.play();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }


  List<Avara> get(Avaros avara) {
    switch (avara) {
      case Avaros.nekudaKomatz:
        workingAvara = komatz;
        break;

      case Avaros.nekudaJirik:
        workingAvara = jirik;
        break;

      case Avaros.nekudaJoilom:
        workingAvara = joilom;
        break;

      case Avaros.nekudaJoilomMole:
        workingAvara = joilomMole;
        break;

      case Avaros.nekudaKubutz:
        workingAvara = kubutz;
        break;

      case Avaros.nekudaPataj:
        workingAvara = pataj;
        break;

      case Avaros.nekudaTzeire:
        workingAvara = tzeire;
        break;

      case Avaros.nekudaSegol:
        workingAvara = segol;
        break;

      case Avaros.nekudaShuruk:
        workingAvara = shuruk;
        break;
    }

    return workingAvara;
  }

  void shuffle(Avaros avara) {
    switch (avara) {
      case Avaros.nekudaKomatz:
        workingAvara = komatz;
        break;
      case Avaros.nekudaJirik:
        workingAvara = jirik;
        break;

      case Avaros.nekudaJoilom:
        workingAvara = joilom;
        break;

      case Avaros.nekudaJoilomMole:
        workingAvara = joilomMole;
        break;

      case Avaros.nekudaKubutz:
        workingAvara = kubutz;
        break;

      case Avaros.nekudaPataj:
        workingAvara = pataj;
        break;

      case Avaros.nekudaTzeire:
        workingAvara = tzeire;
        break;

      case Avaros.nekudaSegol:
        workingAvara = segol;
        break;

      case Avaros.nekudaShuruk:
        workingAvara = shuruk;
        break;
    }

    workingAvara.shuffle();
    notifyListeners();
  }

  void arrange(Avaros avara) {
    switch (avara) {
      case Avaros.nekudaKomatz:
        workingAvara = komatz;
        break;
      case Avaros.nekudaJirik:
        workingAvara = jirik;
        break;

      case Avaros.nekudaJoilom:
        workingAvara = joilom;
        break;

      case Avaros.nekudaJoilomMole:
        workingAvara = joilomMole;
        break;

      case Avaros.nekudaKubutz:
        workingAvara = kubutz;
        break;

      case Avaros.nekudaPataj:
        workingAvara = pataj;
        break;

      case Avaros.nekudaTzeire:
        workingAvara = tzeire;
        break;

      case Avaros.nekudaSegol:
        workingAvara = segol;
        break;

      case Avaros.nekudaShuruk:
        workingAvara = shuruk;
        break;
    }

    notifyListeners();
  }

  AvaraProvider() {
    komatz.add(Avara('אָ', nekudaKomatz + "00"));
    komatz.add(Avara('בָּ', nekudaKomatz + "01"));
    komatz.add(Avara('בָ', nekudaKomatz + "02"));
    komatz.add(Avara('גָ', nekudaKomatz + "03"));
    komatz.add(Avara('דָ', nekudaKomatz + "04"));
    komatz.add(Avara('הָ', nekudaKomatz + "05"));
    komatz.add(Avara('וָ', nekudaKomatz + "06"));
    komatz.add(Avara('זָ', nekudaKomatz + "07"));
    komatz.add(Avara('חָ', nekudaKomatz + "08"));
    komatz.add(Avara('טָ', nekudaKomatz + "09"));
    komatz.add(Avara('יָ', nekudaKomatz + "10"));
    komatz.add(Avara('כָּ', nekudaKomatz + "11"));
    komatz.add(Avara('כָ', nekudaKomatz + "12"));
    komatz.add(Avara('ךָ', nekudaKomatz + "13"));
    komatz.add(Avara('ךָּ', nekudaKomatz + "32"));
    komatz.add(Avara('לָ', nekudaKomatz + "14"));
    komatz.add(Avara('מָ', nekudaKomatz + "15"));
    komatz.add(Avara('ם', nekudaKomatz + "16"));
    komatz.add(Avara('נָ', nekudaKomatz + "17"));
    komatz.add(Avara('ן', nekudaKomatz + "18"));
    komatz.add(Avara('סָ', nekudaKomatz + "19"));
    komatz.add(Avara('עָ', nekudaKomatz + "20"));
    komatz.add(Avara('פָ', nekudaKomatz + "21"));
    komatz.add(Avara('פָּ', nekudaKomatz + "22"));
    komatz.add(Avara('ף', nekudaKomatz + "23"));
    komatz.add(Avara('צָ', nekudaKomatz + "24"));
    komatz.add(Avara('ץ', nekudaKomatz + "25"));
    komatz.add(Avara('קָ', nekudaKomatz + "26"));
    komatz.add(Avara('רָ', nekudaKomatz + "27"));
    komatz.add(Avara('שָׁ', nekudaKomatz + "28"));
    komatz.add(Avara('שָׂ', nekudaKomatz + "29"));
    komatz.add(Avara('תָ', nekudaKomatz + "31"));
    komatz.add(Avara('תָּ', nekudaKomatz + "30"));

    pataj.add(Avara('אַ', nekudaPataj + "00"));
    pataj.add(Avara('בַּ', nekudaPataj + "01"));
    pataj.add(Avara('בַ', nekudaPataj + "02"));
    pataj.add(Avara('גַ', nekudaPataj + "03"));
    pataj.add(Avara('דַ', nekudaPataj + "04"));
    pataj.add(Avara('הַ', nekudaPataj + "05"));
    pataj.add(Avara('וַ', nekudaPataj + "06"));
    pataj.add(Avara('זַ', nekudaPataj + "07"));
    pataj.add(Avara('חַ', nekudaPataj + "08"));
    pataj.add(Avara('טַ', nekudaPataj + "09"));
    pataj.add(Avara('יַ', nekudaPataj + "10"));
    pataj.add(Avara('כַּ', nekudaPataj + "11"));
    pataj.add(Avara('כַ', nekudaPataj + "12"));
    pataj.add(Avara('ך', nekudaPataj + "13"));
    pataj.add(Avara('ךּ', nekudaPataj + "32"));
    pataj.add(Avara('לַ', nekudaPataj + "14"));
    pataj.add(Avara('מַ', nekudaPataj + "15"));
    pataj.add(Avara('ם', nekudaPataj + "16"));
    pataj.add(Avara('נַ', nekudaPataj + "17"));
    pataj.add(Avara('ןַ', nekudaPataj + "18"));
    pataj.add(Avara('סַ', nekudaPataj + "19"));
    pataj.add(Avara('עַ', nekudaPataj + "20"));
    pataj.add(Avara('פַ', nekudaPataj + "21"));
    pataj.add(Avara('פַּ', nekudaPataj + "22"));
    pataj.add(Avara('ף', nekudaPataj + "23"));
    pataj.add(Avara('צַ', nekudaPataj + "24"));
    pataj.add(Avara('ץ', nekudaPataj + "25"));
    pataj.add(Avara('קַ', nekudaPataj + "26"));
    pataj.add(Avara('רַ', nekudaPataj + "27"));
    pataj.add(Avara('שַׁ', nekudaPataj + "28"));
    pataj.add(Avara('שַׂ', nekudaPataj + "29"));
    pataj.add(Avara('תַ', nekudaPataj + "31"));
    pataj.add(Avara('תַּ', nekudaPataj + "30"));

    segol.add(Avara('אֶ', nekudaSegol + "00"));
    segol.add(Avara('בֶּ', nekudaSegol + "01"));
    segol.add(Avara('בֶ', nekudaSegol + "02"));
    segol.add(Avara('גֶ', nekudaSegol + "03"));
    segol.add(Avara('דֶ', nekudaSegol + "04"));
    segol.add(Avara('הֶ', nekudaSegol + "05"));
    segol.add(Avara('וֶ', nekudaSegol + "06"));
    segol.add(Avara('זֶ', nekudaSegol + "07"));
    segol.add(Avara('חֶ', nekudaSegol + "08"));
    segol.add(Avara('טֶ', nekudaSegol + "09"));
    segol.add(Avara('יֶ', nekudaSegol + "10"));
    segol.add(Avara('כֶּ', nekudaSegol + "11"));
    segol.add(Avara('כֶ', nekudaSegol + "12"));
    segol.add(Avara('ך', nekudaSegol + "13"));
    segol.add(Avara('ךּ', nekudaSegol + "32"));
    segol.add(Avara('לֶ', nekudaSegol + "14"));
    segol.add(Avara('מֶ', nekudaSegol + "15"));
    segol.add(Avara('ם', nekudaSegol + "16"));
    segol.add(Avara('נֶ', nekudaSegol + "17"));
    segol.add(Avara('ן', nekudaSegol + "18"));
    segol.add(Avara('סֶ', nekudaSegol + "19"));
    segol.add(Avara('עֶ', nekudaSegol + "20"));
    segol.add(Avara('פֶ', nekudaSegol + "21"));
    segol.add(Avara('פֶּ', nekudaSegol + "22"));
    segol.add(Avara('ף', nekudaSegol + "23"));
    segol.add(Avara('צֶ', nekudaSegol + "24"));
    segol.add(Avara('ץ', nekudaSegol + "25"));
    segol.add(Avara('קֶ', nekudaSegol + "26"));
    segol.add(Avara('רֶ', nekudaSegol + "27"));
    segol.add(Avara('שֶׁ', nekudaSegol + "28"));
    segol.add(Avara('שֶׂ', nekudaSegol + "29"));
    segol.add(Avara('תֶ', nekudaSegol + "31"));
    segol.add(Avara('תֶּ', nekudaSegol + "30"));

    tzeire.add(Avara('אֵ', nekudaTzeire + "00"));
    tzeire.add(Avara('בֵּ', nekudaTzeire + "01"));
    tzeire.add(Avara('בֵ', nekudaTzeire + "02"));
    tzeire.add(Avara('גֵ', nekudaTzeire + "03"));
    tzeire.add(Avara('דֵ', nekudaTzeire + "04"));
    tzeire.add(Avara('הֵ', nekudaTzeire + "05"));
    tzeire.add(Avara('וֵ', nekudaTzeire + "06"));
    tzeire.add(Avara('זֵ', nekudaTzeire + "07"));
    tzeire.add(Avara('חֵ', nekudaTzeire + "08"));
    tzeire.add(Avara('טֵ', nekudaTzeire + "09"));
    tzeire.add(Avara('יֵ', nekudaTzeire + "10"));
    tzeire.add(Avara('כֵּ', nekudaTzeire + "11"));
    tzeire.add(Avara('כֵ', nekudaTzeire + "12"));
    tzeire.add(Avara('ך', nekudaTzeire + "13"));
    tzeire.add(Avara('ךּ', nekudaTzeire + "32"));
    tzeire.add(Avara('לֵ', nekudaTzeire + "14"));
    tzeire.add(Avara('מֵ', nekudaTzeire + "15"));
    tzeire.add(Avara('ם', nekudaTzeire + "16"));
    tzeire.add(Avara('נֵ', nekudaTzeire + "17"));
    tzeire.add(Avara('ן', nekudaTzeire + "18"));
    tzeire.add(Avara('סֵ', nekudaTzeire + "19"));
    tzeire.add(Avara('עֵ', nekudaTzeire + "20"));
    tzeire.add(Avara('פֵ', nekudaTzeire + "21"));
    tzeire.add(Avara('פֵּ', nekudaTzeire + "22"));
    tzeire.add(Avara('ף', nekudaTzeire + "23"));
    tzeire.add(Avara('צֵ', nekudaTzeire + "24"));
    tzeire.add(Avara('ץ', nekudaTzeire + "25"));
    tzeire.add(Avara('קֵ', nekudaTzeire + "26"));
    tzeire.add(Avara('רֵ', nekudaTzeire + "27"));
    tzeire.add(Avara('שֵׁ', nekudaTzeire + "28"));
    tzeire.add(Avara('שֵׂ', nekudaTzeire + "29"));
    tzeire.add(Avara('תֵ', nekudaTzeire + "31"));
    tzeire.add(Avara('תֵּ', nekudaTzeire + "30"));

    shuruk.add(Avara('אוּ', nekudaShuruk + "00"));
    shuruk.add(Avara('בּוּ', nekudaShuruk + "01"));
    shuruk.add(Avara('בוּ', nekudaShuruk + "02"));
    shuruk.add(Avara('גוּ', nekudaShuruk + "03"));
    shuruk.add(Avara('דוּ', nekudaShuruk + "04"));
    shuruk.add(Avara('הוּ', nekudaShuruk + "05"));
    shuruk.add(Avara('וּ', nekudaShuruk + "06"));
    shuruk.add(Avara('זוּ', nekudaShuruk + "07"));
    shuruk.add(Avara('חוּ', nekudaShuruk + "08"));
    shuruk.add(Avara('טוּ', nekudaShuruk + "09"));
    shuruk.add(Avara('יוּ', nekudaShuruk + "10"));
    shuruk.add(Avara('כּוּ', nekudaShuruk + "11"));
    shuruk.add(Avara('כוּ', nekudaShuruk + "12"));
    shuruk.add(Avara('ך', nekudaShuruk + "13"));
    shuruk.add(Avara('ךּ', nekudaShuruk + "32"));
    shuruk.add(Avara('לוּ', nekudaShuruk + "14"));
    shuruk.add(Avara('מוּ', nekudaShuruk + "15"));
    shuruk.add(Avara('ם', nekudaShuruk + "16"));
    shuruk.add(Avara('נוּ', nekudaShuruk + "17"));
    shuruk.add(Avara('ן', nekudaShuruk + "18"));
    shuruk.add(Avara('סוּ', nekudaShuruk + "19"));
    shuruk.add(Avara('עוּ', nekudaShuruk + "20"));
    shuruk.add(Avara('פוּ', nekudaShuruk + "21"));
    shuruk.add(Avara('פּוּ', nekudaShuruk + "22"));
    shuruk.add(Avara('ף', nekudaShuruk + "23"));
    shuruk.add(Avara('צוּ', nekudaShuruk + "24"));
    shuruk.add(Avara('ץ', nekudaShuruk + "25"));
    shuruk.add(Avara('קוּ', nekudaShuruk + "26"));
    shuruk.add(Avara('רוּ', nekudaShuruk + "27"));
    shuruk.add(Avara('שׁוּ', nekudaShuruk + "28"));
    shuruk.add(Avara('שׂוּ', nekudaShuruk + "29"));
    shuruk.add(Avara('תוּ', nekudaShuruk + "31"));
    shuruk.add(Avara('תּוּ', nekudaShuruk + "30"));

    kubutz.add(Avara('אֻ', nekudaKubutz + "00"));
    kubutz.add(Avara('בֻּ', nekudaKubutz + "01"));
    kubutz.add(Avara('בֻ', nekudaKubutz + "02"));
    kubutz.add(Avara('גֻ', nekudaKubutz + "03"));
    kubutz.add(Avara('דֻ', nekudaKubutz + "04"));
    kubutz.add(Avara('הֻ', nekudaKubutz + "05"));
    kubutz.add(Avara('וֻ', nekudaKubutz + "06"));
    kubutz.add(Avara('זֻ', nekudaKubutz + "07"));
    kubutz.add(Avara('חֻ', nekudaKubutz + "08"));
    kubutz.add(Avara('טֻ', nekudaKubutz + "09"));
    kubutz.add(Avara('יֻ', nekudaKubutz + "10"));
    kubutz.add(Avara('כֻּ', nekudaKubutz + "11"));
    kubutz.add(Avara('כֻ', nekudaKubutz + "12"));
    kubutz.add(Avara('ך', nekudaKubutz + "13"));
    kubutz.add(Avara('ךּ', nekudaKubutz + "32"));
    kubutz.add(Avara('לֻ', nekudaKubutz + "14"));
    kubutz.add(Avara('מֻ', nekudaKubutz + "15"));
    kubutz.add(Avara('ם', nekudaKubutz + "16"));
    kubutz.add(Avara('נֻ', nekudaKubutz + "17"));
    kubutz.add(Avara('ן', nekudaKubutz + "18"));
    kubutz.add(Avara('סֻ', nekudaKubutz + "19"));
    kubutz.add(Avara('עֻ', nekudaKubutz + "20"));
    kubutz.add(Avara('פֻ', nekudaKubutz + "21"));
    kubutz.add(Avara('פֻּ', nekudaKubutz + "22"));
    kubutz.add(Avara('ף', nekudaKubutz + "23"));
    kubutz.add(Avara('צֻ', nekudaKubutz + "24"));
    kubutz.add(Avara('ץ', nekudaKubutz + "25"));
    kubutz.add(Avara('קֻ', nekudaKubutz + "26"));
    kubutz.add(Avara('רֻ', nekudaKubutz + "27"));
    kubutz.add(Avara('שֻׁ', nekudaKubutz + "28"));
    kubutz.add(Avara('שֻׂ', nekudaKubutz + "29"));
    kubutz.add(Avara('תֻ', nekudaKubutz + "31"));
    kubutz.add(Avara('תֻּ', nekudaKubutz + "30"));

    joilom.add(Avara('אֹ', nekudaJoilom + "00"));
    joilom.add(Avara('בֹּ', nekudaJoilom + "01"));
    joilom.add(Avara('בֹ', nekudaJoilom + "02"));
    joilom.add(Avara('גֹ', nekudaJoilom + "03"));
    joilom.add(Avara('דֹ', nekudaJoilom + "04"));
    joilom.add(Avara('הֹ', nekudaJoilom + "05"));
    joilom.add(Avara('וֹ', nekudaJoilom + "06"));
    joilom.add(Avara('זֹ', nekudaJoilom + "07"));
    joilom.add(Avara('חֹ', nekudaJoilom + "08"));
    joilom.add(Avara('טֹ', nekudaJoilom + "09"));
    joilom.add(Avara('יֹ', nekudaJoilom + "10"));
    joilom.add(Avara('כֹּ', nekudaJoilom + "11"));
    joilom.add(Avara('כֹ', nekudaJoilom + "12"));
    joilom.add(Avara('ך', nekudaJoilom + "13"));
    joilom.add(Avara('ךּ', nekudaJoilom + "32"));
    joilom.add(Avara('לֹ', nekudaJoilom + "14"));
    joilom.add(Avara('מֹ', nekudaJoilom + "15"));
    joilom.add(Avara('ם', nekudaJoilom + "16"));
    joilom.add(Avara('נֹ', nekudaJoilom + "17"));
    joilom.add(Avara('ן', nekudaJoilom + "18"));
    joilom.add(Avara('סֹ', nekudaJoilom + "19"));
    joilom.add(Avara('עֹ', nekudaJoilom + "20"));
    joilom.add(Avara('פֹ', nekudaJoilom + "21"));
    joilom.add(Avara('פֹּ', nekudaJoilom + "22"));
    joilom.add(Avara('ף', nekudaJoilom + "23"));
    joilom.add(Avara('צֹ', nekudaJoilom + "24"));
    joilom.add(Avara('ץ', nekudaJoilom + "25"));
    joilom.add(Avara('קֹ', nekudaJoilom + "26"));
    joilom.add(Avara('רֹ', nekudaJoilom + "27"));
    joilom.add(Avara('שֹׁ', nekudaJoilom + "28"));
    joilom.add(Avara('שֹׂ', nekudaJoilom + "29"));
    joilom.add(Avara('תֹ', nekudaJoilom + "31"));
    joilom.add(Avara('תֹּ', nekudaJoilom + "30"));

    joilomMole.add(Avara('אוֹ', nekudaJoilomMole + "00"));
    joilomMole.add(Avara('בּוֹ', nekudaJoilomMole + "01"));
    joilomMole.add(Avara('בוֹ', nekudaJoilomMole + "02"));
    joilomMole.add(Avara('גוֹ', nekudaJoilomMole + "03"));
    joilomMole.add(Avara('דוֹ', nekudaJoilomMole + "04"));
    joilomMole.add(Avara('הוֹ', nekudaJoilomMole + "05"));
    joilomMole.add(Avara('וֹ', nekudaJoilomMole + "06"));
    joilomMole.add(Avara('זוֹ', nekudaJoilomMole + "07"));
    joilomMole.add(Avara('חוֹ', nekudaJoilomMole + "08"));
    joilomMole.add(Avara('טוֹ', nekudaJoilomMole + "09"));
    joilomMole.add(Avara('יוֹ', nekudaJoilomMole + "10"));
    joilomMole.add(Avara('כּוֹ', nekudaJoilomMole + "11"));
    joilomMole.add(Avara('כוֹ', nekudaJoilomMole + "12"));
    joilomMole.add(Avara('ך', nekudaJoilomMole + "13"));
    joilomMole.add(Avara('ךּ', nekudaJoilomMole + "32"));
    joilomMole.add(Avara('לוֹ', nekudaJoilomMole + "14"));
    joilomMole.add(Avara('מוֹ', nekudaJoilomMole + "15"));
    joilomMole.add(Avara('ם', nekudaJoilomMole + "16"));
    joilomMole.add(Avara('נוֹ', nekudaJoilomMole + "17"));
    joilomMole.add(Avara('ן', nekudaJoilomMole + "18"));
    joilomMole.add(Avara('סוֹ', nekudaJoilomMole + "19"));
    joilomMole.add(Avara('עוֹ', nekudaJoilomMole + "20"));
    joilomMole.add(Avara('פוֹ', nekudaJoilomMole + "21"));
    joilomMole.add(Avara('פּוֹ', nekudaJoilomMole + "22"));
    joilomMole.add(Avara('ף', nekudaJoilomMole + "23"));
    joilomMole.add(Avara('צוֹ', nekudaJoilomMole + "24"));
    joilomMole.add(Avara('ץ', nekudaJoilomMole + "25"));
    joilomMole.add(Avara('קוֹ', nekudaJoilomMole + "26"));
    joilomMole.add(Avara('רוֹ', nekudaJoilomMole + "27"));
    joilomMole.add(Avara('שׁוֹ', nekudaJoilomMole + "28"));
    joilomMole.add(Avara('שׂוֹ', nekudaJoilomMole + "29"));
    joilomMole.add(Avara('תוֹ', nekudaJoilomMole + "31"));
    joilomMole.add(Avara('תּוֹ', nekudaJoilomMole + "30"));

    jirik.add(Avara('אִ', nekudaJirik + "00"));
    jirik.add(Avara('בִּ', nekudaJirik + "01"));
    jirik.add(Avara('בִ', nekudaJirik + "02"));
    jirik.add(Avara('גִ', nekudaJirik + "03"));
    jirik.add(Avara('דִ', nekudaJirik + "04"));
    jirik.add(Avara('הִ', nekudaJirik + "05"));
    jirik.add(Avara('וִ', nekudaJirik + "06"));
    jirik.add(Avara('זִ', nekudaJirik + "07"));
    jirik.add(Avara('חִ', nekudaJirik + "08"));
    jirik.add(Avara('טִ', nekudaJirik + "09"));
    jirik.add(Avara('יִ', nekudaJirik + "10"));
    jirik.add(Avara('כִּ', nekudaJirik + "11"));
    jirik.add(Avara('כִ', nekudaJirik + "12"));
    jirik.add(Avara('ך', nekudaJirik + "13"));
    jirik.add(Avara('ךּ', nekudaJirik + "32"));
    jirik.add(Avara('לִ', nekudaJirik + "14"));
    jirik.add(Avara('מִ', nekudaJirik + "15"));
    jirik.add(Avara('ם', nekudaJirik + "16"));
    jirik.add(Avara('נִ', nekudaJirik + "17"));
    jirik.add(Avara('ן', nekudaJirik + "18"));
    jirik.add(Avara('סִ', nekudaJirik + "19"));
    jirik.add(Avara('עִ', nekudaJirik + "20"));
    jirik.add(Avara('פִ', nekudaJirik + "21"));
    jirik.add(Avara('פִּ', nekudaJirik + "22"));
    jirik.add(Avara('ף', nekudaJirik + "23"));
    jirik.add(Avara('צִ', nekudaJirik + "24"));
    jirik.add(Avara('ץ', nekudaJirik + "25"));
    jirik.add(Avara('קִ', nekudaJirik + "26"));
    jirik.add(Avara('רִ', nekudaJirik + "27"));
    jirik.add(Avara('שִׁ', nekudaJirik + "28"));
    jirik.add(Avara('שִׂ', nekudaJirik + "29"));
    jirik.add(Avara('תִ', nekudaJirik + "31"));
    jirik.add(Avara('תִּ', nekudaJirik + "30"));

    workingAvara.addAll(komatz);
  }
}



class Nekuda {
  final String nekuda;
  late String sound;

  Nekuda(this.nekuda, this.sound) {
    sound = 'n' + sound + '.mp3';
  }
}


class NekudaProvider extends ChangeNotifier {
  final List<Nekuda> nekudos = [];
  List<Nekuda> workingNekudos = [];
  late AudioPlayer audioPlayer;


  NekudaProvider() {

    // Initialize audio player
    audioPlayer = AudioPlayer();

    nekudos.add(Nekuda('ָ ', "00")); // komatz
    nekudos.add(Nekuda('ַ ', "01")); // pataj
    nekudos.add(Nekuda('ֵ ', "02")); // tzeire
    nekudos.add(Nekuda('ֶ ', "03")); // segol
    nekudos.add(Nekuda('ֻ ', "04")); // shuruk
    nekudos.add(Nekuda('ֹ ', "05")); // joilom
    nekudos.add(Nekuda('ִ ', "06")); // jirik
    nekudos.add(Nekuda("וּ", "07")); // kubutz
    nekudos.add(Nekuda('ְ ', "08")); // shvo
    nekudos.add(Nekuda('ֹו', "09")); // Joilom Molei

    workingNekudos.addAll(nekudos);

  }


  void play(Nekuda nekuda) async {
    await audioPlayer.setAsset("audios/" + nekuda.sound);
    await audioPlayer.play();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  List<Nekuda> get() {
    return workingNekudos;
  }


  void shuffle() {
    workingNekudos.shuffle();
    notifyListeners();
  }

  void arrange() {
    workingNekudos.clear();
    workingNekudos.addAll(nekudos);
    notifyListeners();
  }

}







class WidgetLettersNekudos extends StatefulWidget {
  const WidgetLettersNekudos({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WidgetLettersNekudos> createState() => _WidgetLettersNekudosState();
}

class _WidgetLettersNekudosState extends State<WidgetLettersNekudos> {
  
  
  @override
  Widget build(BuildContext context) {

    OisProvider _oisProvider = Provider.of<OisProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: globalColor,
      appBar: buildAppBar(widget.title),
      body: Consumer<OisProvider>(builder: (context, oisProvider, child) {
        List _list = oisProvider.get();

        List<Widget> wl = [];
        for (int i = 0; i < _list.length; i++) {
          wl.add(buildOis(oisProvider, _list[i]));
        }

        return Center(
            child: Wrap(
              textDirection: TextDirection.rtl,
              alignment: WrapAlignment.center,
              children: wl,
          ),
        );
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                _oisProvider.shuffle();
              },
              heroTag: 0,
              child: const Icon(Icons.shuffle)),
          const SizedBox(width: 10),
          FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                _oisProvider.arrange();
              },
              heroTag: 1,
              child: const Icon(Icons.straight)),
        ],
      ),
    );
  }



  Widget buildOis(OisProvider oisProvider, Ois ois) {
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
        oisProvider.play(ois);
      },
      child: Text(ois.ois,
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
}



class WidgetNekudos extends StatefulWidget {
  const WidgetNekudos({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WidgetNekudos> createState() => _WidgetNekudosState();
}

class _WidgetNekudosState extends State<WidgetNekudos> {
  @override
  Widget build(BuildContext context) {
    NekudaProvider _nekudaProvider = Provider.of<NekudaProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: globalColor,
      appBar: buildAppBar(widget.title),
      body: Consumer<NekudaProvider>(builder: (context, nekudaProvider, child) {
        List _list = nekudaProvider.get();

        List<Widget> wl = [];
        for (int i = 0; i < _list.length; i++) {
          wl.add(buildNekuda(nekudaProvider, _list[i]));
        }

        return Center(
          child: Wrap(
            textDirection: TextDirection.rtl,
            alignment: WrapAlignment.center,
            children: wl,
          ),
        );
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                _nekudaProvider.shuffle();
              },
              heroTag: 0,
              child: const Icon(Icons.shuffle)),
          const SizedBox(width: 10),
          FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                _nekudaProvider.arrange();
              },
              heroTag: 1,
              child: const Icon(Icons.straight)),
        ],
      ),
    );
  }
  

  Widget buildNekuda(NekudaProvider nekudaProvider, Nekuda nekuda) {
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
        nekudaProvider.play(nekuda);
      },
      child: Text(nekuda.nekuda,
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
}




class WidgetAvaros extends StatefulWidget {
  const WidgetAvaros({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WidgetAvaros> createState() => _WidgetAvarosState();
}

class _WidgetAvarosState extends State<WidgetAvaros> {
  late Nekuda nekudaPressed;
  bool wasNekudaPressed = false;
  late OisProvider _oisProvider;
  late NekudaProvider _nekudaProvider;
  late AvaraProvider _avaraProvider;

  @override
  void initState() {
    _oisProvider = Provider.of<OisProvider>(context, listen: false);
    _nekudaProvider = Provider.of<NekudaProvider>(context, listen: false);
    _avaraProvider = Provider.of<AvaraProvider>(context, listen: false);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: globalColor,
        appBar: buildAppBar(widget.title),
        body: buildAvaros(),
      );
    }



    Widget buildAvaros() {

      List<Ois> letters = _oisProvider.get();
      List<Nekuda> nekudos = _nekudaProvider.get();
      List<Widget> wl1 = [];
      List<Widget> wl2 = [];


      // change the colors of the letters
      colorIndex++;
      if (colorIndex >= letterColors.length) {
        colorIndex = 0;
      }

      for (int i = 0; i < letters.length; i++) {
        wl1.add(TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () async {

            if (!wasNekudaPressed) {
              _oisProvider.play(letters[i]);
              await Future.delayed(const Duration(seconds: 1));
            } else {
              _avaraProvider.play(letters[i], nekudaPressed);
              wasNekudaPressed = false;
            }
          },
          child: Text(letters[i].ois,
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
        ));

        colorIndex++;
        if (colorIndex >= letterColors.length) {
          colorIndex = 0;
        }
      }



      for (int i = 0; i < nekudos.length; i++) {
        wl2.add(TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () async {
            _nekudaProvider.play(nekudos[i]);
            nekudaPressed = nekudos[i];
            wasNekudaPressed = true;
          },
          child: Text(nekudos[i].nekuda,
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
        ));

        colorIndex++;
        if (colorIndex >= letterColors.length) {
          colorIndex = 0;
        }
      }


      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
      textDirection: TextDirection.rtl,
        alignment: WrapAlignment.center,
        children: wl1,
      ),
            const SizedBox(height: 10,),
            Wrap(
              textDirection: TextDirection.rtl,
              alignment: WrapAlignment.center,
              children: wl2,
            ),
          ]);

  }
}
