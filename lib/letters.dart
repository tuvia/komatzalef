import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'globals.dart';



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
  List<Ois> selectedLetters = [];
  List<Ois> workingSelected = [];



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
    letters.add(Ois('פּ', "21"));
    letters.add(Ois('פ', "22"));
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

  void select(Ois ois) {
    selectedLetters.add(ois);
    notifyListeners();
  }

  void unselect(Ois ois) {
    selectedLetters.removeWhere((element) => element.ois == ois.ois);
    notifyListeners();
  }

  void unselectAll({bool notify = true}) {
    selectedLetters.clear();
    if (notify) {
      notifyListeners();
    }
  }

  int getSelectedCount() {
    return selectedLetters.length;
  }


  List<Ois> getSelected(int count) {

    workingSelected.clear();

      // multiply the letters to show
      for (int x = 0; x < selectedLetters.length; x++) {
        for (int i = 0; i < count; i++) {
          workingSelected.add(selectedLetters[x]);
        }
      }
      workingSelected.shuffle();

      return workingSelected;
  }

  bool isSelected(Ois ois) {
    return selectedLetters.indexWhere((element) => element.ois == ois.ois) != -1 ? true : false;
  }

  void shuffleSelected() {
    workingSelected.shuffle();
    notifyListeners();
  }


  List<Ois> get() {
    return workingLetters;
  }

  void shuffle() {
    workingLetters.shuffle();
    notifyListeners();
  }

  void arrange({bool notify = true}) {
    workingLetters.clear();
    workingLetters.addAll(letters);
    if (notify) {
      notifyListeners();
    }
  }

  void play(Ois ois) async {
    await audioPlayer.setAsset("audios/" + ois.sound);
    await audioPlayer.play();
  }

  bool isEnde(Ois ois) {
    switch (ois.ois) {
      case "ך":
      case "ךּ":
      case "ץ":
      case "ף":
      case "ם":
      case "ן":
        return true;
    }

    return false;
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
    this.sound = 'a' + sound + ".mp3";
  }
}

