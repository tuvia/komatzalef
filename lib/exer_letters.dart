import 'package:flutter/material.dart';
import 'package:komatzalef/letters.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import 'globals.dart';




/*
 * Different Exercises
 */
const List<ScreenDefinition> exerciseList = [
  ScreenDefinition(WidgetExerciseLetters(title:  "אבג"), "אבג", Colors.red, Colors.amber),
  ScreenDefinition(WidgetExerciseAvara(title:  "אָ", avara: Avaros.nekudaKomatz,), "אָ", Colors.blue, Colors.lime),
  ScreenDefinition(WidgetExerciseAvara(title:  "אַ", avara: Avaros.nekudaPataj,), "אַ", Colors.green, Colors.pink),
  ScreenDefinition(WidgetExerciseAvara(title:  "אֵ", avara: Avaros.nekudaTzeire,), "אֵ", Colors.deepPurpleAccent, Colors.orange),
  ScreenDefinition(WidgetExerciseAvara(title:  "אֶ", avara: Avaros.nekudaSegol,), "אֶ", Colors.grey, Colors.cyan),
  ScreenDefinition(WidgetExerciseAvara(title:  "אֹ", avara: Avaros.nekudaJoilom,), "אֹ", Colors.lightBlue, Colors.teal),
  ScreenDefinition(WidgetExerciseAvara(title:  'אוֹ', avara: Avaros.nekudaJoilomMole,), 'אוֹ', Colors.lightBlue, Colors.teal),
  ScreenDefinition(WidgetExerciseAvara(title:  "אִ", avara: Avaros.nekudaJirik,), "אִ", Colors.lightBlue, Colors.teal),
  ScreenDefinition(WidgetExerciseAvara(title:  "אוּ", avara: Avaros.nekudaShuruk,),  "אוּ", Colors.lightBlue, Colors.teal),
  ScreenDefinition(WidgetExerciseAvara(title:  'אֻ', avara: Avaros.nekudaKubutz,), 'אֻ', Colors.lightBlue, Colors.teal),
];



class WidgetExercise extends StatelessWidget {
  const WidgetExercise({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColor,
      appBar: buildAppBar(context, title),
      body:
      Container(
          padding: const EdgeInsets.all(globalInset),
          child: buildScreenButtons(exerciseList)),
    );
  }
}





class WidgetExerciseLetters extends StatefulWidget {
  const WidgetExerciseLetters({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WidgetExerciseLetters> createState() => _WidgetExerciseLettersState();
}

class _WidgetExerciseLettersState extends State<WidgetExerciseLetters> {

  int repetition = 1;

  @override
  void initState() {
    Provider.of<OisProvider>(context, listen: false).unselectAll(notify: false);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: globalColor,
        appBar: buildAppBar(context, widget.title),
        body: Consumer<OisProvider>(builder: (context, oisProvider, child) {
          List _list = oisProvider.get();

          List<Widget> wl = [];

          wl.add(
              buildDescriptions(
                  english: 'Select how many repetitions of each letter',
                  spanish: 'Elige cuántas repeticiones de cada letra')
          );

          wl.add(const SizedBox(height: 5,));

          wl.add(NumberPicker(
            textStyle: TextStyle(
              fontFamily: globalFontFamily,
              fontSize: 40,
              color: Colors.blue.shade200
            ),
            selectedTextStyle: const TextStyle(
              fontFamily: globalFontFamily,
              fontSize: 60,
              color: Colors.blue
            ),
            itemHeight: 100,
            axis: Axis.horizontal,
            value: repetition,
            minValue: 1,
            maxValue: 15,
            onChanged: (value) => setState(() => repetition = value),
          ));

          wl.add(const SizedBox(height: 10,));

          wl.add(
              buildDescriptions(
                  english: 'Select which letters exercise',
                  spanish: 'Elige qué letras ejercitar')
          );

          wl.add(const SizedBox(height: 10,));

          wl.add(Padding(
            padding: const EdgeInsets.only(right: 32),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  oisProvider.unselectAll();
                },
              ),
            ),
          ));

          wl.add(const SizedBox(height: 5,));

          for (int i = 0; i < _list.length; i++) {
            wl.add(Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CheckboxListTile(
                title: Text(_list[i].ois,
                    style: const TextStyle(
                      fontFamily: globalFontFamily,
                      fontSize: globalFontSize,
                    )),

                value: oisProvider.isSelected(_list[i]),
                onChanged: (value) {
                  value as bool ? oisProvider.select(_list[i]) : oisProvider.unselect(_list[i]);
                },
              ),
            ));
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
      floatingActionButton:
        FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {
            if (Provider.of<OisProvider>(context, listen: false).getSelectedCount() > 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      WidgetLetters(
                        title: "אבג",
                        type: LetterType.someLetters,
                        repetition: repetition,
                      )));
              }
            },
        ),
    );

    // show a list of letters to select which letters use in the exercise

  }

}








class WidgetExerciseAvara extends StatefulWidget {
  const WidgetExerciseAvara({Key? key, required this.title, required this.avara}) : super(key: key);

  final String title;
  final Avaros avara;

  @override
  State<WidgetExerciseAvara> createState() => _WidgetExerciseAvaraState();
}

class _WidgetExerciseAvaraState extends State<WidgetExerciseAvara> {

  int repetition = 1;

  @override
  void initState() {
    Provider.of<AvaraProvider>(context, listen: false).clearSelected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: globalColor,
      appBar: buildAppBar(context, widget.title),
      body: Consumer<AvaraProvider>(builder: (context, avaraProvider, child) {
        List _list = avaraProvider.get(widget.avara);

        List<Widget> wl = [];

        wl.add(
            buildDescriptions(
                english: 'Select how many repetitions of each avara',
                spanish: 'Elige cuántas repeticiones de cada avara')
        );

        wl.add(const SizedBox(height: 5,));

        wl.add(NumberPicker(
          textStyle: TextStyle(
              fontFamily: globalFontFamily,
              fontSize: 40,
              color: Colors.blue.shade200
          ),
          selectedTextStyle: const TextStyle(
              fontFamily: globalFontFamily,
              fontSize: 60,
              color: Colors.blue
          ),
          itemHeight: 100,
          axis: Axis.horizontal,
          value: repetition,
          minValue: 1,
          maxValue: 15,
          onChanged: (value) => setState(() => repetition = value),
        ));

        wl.add(const SizedBox(height: 10,));

        wl.add(
            buildDescriptions(
                english: 'Select which letters exercise',
                spanish: 'Elige qué letras ejercitar')
        );

        wl.add(const SizedBox(height: 10,));

        wl.add(Padding(
          padding: const EdgeInsets.only(right: 32),
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                avaraProvider.unselectAll();
              },
            ),
          ),
        ));

        wl.add(const SizedBox(height: 5,));

        for (int i = 0; i < _list.length; i++) {
          wl.add(Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CheckboxListTile(
              title: Text(_list[i].avara,
                  style: const TextStyle(
                    fontFamily: globalFontFamily,
                    fontSize: globalFontSize,
                  )),

              value: avaraProvider.isSelected(_list[i]),
              onChanged: (value) {
                value as bool ? avaraProvider.select(_list[i]) : avaraProvider.unselect(_list[i]);
              },
            ),
          ));
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
      floatingActionButton:
      FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          if (Provider.of<AvaraProvider>(context, listen: false).getSelectedCount() > 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WidgetAvarosExercise(
                          title: widget.title,
                          type: AvaraType.someAvaros,
                          repetition: repetition,
                        )));
          }
        },
      ),
    );

  }


}