const nekudaKomatz = "00";
const nekudaPataj = "01";
const nekudaTzeire = "02";
const nekudaSegol = "03";
const nekudaShuruk = "07";
const nekudaJoilom = "05";
const nekudaJoilomMole = "09";
const nekudaJirik = "06";
const nekudaKubutz = "04";
const nekudaShevo = "08";


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
  nekudaShevo
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
  final List<Avara> shevo = [];

  List<Avara> workingAvara = [];
  List<Avara> selectedLetters = [];
  List<Avara> workingSelected = [];





  void select(Avara avara) {
    selectedLetters.add(avara);
    notifyListeners();
  }

  void unselect(Avara avara) {
    selectedLetters.removeWhere((element) => element.avara == avara.avara);
    notifyListeners();
  }

  void unselectAll() {
    selectedLetters.clear();
    notifyListeners();
  }

  int getSelectedCount() {
    return selectedLetters.length;
  }


  List<Avara> getSelected(int count) {

    workingSelected.clear();

    // multiply the letters to show
    for (int x = 0; x < selectedLetters.length; x++) {
      for (int i = 0; i < count; i++) {
        workingSelected.add(selectedLetters[x]);
      }
    }
    workingSelected.shuffle();

    return workingSelected;
  }

  bool isSelected(Avara avara) {
    return selectedLetters.indexWhere((element) => element.avara == avara.avara) != -1 ? true : false;
  }

  void shuffleSelected() {
    workingSelected.shuffle();
    notifyListeners();
  }


  void playSound(Avara avara) async {
    await audioPlayer.setAsset("audios/" + avara.sound);
    await audioPlayer.play();
  }


  void play(Ois ois, Nekuda nekuda) async {

    // build avara string
    String n = nekuda.sound.substring(1, 3);

    // kubutz and shuruk, joilom molei and joilom sound the same!!
    if (n == "09") {
      n = "05";
    } else if (n == "04") {
      n = "07";
    }

    String avara = "a" + n + ois.sound.substring(1, 3);
    await audioPlayer.setAsset("audios/" + avara + ".mp3");
    await audioPlayer.play();
  }



  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }




  List<Avara> get(Avaros avara) {
    workingAvara.clear();

    switch (avara) {
      case Avaros.nekudaKomatz:
        workingAvara.addAll( komatz);
        break;
      case Avaros.nekudaJirik:
        workingAvara.addAll( jirik);
        break;
      case Avaros.nekudaJoilom:
        workingAvara.addAll( joilom);
        break;
      case Avaros.nekudaJoilomMole:
        workingAvara.addAll( joilomMole);
        break;
      case Avaros.nekudaKubutz:
        workingAvara.addAll( kubutz);
        break;
      case Avaros.nekudaPataj:
        workingAvara.addAll( pataj);
        break;
      case Avaros.nekudaTzeire:
        workingAvara.addAll( tzeire);
        break;
      case Avaros.nekudaSegol:
        workingAvara.addAll( segol);
        break;
      case Avaros.nekudaShuruk:
        workingAvara.addAll(shuruk);
        break;
      case Avaros.nekudaShevo:
        workingAvara.addAll(shevo);
        break;
    }

    return workingAvara;
  }



  void shuffle(Avaros avara) {
    workingAvara.clear();

    switch (avara) {
      case Avaros.nekudaKomatz:
        workingAvara.addAll(komatz);
        break;
      case Avaros.nekudaJirik:
        workingAvara.addAll(jirik);
        break;

      case Avaros.nekudaJoilom:
        workingAvara.addAll(joilom);
        break;

      case Avaros.nekudaJoilomMole:
        workingAvara.addAll(joilomMole);
        break;

      case Avaros.nekudaKubutz:
        workingAvara.addAll(kubutz);
        break;

      case Avaros.nekudaPataj:
        workingAvara.addAll(pataj);
        break;

      case Avaros.nekudaTzeire:
        workingAvara.addAll(tzeire);
        break;

      case Avaros.nekudaSegol:
        workingAvara.addAll(segol);
        break;

      case Avaros.nekudaShuruk:
        workingAvara.addAll(shuruk);
        break;
      case Avaros.nekudaShevo:
        workingAvara.addAll(shevo);
        break;
    }

    workingAvara.shuffle();
    notifyListeners();
  }


  void arrange(Avaros avara) {
    workingAvara.clear();

    switch (avara) {
      case Avaros.nekudaKomatz:
        workingAvara.addAll(komatz);
        break;
      case Avaros.nekudaJirik:
        workingAvara.addAll(jirik);
        break;

      case Avaros.nekudaJoilom:
        workingAvara.addAll(joilom);
        break;

      case Avaros.nekudaJoilomMole:
        workingAvara.addAll(joilomMole);
        break;

      case Avaros.nekudaKubutz:
        workingAvara.addAll(kubutz);
        break;

      case Avaros.nekudaPataj:
        workingAvara.addAll(pataj);
        break;

      case Avaros.nekudaTzeire:
        workingAvara.addAll(tzeire);
        break;

      case Avaros.nekudaSegol:
        workingAvara.addAll(segol);
        break;

      case Avaros.nekudaShuruk:
        workingAvara.addAll(shuruk);
        break;
      case Avaros.nekudaShevo:
        workingAvara.addAll(shevo);
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
    komatz.add(Avara('נָ', nekudaKomatz + "17"));
    komatz.add(Avara('ןָ', nekudaKomatz + "17"));
    komatz.add(Avara('סָ', nekudaKomatz + "19"));
    komatz.add(Avara('עָ', nekudaKomatz + "20"));
    komatz.add(Avara('פָּ', nekudaKomatz + "21"));
    komatz.add(Avara('פָ', nekudaKomatz + "22"));
    komatz.add(Avara('צָ', nekudaKomatz + "24"));
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
    pataj.add(Avara('לַ', nekudaPataj + "14"));
    pataj.add(Avara('מַ', nekudaPataj + "15"));
    pataj.add(Avara('נַ', nekudaPataj + "17"));
    pataj.add(Avara('ןַ', nekudaPataj + "17"));
    pataj.add(Avara('סַ', nekudaPataj + "19"));
    pataj.add(Avara('עַ', nekudaPataj + "20"));
    pataj.add(Avara('פַּ', nekudaPataj + "21"));
    pataj.add(Avara('פַ', nekudaPataj + "22"));
    pataj.add(Avara('צַ', nekudaPataj + "24"));
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
    segol.add(Avara('לֶ', nekudaSegol + "14"));
    segol.add(Avara('מֶ', nekudaSegol + "15"));
    segol.add(Avara('נֶ', nekudaSegol + "17"));
    segol.add(Avara('סֶ', nekudaSegol + "19"));
    segol.add(Avara('עֶ', nekudaSegol + "20"));
    segol.add(Avara('פֶּ', nekudaSegol + "21"));
    segol.add(Avara('פֶ', nekudaSegol + "22"));
    segol.add(Avara('צֶ', nekudaSegol + "24"));
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
    tzeire.add(Avara('לֵ', nekudaTzeire + "14"));
    tzeire.add(Avara('מֵ', nekudaTzeire + "15"));
    tzeire.add(Avara('נֵ', nekudaTzeire + "17"));
    tzeire.add(Avara('סֵ', nekudaTzeire + "19"));
    tzeire.add(Avara('עֵ', nekudaTzeire + "20"));
    tzeire.add(Avara('פֵּ', nekudaTzeire + "21"));
    tzeire.add(Avara('פֵ', nekudaTzeire + "22"));
    tzeire.add(Avara('צֵ', nekudaTzeire + "24"));
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
    shuruk.add(Avara('לוּ', nekudaShuruk + "14"));
    shuruk.add(Avara('מוּ', nekudaShuruk + "15"));
    shuruk.add(Avara('נוּ', nekudaShuruk + "17"));
    shuruk.add(Avara('סוּ', nekudaShuruk + "19"));
    shuruk.add(Avara('עוּ', nekudaShuruk + "20"));
    shuruk.add(Avara('פּוּ', nekudaShuruk + "21"));
    shuruk.add(Avara('פוּ', nekudaShuruk + "22"));
    shuruk.add(Avara('צוּ', nekudaShuruk + "24"));
    shuruk.add(Avara('קוּ', nekudaShuruk + "26"));
    shuruk.add(Avara('רוּ', nekudaShuruk + "27"));
    shuruk.add(Avara('שׁוּ', nekudaShuruk + "28"));
    shuruk.add(Avara('שׂוּ', nekudaShuruk + "29"));
    shuruk.add(Avara('תוּ', nekudaShuruk + "31"));
    shuruk.add(Avara('תּוּ', nekudaShuruk + "30"));

    kubutz.add(Avara('אֻ', nekudaShuruk + "00"));
    kubutz.add(Avara('בֻּ', nekudaShuruk + "01"));
    kubutz.add(Avara('בֻ', nekudaShuruk + "02"));
    kubutz.add(Avara('גֻ', nekudaShuruk + "03"));
    kubutz.add(Avara('דֻ', nekudaShuruk + "04"));
    kubutz.add(Avara('הֻ', nekudaShuruk + "05"));
    kubutz.add(Avara('וֻ', nekudaShuruk + "02"));
    kubutz.add(Avara('זֻ', nekudaShuruk + "07"));
    kubutz.add(Avara('חֻ', nekudaShuruk + "08"));
    kubutz.add(Avara('טֻ', nekudaShuruk + "09"));
    kubutz.add(Avara('יֻ', nekudaShuruk + "10"));
    kubutz.add(Avara('כֻּ', nekudaShuruk + "11"));
    kubutz.add(Avara('כֻ', nekudaShuruk + "12"));
    kubutz.add(Avara('לֻ', nekudaShuruk + "14"));
    kubutz.add(Avara('מֻ', nekudaShuruk + "15"));
    kubutz.add(Avara('נֻ', nekudaShuruk + "17"));
    kubutz.add(Avara('סֻ', nekudaShuruk + "19"));
    kubutz.add(Avara('עֻ', nekudaShuruk + "20"));
    kubutz.add(Avara('פֻּ', nekudaShuruk + "21"));
    kubutz.add(Avara('פֻ', nekudaShuruk + "22"));
    kubutz.add(Avara('צֻ', nekudaShuruk + "24"));
    kubutz.add(Avara('קֻ', nekudaShuruk + "26"));
    kubutz.add(Avara('רֻ', nekudaShuruk + "27"));
    kubutz.add(Avara('שֻׁ', nekudaShuruk + "28"));
    kubutz.add(Avara('שֻׂ', nekudaShuruk + "29"));
    kubutz.add(Avara('תֻ', nekudaShuruk + "31"));
    kubutz.add(Avara('תֻּ', nekudaShuruk + "30"));

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
    joilom.add(Avara('לֹ', nekudaJoilom + "14"));
    joilom.add(Avara('מֹ', nekudaJoilom + "15"));
    joilom.add(Avara('נֹ', nekudaJoilom + "17"));
    joilom.add(Avara('סֹ', nekudaJoilom + "19"));
    joilom.add(Avara('עֹ', nekudaJoilom + "20"));
    joilom.add(Avara('פֹּ', nekudaJoilom + "21"));
    joilom.add(Avara('פֹ', nekudaJoilom + "22"));
    joilom.add(Avara('צֹ', nekudaJoilom + "24"));
    joilom.add(Avara('קֹ', nekudaJoilom + "26"));
    joilom.add(Avara('רֹ', nekudaJoilom + "27"));
    joilom.add(Avara('שֹׁ', nekudaJoilom + "28"));
    joilom.add(Avara('שֹׂ', nekudaJoilom + "29"));
    joilom.add(Avara('תֹ', nekudaJoilom + "31"));
    joilom.add(Avara('תֹּ', nekudaJoilom + "30"));

    joilomMole.add(Avara('אוֹ', nekudaJoilom + "00"));
    joilomMole.add(Avara('בּוֹ', nekudaJoilom + "01"));
    joilomMole.add(Avara('בוֹ', nekudaJoilom + "02"));
    joilomMole.add(Avara('גוֹ', nekudaJoilom + "03"));
    joilomMole.add(Avara('דוֹ', nekudaJoilom + "04"));
    joilomMole.add(Avara('הוֹ', nekudaJoilom + "05"));
    joilomMole.add(Avara('ווֹ', nekudaJoilom + "02"));
    joilomMole.add(Avara('זוֹ', nekudaJoilom + "07"));
    joilomMole.add(Avara('חוֹ', nekudaJoilom + "08"));
    joilomMole.add(Avara('טוֹ', nekudaJoilom + "09"));
    joilomMole.add(Avara('יוֹ', nekudaJoilom + "10"));
    joilomMole.add(Avara('כּוֹ', nekudaJoilom + "11"));
    joilomMole.add(Avara('כוֹ', nekudaJoilom + "12"));
    joilomMole.add(Avara('לוֹ', nekudaJoilom + "14"));
    joilomMole.add(Avara('מוֹ', nekudaJoilom + "15"));
    joilomMole.add(Avara('נוֹ', nekudaJoilom + "17"));
    joilomMole.add(Avara('סוֹ', nekudaJoilom + "19"));
    joilomMole.add(Avara('עוֹ', nekudaJoilom + "20"));
    joilomMole.add(Avara('פּוֹ', nekudaJoilom + "21"));
    joilomMole.add(Avara('פוֹ', nekudaJoilom + "22"));
    joilomMole.add(Avara('צוֹ', nekudaJoilom + "24"));
    joilomMole.add(Avara('קוֹ', nekudaJoilom + "26"));
    joilomMole.add(Avara('רוֹ', nekudaJoilom + "27"));
    joilomMole.add(Avara('שׁוֹ', nekudaJoilom + "28"));
    joilomMole.add(Avara('שׂוֹ', nekudaJoilom + "29"));
    joilomMole.add(Avara('תוֹ', nekudaJoilom + "31"));
    joilomMole.add(Avara('תּוֹ', nekudaJoilom + "30"));

    jirik.add(Avara('אִ', nekudaJirik + "00"));
    jirik.add(Avara('בִּ', nekudaJirik + "01"));
    jirik.add(Avara('בִ', nekudaJirik + "02"));
    jirik.add(Avara('גִ', nekudaJirik + "03"));
    jirik.add(Avara('דִ', nekudaJirik + "04"));
    jirik.add(Avara('הִ', nekudaJirik + "05"));
    jirik.add(Avara('וִ', nekudaJirik + "02"));
    jirik.add(Avara('זִ', nekudaJirik + "07"));
    jirik.add(Avara('חִ', nekudaJirik + "08"));
    jirik.add(Avara('טִ', nekudaJirik + "09"));
    jirik.add(Avara('יִ', nekudaJirik + "10"));
    jirik.add(Avara('כִּ', nekudaJirik + "11"));
    jirik.add(Avara('כִ', nekudaJirik + "12"));
    jirik.add(Avara('לִ', nekudaJirik + "14"));
    jirik.add(Avara('מִ', nekudaJirik + "15"));
    jirik.add(Avara('נִ', nekudaJirik + "17"));
    jirik.add(Avara('סִ', nekudaJirik + "19"));
    jirik.add(Avara('עִ', nekudaJirik + "20"));
    jirik.add(Avara('פִּ', nekudaJirik + "21"));
    jirik.add(Avara('פִ', nekudaJirik + "22"));
    jirik.add(Avara('צִ', nekudaJirik + "24"));
    jirik.add(Avara('קִ', nekudaJirik + "26"));
    jirik.add(Avara('רִ', nekudaJirik + "27"));
    jirik.add(Avara('שִׁ', nekudaJirik + "28"));
    jirik.add(Avara('שִׂ', nekudaJirik + "29"));
    jirik.add(Avara('תִ', nekudaJirik + "31"));
    jirik.add(Avara('תִּ', nekudaJirik + "30"));




    shevo.add(Avara('אְ', nekudaShevo + "00"));
    shevo.add(Avara('בְּ', nekudaShevo + "01"));
    shevo.add(Avara('בְ', nekudaShevo + "02"));
    shevo.add(Avara('גְ', nekudaShevo + "03"));
    shevo.add(Avara('דְ', nekudaShevo + "04"));
    shevo.add(Avara('הְ', nekudaShevo + "05"));
    shevo.add(Avara('וְ', nekudaShevo + "06"));
    shevo.add(Avara('זְ', nekudaShevo + "07"));
    shevo.add(Avara('חְ', nekudaShevo + "08"));
    shevo.add(Avara('טְ', nekudaShevo + "09"));
    shevo.add(Avara('יְ', nekudaShevo + "10"));
    shevo.add(Avara('כְּ', nekudaShevo + "11"));
    shevo.add(Avara('כְ', nekudaShevo + "12"));
    shevo.add(Avara('לְ', nekudaShevo + "14"));
    shevo.add(Avara('מְ', nekudaShevo + "15"));
    shevo.add(Avara('נְ', nekudaShevo + "17"));
    shevo.add(Avara('סְ', nekudaShevo + "19"));
    shevo.add(Avara('עְ', nekudaShevo + "20"));
    shevo.add(Avara('פְּ', nekudaShevo + "21"));
    shevo.add(Avara('פְ', nekudaShevo + "22"));
    shevo.add(Avara('צְ', nekudaShevo + "24"));
    shevo.add(Avara('קְ', nekudaShevo + "26"));
    shevo.add(Avara('רְ', nekudaShevo + "27"));
    shevo.add(Avara('שְׁ', nekudaShevo + "28"));
    shevo.add(Avara('שְׂ', nekudaShevo + "29"));
    shevo.add(Avara('תְ', nekudaShevo + "31"));
    shevo.add(Avara('תְּ', nekudaShevo + "30"));

    workingAvara.addAll(komatz);
  }



  List<Avara> _getAvaraList(Nekuda nekuda) {
    String n = nekuda.sound.substring(1, 3);

    switch (n) {
      case "00":
        return komatz;
      case "01":
        return pataj;
      case "02":
        return tzeire;
      case "03":
        return segol;
      case "07":
        return shuruk;
      case "04":
        return kubutz;
      case "05":
        return joilom;
      case "09":
        return joilomMole;
      case "06":
        return jirik;
      case "08":
        return shevo;
    }

    return komatz;
  }


  void clearSelected() {
    selectedLetters.clear();
  }


  Avara getAvara(Ois ois, Nekuda nekuda) {
    List<Avara> _list = _getAvaraList(nekuda);

    // find the proper avara in the list
    int index = _list.indexWhere((element) => element.sound.substring(3, 5).contains(ois.sound.substring(1, 3)));
    return _list[index];
  }


}



class Nekuda {
  final String nekuda;
  late String sound;
  final String withAlef;

  Nekuda(this.nekuda, this.sound, this.withAlef) {
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

    nekudos.add(Nekuda('ָ ', "00", "אָ")); // komatz
    nekudos.add(Nekuda('ַ ', "01", "אַ")); // pataj
    nekudos.add(Nekuda('ֵ ', "02", "אֵ")); // tzeire
    nekudos.add(Nekuda('ֶ ', "03", "אֶ")); // segol
    nekudos.add(Nekuda('ֻ ', "04", "אֻ")); // shuruk
    nekudos.add(Nekuda('ֹ ', "05", "אֹ")); // joilom
    nekudos.add(Nekuda('ִ ', "06", "אִ")); // jirik
    nekudos.add(Nekuda("וּ", "07", "אוּ")); // kubutz
    nekudos.add(Nekuda('ֹו', "09", "אוֹ")); // Joilom Molei
    nekudos.add(Nekuda('ְ ', "08", "אְ")); // shvo


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

  void arrange({bool notify = true}) {
    workingNekudos.clear();
    workingNekudos.addAll(nekudos);
    if (notify) {
      notifyListeners();
    }
  }

}



enum LetterType {
  allLetters,
  someLetters,
}



class WidgetLetters extends StatefulWidget {
  const WidgetLetters({Key? key, required this.title, required this.type, this.repetition = 1}) : super(key: key);

  final String title;
  final LetterType type;
  final int repetition;

  @override
  State<WidgetLetters> createState() => _WidgetLettersState();
}

class _WidgetLettersState extends State<WidgetLetters> {
  
  
  @override
  Widget build(BuildContext context) {

    OisProvider _oisProvider = Provider.of<OisProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: globalColor,
      appBar: buildAppBar(context, widget.title),
      body: Consumer<OisProvider>(builder: (context, oisProvider, child) {

        List _list = [];

        switch (widget.type) {
          case LetterType.allLetters:
            _list = oisProvider.get();
            break;

          case LetterType.someLetters:
            _list = oisProvider.getSelected(widget.repetition);
            break;
        }

        List<Widget> wl = [];
        for (int i = 0; i < _list.length; i++) {
          wl.add(buildOis(oisProvider, _list[i]));
        }

        return SingleChildScrollView(
            child: Center(
              child: Wrap(
                textDirection: TextDirection.rtl,
                alignment: WrapAlignment.center,
                children: wl,
          ),
            ),
        );
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: buildFloatingBar(_oisProvider),
      ),
    );
  }



  List<Widget> buildFloatingBar(OisProvider oisProvider) {
    List<Widget> wl = [];

    wl.add(FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          switch (widget.type) {
            case LetterType.allLetters:
              oisProvider.shuffle();
              break;

            case LetterType.someLetters:
              oisProvider.shuffleSelected();
              break;
          }
        },
        heroTag: 0,
        child: const Icon(Icons.shuffle)));

    wl.add(const SizedBox(width: 10));

    if (widget.type == LetterType.allLetters) {
      wl.add(FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            oisProvider.arrange();
          },
          heroTag: 1,
          child: const Icon(Icons.straight)));
    }

    return wl;
  }


  Widget buildOis(OisProvider oisProvider, Ois ois) {

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () async {
        oisProvider.play(ois);
        await dialogScreen(context, ois.ois, ois.sound);
      },
      child: Text(ois.ois,
          style: TextStyle(
            fontFamily: globalFontFamily,
            fontSize: globalFontSize,
            color: getColor(),
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
      appBar: buildAppBar(context, widget.title),
      body: Consumer<NekudaProvider>(builder: (context, nekudaProvider, child) {
        List _list = nekudaProvider.get();

        List<Widget> wl = [];
        for (int i = 0; i < _list.length; i++) {
          wl.add(buildNekuda(nekudaProvider, _list[i]));
        }

        wl.add(const SizedBox(height: 15,));
        wl.add(buildNekudosTable());

        return SingleChildScrollView(
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

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () async {
        nekudaProvider.play(nekuda);
        await dialogScreen(context, nekuda.withAlef, nekuda.sound);
      },
      child: Text(nekuda.nekuda,
          style: TextStyle(
            fontFamily: globalFontFamily,
            fontSize: globalFontSize,
            color: getColor(),
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
    _oisProvider.arrange(notify: false);

    _nekudaProvider = Provider.of<NekudaProvider>(context, listen: false);
    _nekudaProvider.arrange(notify: false);

    _avaraProvider = Provider.of<AvaraProvider>(context, listen: false);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: globalColor,
        appBar: buildAppBar(context, widget.title),
        body: buildAvaros(),
      );
    }



    Widget buildAvaros() {

      List<Ois> letters = _oisProvider.get();
      List<Nekuda> nekudos = _nekudaProvider.get();

      List<Widget> wl1 = [];
      List<Widget> wl2 = [];

      String spanish = "Para escuchar la combinación de letras con puntuaciones presiona primero una pronunciación y luego la letra.";
      String english = "To hear the combination of letters with punctuation, first press the pronunciacion and then the letter.";
      wl1.add(buildDescriptions(spanish: spanish, english: english));
      wl1.add(const SizedBox(height: 15));

      for (int i = 0; i < letters.length; i++) {
        wl1.add(TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () async {
            _oisProvider.play(letters[i]);

            if (!_oisProvider.isEnde(letters[i])) {
              if (wasNekudaPressed && !_oisProvider.isEnde(letters[i])) {
                await Future.delayed(const Duration(milliseconds: 900));
                _avaraProvider.play(letters[i], nekudaPressed);
                wasNekudaPressed = false;

                Avara avara = _avaraProvider.getAvara(letters[i], nekudaPressed);
                await dialogScreen(context, avara.avara, avara.sound);
              }
            } else {
              wasNekudaPressed = false;
            }
          },
          child: Text(letters[i].ois,
              style: TextStyle(
                fontFamily: globalFontFamily,
                fontSize: globalFontSize,
                color: getColor(),
                shadows: const [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Colors.black,
                  ),
                ],
              )),
        ));

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
                fontFamily: globalFontFamily,
                fontSize: globalFontSize,
                color: getColor(),
                shadows: const [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Colors.black,
                  ),
                ],
              )),
        ));

      }

      wl2.add(const SizedBox(height: 20,));

      return Center(
        child: SingleChildScrollView(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      textDirection: TextDirection.rtl,
                      alignment: WrapAlignment.center,
              children: wl1,
            ),

                  const SizedBox(height: 10,),
                  Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      textDirection: TextDirection.rtl,
                      alignment: WrapAlignment.center,
                      children: wl2,
                    ),

                ]),
          ),
      );

  }
}


/*
 * This functions actually shows a letter or avara
 */
Future dialogScreen(BuildContext context, String text, String sound) async {

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
                text,
                style: const TextStyle(
                  fontSize: 300,
                  fontFamily: globalFontFamily,
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
                    play(sound);
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






enum AvaraType {
  allAvaros,
  someAvaros,
}



class WidgetAvarosExercise extends StatefulWidget {
  const WidgetAvarosExercise({Key? key, required this.title, required this.type, this.repetition = 1, this.avara = Avaros.nekudaKomatz}) : super(key: key);

  final String title;
  final AvaraType type;
  final int repetition;
  final Avaros avara;

  @override
  State<WidgetAvarosExercise> createState() => _WidgetAvarosExerciseState();
}

class _WidgetAvarosExerciseState extends State<WidgetAvarosExercise> {


  @override
  Widget build(BuildContext context) {

    AvaraProvider _avaraProvider = Provider.of<AvaraProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: globalColor,
      appBar: buildAppBar(context, widget.title),
      body: Consumer<AvaraProvider>(builder: (context, avaraProvider, child) {

        List _list = [];

        switch (widget.type) {
          case AvaraType.allAvaros:
            _list = avaraProvider.get(widget.avara);
            break;

          case AvaraType.someAvaros:
            _list = avaraProvider.getSelected(widget.repetition);
            break;
        }

        List<Widget> wl = [];
        for (int i = 0; i < _list.length; i++) {
          wl.add(buildAvara(avaraProvider, _list[i]));
        }

        return SingleChildScrollView(
          child: Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              textDirection: TextDirection.rtl,
              alignment: WrapAlignment.center,
              children: wl,
            ),
          ),
        );
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: buildFloatingBar(_avaraProvider),
      ),
    );
  }



  List<Widget> buildFloatingBar(AvaraProvider avaraProvider) {
    List<Widget> wl = [];

    wl.add(FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          switch (widget.type) {
            case AvaraType.allAvaros:
              avaraProvider.shuffle(widget.avara);
              break;

            case AvaraType.someAvaros:
              avaraProvider.shuffleSelected();
              break;
          }
        },
        heroTag: 0,
        child: const Icon(Icons.shuffle)));

    wl.add(const SizedBox(width: 10));

    if (widget.type == AvaraType.allAvaros) {
      wl.add(FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            avaraProvider.arrange(widget.avara);
          },
          heroTag: 1,
          child: const Icon(Icons.straight)));
    }

    return wl;
  }


  Widget buildAvara(AvaraProvider avaraProvider, Avara avara) {

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () async {
        avaraProvider.playSound(avara);
        await dialogScreen(context, avara.avara, avara.sound);
      },
      child: Text(avara.avara,
          style: TextStyle(
            fontFamily: globalFontFamily,
            fontSize: globalFontSize,
            color: getColor(),
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



